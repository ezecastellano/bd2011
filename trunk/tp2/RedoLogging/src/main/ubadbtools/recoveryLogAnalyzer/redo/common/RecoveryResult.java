package ubadbtools.recoveryLogAnalyzer.redo.common;

import java.util.List;

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



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecoveryResult other = (RecoveryResult) obj;
		if (recoveryActions == null) {
			if (other.recoveryActions != null)
				return false;
		} else if (!recoveryActions.equals(other.recoveryActions))
			return false;
		return true;
	}
	
	
}
