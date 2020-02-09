package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un cultivo de Soja")
class TestSoja {
	
	Parcela parcelaChica
	Parcela parcelaGrande
	
	@BeforeEach
	def void init() {
		parcelaChica = new Parcela(300, new Soja)
		parcelaGrande = new Parcela(2000, new Soja)
	}
	
	// PUNTO 1
	
	@Test
	@DisplayName("el costo total de cultivarlo depende del tamaño de la parcela")
	def testCostoSojaParcelaGrande() {
		assertEquals(3000, parcelaChica.costoTotal, 0.1)
	}		

	// PUNTO 2
	@Test
	@DisplayName("el precio de venta del cultivo depende del tamaño de la parcela")
	def testVentaSojaParcelaChica() {
		assertEquals(30000, parcelaChica.precioVenta, 0.1)
	}		

	@Test
	@DisplayName("el precio de venta de una parcela grande está afectado por una retención adicional")
	def testVentaSojaParcelaGrande() {
		assertEquals(180000, parcelaGrande.precioVenta, 0.1)
	}		
		
}