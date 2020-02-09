package ar.edu.agricultores

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dado un agricultor que no cultiva todas sus parcelas")
class TestAgricultorConParcelasSubutilizadas {

	Agricultor agricultorConParcelasSubutilizadas
	ReporteadorAgricultores reporter

	@BeforeEach
	def void init() {
		agricultorConParcelasSubutilizadas = new Agricultor
		agricultorConParcelasSubutilizadas.agregarParcela(new Parcela(15, new SojaTransgenica(true)))
		val parcelaTrigo = new Parcela(20, new Trigo)
		parcelaTrigo.hectareas = 700
		agricultorConParcelasSubutilizadas.agregarParcela(parcelaTrigo)
		reporter = new ReporteadorAgricultores
	}

	@Test
	@DisplayName("tiene parcelas subutilizadas")
	def void testAgricultorConParcelasSubutilizadas() {
		assertTrue(reporter.algunaParcelaSubutilizada(agricultorConParcelasSubutilizadas))
	}

}
