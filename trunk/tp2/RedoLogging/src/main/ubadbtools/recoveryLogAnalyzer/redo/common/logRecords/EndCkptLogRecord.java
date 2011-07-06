package ubadbtools.recoveryLogAnalyzer.redo.common.logRecords;

public class EndCkptLogRecord extends RecoveryLogRecord
{

	public String toString()
	{
			return "< END CKPT >";
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
	@Override
	public int hashCode() {
		return 1;
	}
}
