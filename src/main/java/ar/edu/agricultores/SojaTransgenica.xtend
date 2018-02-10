package ar.edu.agricultores

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SojaTransgenica extends Soja {

	boolean puedeSufrirMutaciones
	
	new(boolean _puedeSufrirMutaciones) {
		puedeSufrirMutaciones = _puedeSufrirMutaciones
	}
	
	override precioVentaPorKg(Parcela parcela) {
		super.precioVentaPorKg(parcela) * factorPorMutaciones
	}
	
	def factorPorMutaciones() {
		if (puedeSufrirMutaciones) 0.5 else 1
	}
	
	override String toString() {
		"Soja Transgenica"	
	}
	
}