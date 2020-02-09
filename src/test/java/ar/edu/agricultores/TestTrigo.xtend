package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un cultivo de trigo")
class TestTrigo {

	Parcela parcelaGrande
	Parcela parcelaChica
	Parcela parcelaConConservantes
	
	@BeforeEach
	def void init() {
		parcelaChica = new Parcela(50, new Trigo)
		parcelaGrande = new Parcela(200, new Trigo)
		val Trigo cultivoTrigo = new Trigo
		cultivoTrigo.agregarConservante(new Conservante(2, "Glifosato"))
		cultivoTrigo.agregarConservante(new Conservante(5, "Sulfatadina M-150"))
		parcelaConConservantes = new Parcela(50, cultivoTrigo)
	}

	// PUNTO 1
	
	@Test
	@DisplayName("el costo de cultivar una parcela grande tiene un tope máximo")
	def testCostoBaseParcelaGrande() {
		assertEquals(500, parcelaGrande.costoTotal, 0.01)
	}

	@Test
	@DisplayName("el costo de cultivar una parcela chica depende del tamaño de la parcela")
	def testCostoBaseParcelaChica() {
		assertEquals(250, parcelaChica.costoTotal, 0.01)
	}

	// PUNTO 2

	@Test
	@DisplayName("al precio de venta del cultivo se le descuentan los conservantes")
	def testVentaSojaParcelaConConservantes() {
		assertEquals(13, parcelaConConservantes.precioVenta, 0.01)
	}		

	@Test
	@DisplayName("el precio de venta del cultivo sin conservantes depende de los kilos")
	def testVentaSojaParcelaSinConservantes() {
		assertEquals(20, parcelaGrande.precioVenta, 0.01)
	}

}