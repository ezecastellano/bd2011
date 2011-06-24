package ubadbtools.recoveryLogAnalyzer.redo.common;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.RecoveryLogRecord;


public class RecoveryLog
{
	private List<RecoveryLogRecord> logRecords;
	private Set<String> items;	//Sets para evitar repetidos
	private Set<String> transactions;
	
	public RecoveryLog()
	{
		logRecords 	= new ArrayList<RecoveryLogRecord>();
		items 		= new LinkedHashSet<String>();	//Provee un orden de iteración predecible (no como HashSet)
		transactions= new LinkedHashSet<String>();
	}

	public RecoveryLog(Set<String> items, Set<String> transactions, List<RecoveryLogRecord> logRecords)
	{
		this.items 			= items;
		this.transactions	= transactions;
		this.logRecords 	= logRecords;
	}

	public List<RecoveryLogRecord> getLogRecords()
	{
		return logRecords;
	}
	
	public Set<String> getItems()
	{
		return items;
	}

	public Set<String> getTransactions()
	{
		return transactions;
	}
	
	public void addLogRecord(RecoveryLogRecord logRecord)
	{
		logRecords.add(logRecord);
	}
	
	public void addItem(String item)
	{
		items.add(item);
	}

	public void addTransaction(String transaction)
	{
		transactions.add(transaction);
	}

	public void replaceLogRecord(int position, RecoveryLogRecord logRecord)
	{
		logRecords.set(position, logRecord);
	}
	
	////// Lo que sigue es lo que deben completar ///////////
	
	/**
	 * Devuelve un conjunto porque no importa el orden de los pasos habilitados para ejecutarse en el log
	 */
	public Set<RecoveryLogRecord> getAvailableSteps()
	{
		//TODO: Completar
		return null;
	}
	
	public RecoveryResult recoverFromCrash()
	{
		//TODO: Completar
		return null;
	}
}
