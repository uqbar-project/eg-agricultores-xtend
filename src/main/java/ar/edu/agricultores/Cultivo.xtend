package ar.edu.agricultores

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Cultivo {
	
	List<Conservante> conservantes = newArrayList
	
	// PUNTO 1
	def double costo(int cantidadHectareasCultivadas)

	// PUNTO 2
	def boolean esSoja() {
		false
	}
	
}