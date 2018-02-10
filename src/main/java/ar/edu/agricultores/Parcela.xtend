package ar.edu.agricultores

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Parcela {

	int hectareas
	Cultivo cultivo
	int hectareasCultivadas
	int cantidadEnSilo

	new(int _hectareas, Cultivo _cultivo) {
		hectareas = _hectareas
		hectareasCultivadas = _hectareas // por default cultivamos todos
		cultivo = _cultivo
	}

	// PUNTO 1
	def double getCostoTotal() {
		cultivo.costoPara(this)
	}

	def boolean sujetaARetencion() {
		hectareas > 1000
	}

	// PUNTO 2
	def double precioVenta() {
		cultivo.precioVentaPorKg(this)
	}
	
	// PUNTO 5
	def estaSubutilizada() {
		hectareasCultivadas / hectareas < 0.5 
	}

}
