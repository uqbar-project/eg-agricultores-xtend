package ar.edu.agricultores

import ar.edu.agricultores.venta.CompradorEspecial
import ar.edu.agricultores.venta.Venta
import java.util.Date
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dada una venta especial")
class TestVentaEspeciales {
	
	Venta ventaEspecial
	CompradorEspecial compradorEspecial
	Sorgo sorgo
	
	@BeforeEach
	def void init() {
		sorgo = new Sorgo
		compradorEspecial = new CompradorEspecial
		
		ventaEspecial = new Venta => [
			cantidadKilos = 12
			comprador = compradorEspecial
			fechaVenta = new Date
			parcela = new Parcela(50, sorgo)
		]
	}

	// PUNTO 3
	
	@Test
	@DisplayName("si involucra un cultivo sin recargo no se le cobra adicional")
	def testVentaEspecialCultivosSinRecargo() {
		compradorEspecial.agregarCultivoSinRecargo(sorgo)
		assertEquals(240, ventaEspecial.precio, 0.01)
	}
		
	@Test
	@DisplayName("por defecto se les cobra un adicional a los cultivos")
	def testVentaEspecialCultivosConRecargo() {
		assertEquals(252, ventaEspecial.precio, 0.01)
	}

}