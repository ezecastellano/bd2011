package ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions;

public class FlushRecoveryAction extends RecoveryAction
{
	@Override
	public String toString()
	{
		return "- FLUSH -";
	}
	
	@Override
	public int hashCode()
	{
		return 0;
	}

	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		
		return true;
	}
}
