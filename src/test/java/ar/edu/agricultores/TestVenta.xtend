package ar.edu.agricultores

import ar.edu.agricultores.venta.CompradorExtranjero
import ar.edu.agricultores.venta.CompradorNacional
import ar.edu.agricultores.venta.Venta
import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestVenta {
	
	Parcela parcela50
	Venta ventaNacional
	Venta ventaExportacion
	
	@Before
	def void init() {
		parcela50 = new Parcela(50, new Sorgo)	
		
		ventaNacional = new Venta => [
			cantidadKilos = 12
			fechaVenta = new Date
			parcela = parcela50
			// Cambio del refactor
			comprador = new CompradorNacional
		]
		//

		ventaExportacion = new Venta => [
			cantidadKilos = 11
			fechaVenta = new Date
			parcela = parcela50
			// Cambio del refactor
			comprador = new CompradorExtranjero
		]
	}

	// PUNTO 3
	@Test
	def testVentaCompradorNacionalMenos500Kilos() {
		Assert.assertEquals(240, ventaNacional.precio, 0.1)
	}
		
	@Test
	def testVentaCompradorNacionalMas500Kilos() {
		ventaNacional.cantidadKilos = 600
		Assert.assertEquals(13200, ventaNacional.precio, 0.1)
	}

	@Test
	def testVentaCompradorExtranjero() {
		Assert.assertEquals(308, ventaExportacion.precio, 0.1)
	}
		
}