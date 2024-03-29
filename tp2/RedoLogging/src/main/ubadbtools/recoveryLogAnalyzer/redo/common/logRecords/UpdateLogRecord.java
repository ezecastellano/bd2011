package ubadbtools.recoveryLogAnalyzer.redo.common.logRecords;

public class UpdateLogRecord extends RecoveryLogRecord
{
	private String 	transaction;
	private String 	item;
	private String	newValue;

	public UpdateLogRecord(String transaction, String item, String newValue)
	{
		this.transaction = transaction;
		this.item = item;
		this.newValue = newValue;
	}
	
	public String getTransaction()
	{
		return transaction;
	}
	
	public String getItem()
	{
		return item;
	}
	public String getNewValue()
	{
		return newValue;
	}
	
	public String toString()
	{
		return "<UPDATE " + transaction + ", ITEM=" + item + ", NEW VALUE=" + newValue+ ">"; 
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((item == null) ? 0 : item.hashCode());
		result = prime * result
				+ ((newValue == null) ? 0 : newValue.hashCode());
		result = prime * result
				+ ((transaction == null) ? 0 : transaction.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UpdateLogRecord other = (UpdateLogRecord) obj;
		if (item == null) {
			if (other.item != null)
				return false;
		} else if (!item.equals(other.item))
			return false;
		if (newValue == null) {
			if (other.newValue != null)
				return false;
		} else if (!newValue.equals(other.newValue))
			return false;
		if (transaction == null) {
			if (other.transaction != null)
				return false;
		} else if (!transaction.equals(other.transaction))
			return false;
		return true;
	}
}
