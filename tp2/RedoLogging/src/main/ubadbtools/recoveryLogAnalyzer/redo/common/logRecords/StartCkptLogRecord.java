package ubadbtools.recoveryLogAnalyzer.redo.common.logRecords;
import java.util.Iterator;
import java.util.Set;


public class StartCkptLogRecord extends RecoveryLogRecord
{
	private Set<String> transactions;
	
	public StartCkptLogRecord(Set<String> transactions2) 
	{
		this.transactions = transactions2;
	}
	
	public Set<String> getTransactions()
	{
		return transactions;
	}
	
	public String toString()
	{
		String res;
		Iterator<String> liter=transactions.iterator();
		res="<START CKPT (";
		
		if (liter.hasNext()) res=res+liter.next();
		
		while (liter.hasNext())
			res=res+","+liter.next(); 
	
		res=res+")>";
		return res;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((transactions == null) ? 0 : transactions.hashCode());
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
		StartCkptLogRecord other = (StartCkptLogRecord) obj;
		if (transactions == null) {
			if (other.transactions != null)
				return false;
		} else if (!transactions.equals(other.transactions))
			return false;
		return true;
	}
}
