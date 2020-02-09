package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse

@DisplayName("Dado un agricultor que maximiza parcelas")
class TestAgricultorQueMaximizaParcelas {

	Agricultor agricultorQueMaximizaParcelas
	ReporteadorAgricultores reporter

	@BeforeEach
	def void init() {
		agricultorQueMaximizaParcelas = new Agricultor
		agricultorQueMaximizaParcelas.agregarParcela(new Parcela(15, new Trigo))
		agricultorQueMaximizaParcelas.agregarParcela(new Parcela(50, new Soja))
		agricultorQueMaximizaParcelas.agregarParcela(new Parcela(200, new Trigo))
		reporter = new ReporteadorAgricultores
	}

	// PUNTO 4
	@Test
	@DisplayName("podemos agrupar los cultivos de todas sus parcelas")
	def void testCultivosDeAgricultor() {
		assertEquals(2, reporter.cultivos(agricultorQueMaximizaParcelas).size)
	}

	@Test
	@DisplayName("no tiene parcelas subutilizadas")
	def void testAgricultorSinParcelasSubutilizadas() {
		assertFalse(reporter.algunaParcelaSubutilizada(agricultorQueMaximizaParcelas))
	}

}
