package ar.edu.agricultores

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Agricultor {
	
	@Accessors(PUBLIC_GETTER)
	List<Parcela> parcelas = newArrayList
	
	def void agregarParcela(Parcela parcela) {
		parcelas.add(parcela)
	}	

}
