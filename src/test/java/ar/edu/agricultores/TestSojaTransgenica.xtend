package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un cultivo de Soja Transgénica")
class TestSojaTransgenica {
	
	Parcela parcelaConMutacionesGeneticas
	Parcela parcelaSinMutacionesGeneticas
	
	@BeforeEach
	def void init() {
		parcelaConMutacionesGeneticas = new Parcela(50, new SojaTransgenica(true))	
		parcelaSinMutacionesGeneticas = new Parcela(200, new SojaTransgenica(false))
	}
	
	// PUNTO 1
	
	@Test
	@DisplayName("el costo de su cultivo está en función del tamaño de la parcela")
	def testCostoSojaTransgenica() {
		assertEquals(500, parcelaConMutacionesGeneticas.costoTotal, 0.01)
	}	
	
	// PUNTO 2
	
	@Test
	@DisplayName("el precio de venta cuando tiene mutaciones genéticas es la mitad del precio que se calcula para la soja")
	def testVentaSojaConMutacionesGeneticas() {
		assertEquals(2500, parcelaConMutacionesGeneticas.precioVenta, 0.01)
	}		

	@Test
	@DisplayName("el precio de venta cuando no tiene mutaciones genéticas es similar al de la soja")
	def testVentaSojaSinMutacionesGeneticas() {
		assertEquals(20000, parcelaSinMutacionesGeneticas.precioVenta, 0.01)
	}	
	
}