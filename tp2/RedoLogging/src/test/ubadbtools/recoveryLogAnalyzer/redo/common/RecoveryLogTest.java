package ubadbtools.recoveryLogAnalyzer.redo.common;

import static org.junit.Assert.assertEquals;

import java.util.Set;

import org.junit.Test;

import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.RecoveryLogRecord;


public class RecoveryLogTest
{
	private static final String BASE_FOLDER = "resources/tests/junit/";
	
	@Test
	/**
	 * Para verificar parte de su implementaci�n, deben hacer que pasen los tests de la c�tedra
	 */
	public void catedraTestCases() throws Exception
	{
		//AVISO IMPORTANTE: Cuando agreguen clases para el Start Ckpt y End Ckpt van a tener que implementar el equals y adem�s actualizar el parser
		performTests(BASE_FOLDER + "catedra/testCase", 2);
	}
	
	@Test
	/**
	 * Adem�s, pueden realizar sus propios tests (solamente son obligatorios los manuales)
	 */
	public void alumnosTestCases() throws Exception
	{
		performTests(BASE_FOLDER + "alumnos/testCase", 0);
	}
	
	@Test
	/**
	 * Durante la demo la c�tedra llevar� sus propios tests para verificar su implementaci�n
	 */
	public void demoTestCases() throws Exception
	{
		performTests(BASE_FOLDER + "demo/testCase", 0);
	}

	private void performTests(String subPath, int numberOfTestCases) throws Exception
	{
		RecoveryLogParser parser = new RecoveryLogParser();
		
		for(int i=1; i <= numberOfTestCases; i++)
		{
			RecoveryLog recoveryLog = parser.parseLog(subPath + i + "/log.txt");
			Set<RecoveryLogRecord> expectedAvailableSteps = parser.parseAvailableSteps(subPath + i + "/availSteps.txt");
			RecoveryResult expectedRecoveryResult = parser.parseRecoveryResult(subPath + i + "/recoveryResult.txt");
			
			//Asserts
			assertEquals(expectedAvailableSteps,recoveryLog.getAvailableSteps());
			assertEquals(expectedRecoveryResult,recoveryLog.recoverFromCrash());
			
			System.out.println("Passed: " + subPath + i);
		}
	}
}
