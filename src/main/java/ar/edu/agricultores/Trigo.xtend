package ar.edu.agricultores

import java.util.List

import static extension util.NumberUtil.*

class Trigo extends Cultivo {

	List<Conservante> conservantes = newArrayList

	// PUNTO 1
	override double costoPara(Parcela parcela) {
		// Uso del extension method
		// se envía un mensaje min a un double !
		super.costoPara(parcela).min(500)
	}

	override costoBasePorHectarea(Parcela parcela) {
		5
	}

	// PUNTO 2
	override precioVentaPorKg(Parcela parcela) {
		super.precioVentaPorKg(parcela) - this.costoConservantes
	}

	def void agregarConservante(Conservante conservante) {
		conservantes.add(conservante)
	}

	def double costoConservantes() {
		conservantes.fold(0d, [acum, conservante|acum + conservante.precio])
	}

	override String toString() {
		"Trigo"
	}

}
