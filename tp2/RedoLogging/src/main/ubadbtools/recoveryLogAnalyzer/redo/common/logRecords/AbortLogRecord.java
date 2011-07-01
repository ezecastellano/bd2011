package ubadbtools.recoveryLogAnalyzer.redo.common.logRecords;


public class AbortLogRecord extends RecoveryLogRecord {
    
	private String transaction;
	
	public AbortLogRecord(String transaction) 
	{
        this.transaction = transaction;
    }

	public String getTransaction()
	{
		return transaction;
	}
	
    @Override
    public String toString(){
    		return "<ABORT " + transaction + ">";
	}

	//AUTOGENERATED by Eclipse
	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((transaction == null) ? 0 : transaction.hashCode());
		return result;
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
		AbortLogRecord other = (AbortLogRecord) obj;
		if (transaction == null)
		{
			if (other.transaction != null)
				return false;
		}
		else if (!transaction.equals(other.transaction))
			return false;
		return true;
	}
}
