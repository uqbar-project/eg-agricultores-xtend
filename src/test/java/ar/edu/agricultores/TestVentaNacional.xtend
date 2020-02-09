package ar.edu.agricultores

import java.util.Date
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dada una venta nacional")
class TestVentaNacional {
	
	Venta ventaNacional
	
	@BeforeEach
	def void init() {
		val parcela = new Parcela(50, new Sorgo)	
		
		ventaNacional = new Venta
		ventaNacional.cantidadKilos = 12
		ventaNacional.tipoComprador = "N"
		ventaNacional.fechaVenta = new Date
		ventaNacional.parcela = parcela 
	}

	// PUNTO 3
	
	@Test
	@DisplayName("si involucra menos de 500 kilos no se les cobra recargo")
	def testVentaCompradorNacionalMenos500Kilos() {
		assertEquals(240, ventaNacional.precio, 0.01)
	}
		
	@Test
	@DisplayName("si involucra más de 500 kilos se les cobra un recargo extra")
	def testVentaCompradorNacionalMas500Kilos() {
		ventaNacional.cantidadKilos = 600
		assertEquals(13200, ventaNacional.precio, 0.01)
	}

}