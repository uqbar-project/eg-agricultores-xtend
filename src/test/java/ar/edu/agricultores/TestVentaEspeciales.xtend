package ar.edu.agricultores

import java.util.Date
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dada una venta especial")
class TestVentaEspeciales {
	
	Venta ventaEspecial
	Sorgo sorgo
	
	@BeforeEach
	def void init() {
		sorgo = new Sorgo
		val parcela = new Parcela(50, sorgo)
		
		ventaEspecial = new Venta
		ventaEspecial.cantidadKilos = 12
		ventaEspecial.tipoComprador = "S"
		ventaEspecial.fechaVenta = new Date
		ventaEspecial.parcela = parcela
	}

	// PUNTO 3
	
	@Test
	@DisplayName("si involucra un cultivo sin recargo no se le cobra adicional")
	def testVentaEspecialCultivosSinRecargo() {
		ventaEspecial.agregarCultivoSinRecargo(sorgo)
		assertEquals(240, ventaEspecial.precio, 0.01)
	}
		
	@Test
	@DisplayName("por defecto se les cobra un adicional a los cultivos")
	def testVentaEspecialCultivosConRecargo() {
		assertEquals(252, ventaEspecial.precio, 0.01)
	}

}