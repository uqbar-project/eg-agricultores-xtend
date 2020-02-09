package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un cultivo de sorgo")
class TestSorgo {
	
	Parcela parcelaChica
	Parcela parcelaGrande
	
	@BeforeEach
	def void init() {
		parcelaChica = new Parcela(40, new Sorgo)	
		parcelaGrande = new Parcela(200, new Sorgo)
	}
	
	// PUNTO 1
	
	@Test
	@DisplayName("el costo de cultivar una parcela chica multiplica por 3")
	def testCostoSorgoParcelaChica() {
		assertEquals(120, parcelaChica.costoTotal, 0.01)
	}

	@Test
	@DisplayName("el costo de cultivar una parcela grande multiplica por 2")
	def testCostoSorgoParcelaGrande() {
		assertEquals(400, parcelaGrande.costoTotal, 0.01)
	}
	
	// PUNTO 2
	
	@Test
	@DisplayName("el precio de venta es fijo")
	def testVentaSorgoParcela() {
		assertEquals(20, parcelaChica.precioVenta, 0.1)
	}		

}