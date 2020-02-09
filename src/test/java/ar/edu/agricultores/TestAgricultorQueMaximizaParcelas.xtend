package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse

@DisplayName("Dado un agricultor que maximiza parcelas")
class TestAgricultorQueMaximizaParcelas {

	Agricultor agricultorQueMaximizaParcelas

	@BeforeEach
	def void init() {
		agricultorQueMaximizaParcelas = new Agricultor => [
			agregarParcela(new Parcela(15, new Trigo))
			agregarParcela(new Parcela(50, new Soja))
			agregarParcela(new Parcela(200, new Trigo))
		]
	}

	// PUNTO 4
	@Test
	@DisplayName("podemos agrupar los cultivos de todas sus parcelas")
	def void testCultivosDeAgricultor() {
		assertEquals(2, agricultorQueMaximizaParcelas.cultivos.size)
	}

	@Test
	@DisplayName("no tiene parcelas subutilizadas")
	def void testAgricultorSinParcelasSubutilizadas() {
		assertFalse(agricultorQueMaximizaParcelas.algunaParcelaSubutilizada)
	}

}
