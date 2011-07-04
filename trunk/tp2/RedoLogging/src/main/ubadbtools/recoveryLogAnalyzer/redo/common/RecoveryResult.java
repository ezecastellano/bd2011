package ubadbtools.recoveryLogAnalyzer.redo.common;

import java.util.List;

import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.RecoveryAction;

public class RecoveryResult 
{
	private List<RecoveryAction> recoveryActions;

	public RecoveryResult(List<RecoveryAction> recoveryActions)
	{
		this.recoveryActions = recoveryActions;
	}

	public List<RecoveryAction> getRecoveryActions()
	{
		return recoveryActions;
	}
	public String toString(){return recoveryActions.toString();}
}
