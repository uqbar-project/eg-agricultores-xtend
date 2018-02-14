
# Ejercicio de Diseño - Agricultores

![image](images/agricultores.png) 

[![Build Status](https://travis-ci.org/uqbar-project/eg-agricultores-xtend.svg?branch=code-smell)](https://travis-ci.org/uqbar-project/eg-agricultores-xtend) [![Coverage Status](https://coveralls.io/repos/github/uqbar-project/eg-agricultores-xtend/badge.svg?branch=code-smell&service=github)](https://coveralls.io/github/uqbar-project/eg-agricultores-xtend?branch=code-smell&service=github)

## Dominio

Se pide modelar una solución para un grupo de agricultores, que tienen parcelas.

Cada parcela tiene

* un tamaño (medido en hectáreas),
* el cultivo que planta,
* la cantidad de hectáreas cultivadas y
* la cantidad (en kilos) de cultivo cosechado, que se guarda en un silo.

Se asume el siguiente circuito:

* El agricultor decide comprar una parcela para cultivar
* Cuando el agricultor siembra sube la cantidad de hectáreas cultivadas
* Cuando el agricultor cosecha disminuye la cantidad de hectáreas cultivadas y sube el silo (en kilos).
* Al vender, baja el silo en kilos (la cantidad cultivada no cambia)
* En algún momento, el agricultor puede decidir cambiar el cultivo de la parcela, para lo cual no debe quedar cantidad cultivada en la parcela ni en el silo.

Tenemos diferentes tipos de cultivo:

* Soja
 * El costo de la soja es de $ 10 por hectárea
 * El precio de venta por kg se calcula como 10 veces el costo x hectárea menos 
una retención de 10% si el tamaño de la parcela supera las 1000 hectáreas.

* Soja transgénica: sabe si el que lo come puede sufrir mutaciones genéticas
 * El costo por hectárea se calcula igual que la soja
 * El precio de venta por kg se calcula igual que la soja o la mitad de ese precio si el que lo come puede sufrir mutaciones genéticas.

* Trigo
 * El costo es de $ 5 por hectárea hasta un máximo de $ 500 (en una parcela de
200 hectáreas el costo es $ 500, en una parcela de 50 hectáreas el costo es $
250)
 * El precio de venta es de $ 20 por kg a los cuales hay que restarle los
conservantes del silo (se conoce el costo por kg de cada conservante).

* Sorgo
 * El costo es de 3 $ por hectárea si la cantidad cultivada es menor a 50 hectáreas
o $ 2 en caso contrario.
 * El precio de venta es de $ 20 por kg.

Cada parcela es administrada por un capataz, quien registra las ventas que se producen en una parcela. De cada venta nos interesa registrar:

* Fecha de venta
* Parcela (que determina el cultivo)
* Cantidad de kilos vendidos
* Comprador

El precio total de la venta se calcula como

```
FV Cantidad kilos vendidos * precio venta x kg según la parcela * % coeficiente de ajuste
```

El coeficiente de ajuste lo determina el comprador:

* A los compradores nacionales se les cobra un % 10 de recargo si la cantidad a comprar supera los 500 kg.
* A los compradores extranjeros se les aplica a todos el mismo coeficiente
* Hay compradores especiales a los que no se les cobra nada determinados cultivos
(determinado por cada comprador especial) o bien es un % 5 de recargo.

En una parcela sólo se tiene un cultivo, no obstante el cultivo puede cambiar. De todas maneras las ventas de esa parcela deben referenciar al cultivo que corresponde (ej: si planté trigo, vendí todo el trigo y ahora quiero plantar soja, en la parcela el cultivo es soja pero las ventas de trigo de esa parcela deben quedar asociadas al cultivo trigo).

Se pide codificar:

1. El costo total del cultivo de una parcela determinada (costo x hectárea por cantidad cultivada en la parcela).

2. El precio de venta del cultivo de una parcela determinada (precio venta x kg).

3. El monto de una venta para una parcela (considerar la fórmula FV).

4. Cuáles son los cultivos de un agricultor, sin repetidos.

5. Saber si un agricultor tiene alguna parcela subutilizada (cuando la cantidad cultivada no llega al 50% del tamaño de la parcela en hectáreas).

6. Registrar una venta de la cantidad de kilos de un cultivo para una parcela a un
comprador x, que debe:

 * Validar que la cantidad a vender no exceda la cantidad del silo (en caso contrario disparar un mensaje de error)
 * Crear un objeto Venta con la fecha de hoy, el cultivo, la cantidad de kilos a vender y el comprador.
 * Asociar la venta a la parcela (según como haya definido que se conozcan).
 * Descontar la cantidad de kilos al silo de dicha parcela.

7. Representar la cosecha de un agricultor, que tiene la siguiente lógica:

 * Cada cultivo sabe cuántos kilos se obtienen por hectárea cultivada (no importa
cómo se obtiene el cálculo, éste depende sólo del cultivo)
 * Se debe aumentar la cantidad de kilos del silo según los kilos obtenidos de cada
cultivo (considerar que el silo es ilimitado en capacidad)
 * Se debe dejar la cantidad cultivada en 0

## Branches

* solución previa a un refactor: **branch [code-smell](https://github.com/uqbar-project/eg-agricultores-xtend/tree/code-smell)**.
* solución refactorizada: **branch [refactoring](https://github.com/uqbar-project/eg-agricultores-xtend/tree/refactoring)**.
   
La solución refactorizada implementa un extension method (al calcular el costo para el trigo), el pattern **Strategy** (tipos de comprador) y un **template method** (costo base de un cultivo)

## Conceptos a ver

* Refactoring
* Patrones Strategy y Template method

