package ar.edu.agricultores.venta

import ar.edu.agricultores.Cultivo
import java.util.List

class CompradorEspecial extends Comprador {
	
	List<Cultivo> cultivosExentos = newArrayList
	
	override coeficienteAjuste(Venta venta) {
		if (cultivosExentos.contains(venta.cultivo)) 0.1 else 0
	}
		
}