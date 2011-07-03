package ubadbtools.recoveryLogAnalyzer.redo.common;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.AbortLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.CommitLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.EndCkptLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.RecoveryLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartCkptLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.UpdateLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.AbortRecoveryAction;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.FlushRecoveryAction;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.RecoveryAction;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.WriteRecoveryAction;

public class RecoveryLogParser
{
	public static void main(String[] args) throws Exception
	{
		/*RecoveryLogParser parser = new RecoveryLogParser();
		RecoveryLog log = parser.parseLog("resources/tests/junit/catedra/testCase1/log.txt");
		Set<RecoveryLogRecord> logRecords = parser.parseAvailableSteps("resources/tests/junit/catedra/testCase1/availSteps.txt");
		RecoveryResult recoveryResult = parser.parseRecoveryResult("resources/tests/junit/catedra/testCase1/recoveryResult.txt");
		System.out.println(log.getItems());
		System.out.println(log.getTransactions());
		System.out.println(log.getLogRecords());
		
		System.out.println(logRecords);
		System.out.println(recoveryResult.getRecoveryActions());*/
		
		RecoveryLogTest catedra = new RecoveryLogTest();
		catedra.catedraTestCases();
	}

	public RecoveryLog parseLog(String file) throws Exception
	{
		BufferedReader reader = new BufferedReader(new FileReader(file));
		Set<String> transactions = parseElementsAsSet(reader.readLine());
		Set<String> items = parseElementsAsSet(reader.readLine());
		List<RecoveryLogRecord> logRecords = parseLogRecords(reader);
		return new RecoveryLog(items,transactions,logRecords);
	}

	public Set<RecoveryLogRecord> parseAvailableSteps(String file) throws Exception
	{
		BufferedReader reader = new BufferedReader(new FileReader(file));
		return new LinkedHashSet<RecoveryLogRecord>(parseLogRecords(reader));
	}

	private List<RecoveryLogRecord> parseLogRecords(BufferedReader reader) throws Exception
	{
		List<RecoveryLogRecord> ret = new ArrayList<RecoveryLogRecord>();
		String line = reader.readLine();
		while (line != null)
		{
			line = line.trim();
			if (line.equals(""))
			{
				// Ignore line
			}
			else
			{
				RecoveryLogRecord logRecord = parseSingleLogRecord(line);
				ret.add(logRecord);
			}
			line = reader.readLine();
		}
		return ret;
	}

	private RecoveryLogRecord parseSingleLogRecord(String line) throws Exception
	{
		RecoveryLogRecord ret = null;

		String type = getType(line);
		String content = getContent(line);
		if ("START".equals(type))
		{
			ret = new StartLogRecord(content);
		}
		else if ("UPDATE".equals(type))
		{
			ret = parseUpdateLogRecord(content);
		}
		else if ("COMMIT".equals(type))
		{
			ret = new CommitLogRecord(content);
		}
		else if ("ABORT".equals(type))
		{
			ret = new AbortLogRecord(content);
		}
		else if ("START_CKPT".equals(type))
		{
			ret = parseStartCkptLogRecord(content);
		}
		else if ("END_CKPT".equals(type))
		{
			//TODO: VER SI ESTA BIEN LO QUE HICE!!!
			ret = new EndCkptLogRecord();
		}
		else
		{
			throw new Exception("Tipo de registro de log inválido (" + type + ")");
		}
		return ret;
	}

	private Set<String> parseElementsAsSet(String line)
	{
		line = line.replaceAll(" ", "");
		return new LinkedHashSet<String>(Arrays.asList(line.split(",")));
	}

	private String getType(String line)
	{
		String type;
		if (line.contains(" "))
		{
			type = line.substring(0, line.indexOf(" "));
		}
		else
		{
			type = line;
		}
		return type;
	}

	private String getContent(String line)
	{
		String content = "";
		if (line.contains(" "))
		{
			content = line.substring(line.indexOf(" ") + 1);
			content = content.replaceAll(" ", "");
		}
		return content;
	}

	private RecoveryLogRecord parseUpdateLogRecord(String content)
	{
		String[] tokens = content.split(",");
		String transaction = tokens[0];
		String[] subTokens = tokens[1].split("=");
		String item = subTokens[0];
		String newValue = subTokens[1];
		return new UpdateLogRecord(transaction,item,newValue);
	}

	private RecoveryLogRecord parseStartCkptLogRecord(String content)
	{
		Set<String> transactions = parseElementsAsSet(content);
		
		//TODO: Verificar que esté bien esto que devuelvo
		return new StartCkptLogRecord(transactions);
	}

	public RecoveryResult parseRecoveryResult(String file) throws Exception
	{
		List<RecoveryAction> actions = new ArrayList<RecoveryAction>();
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = reader.readLine();
		while (line != null)
		{
			line = line.trim();
			if (line.equals(""))
			{
				// Ignore line
			}
			else
			{
				actions.add(parseSingleRecoveryAction(line));
			}
			line = reader.readLine();
		}
		return new RecoveryResult(actions);
	}

	private RecoveryAction parseSingleRecoveryAction(String line) throws Exception
	{
		RecoveryAction ret = null;
		String type = getType(line);
		String content = getContent(line);
		if ("ABORT".equals(type))
		{
			ret = new AbortRecoveryAction(parseElementsAsSet(content));
		}
		else if ("WRITE".equals(type))
		{
			ret = parseWriteAction(content);
		}
		else if ("FLUSH".equals(type))
		{
			ret = new FlushRecoveryAction();
		}
		else
		{
			throw new Exception("Tipo de acción de recuperación inválido (" + type + ")");
		}
		
		return ret;
	}

	private RecoveryAction parseWriteAction(String content)
	{
		String[] tokens = content.split(",");
		String transaction = tokens[0];
		String[] subTokens = tokens[1].split("=");
		String item = subTokens[0];
		String newValue = subTokens[1];
		return new WriteRecoveryAction(transaction,item,newValue);
	}
}
