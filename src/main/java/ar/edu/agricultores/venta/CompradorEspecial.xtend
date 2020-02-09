package ar.edu.agricultores.venta

import ar.edu.agricultores.Cultivo
import java.util.List

class CompradorEspecial extends Comprador {
	
	List<Cultivo> cultivosExentos = newArrayList
	
	override coeficienteAjuste(Venta venta) {
		if (cultivosExentos.contains(venta.cultivo)) 0 else 0.05
	}
	
	def agregarCultivoSinRecargo(Cultivo cultivo) {
		cultivosExentos.add(cultivo)
	}
		
}