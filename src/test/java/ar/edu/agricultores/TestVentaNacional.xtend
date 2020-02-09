package ar.edu.agricultores

import ar.edu.agricultores.venta.CompradorNacional
import ar.edu.agricultores.venta.Venta
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
		ventaNacional = new Venta => [
			cantidadKilos = 12
			comprador = new CompradorNacional
			fechaVenta = new Date
			parcela = new Parcela(50, new Sorgo) 
		]
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