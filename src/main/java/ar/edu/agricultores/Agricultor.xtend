package ar.edu.agricultores

import java.util.HashSet
import java.util.List
import java.util.Set

class Agricultor {

	List<Parcela> parcelas = newArrayList

	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}

	/** Otra opción es que cultivos devuelva un Set<String> y mapeemos 
	 * parcela.cultivo.toString()
	 */
	// PUNTO 4
	def Set<Cultivo> cultivos() {
		new HashSet(parcelas.map([parcela|parcela.cultivo]))
	}

	// PUNTO 5
	def algunaParcelaSubutilizada() {
		parcelas.exists[parcela|parcela.estaSubutilizada]
	}

}
