package ar.edu.agricultores

import java.util.Date
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dada una venta de exportación")
class TestVentaExportacion {
	
	Venta ventaExportacion
	
	@BeforeEach
	def void init() {
		val parcela = new Parcela(50, new Sorgo)	
		
		ventaExportacion = new Venta
		ventaExportacion.cantidadKilos = 11
		ventaExportacion.tipoComprador = "E"
		ventaExportacion.fechaVenta = new Date
		ventaExportacion.parcela = parcela 
	}

	// PUNTO 3
	
	@Test
	@DisplayName("el coeficiente de ajuste es fijo para todos los compradores extranjeros")
	def testVentaCompradorExtranjero() {
		assertEquals(308, ventaExportacion.precio, 0.1)
	}

}