package ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

import org.junit.Test;

public class RecoveryActionTest
{
	@Test
	public void equalsAbort()
	{
		RecoveryAction abort = new AbortRecoveryAction(buildSet("t1","t2","t3"));
		
		assertTrue(abort.equals(abort));
		assertTrue(abort.equals(new AbortRecoveryAction(buildSet("t1","t2","t3"))));
		assertFalse(abort.equals(new AbortRecoveryAction(buildSet("t1","t2","t3","t4"))));
		assertFalse(abort.equals(new AbortRecoveryAction(buildSet("t1","t2"))));
		assertFalse(abort.equals(new AbortRecoveryAction(buildSet())));
		assertFalse(abort.equals(new FlushRecoveryAction()));
		assertFalse(abort.equals(null));
	}
	
	@Test
	public void equalsWrite()
	{
		RecoveryAction write = new WriteRecoveryAction("t","a","1");
		
		assertTrue(write.equals(write));
		assertTrue(write.equals(new WriteRecoveryAction("t","a","1")));
		assertFalse(write.equals(new WriteRecoveryAction("ttttttt","a","1")));
		assertFalse(write.equals(new WriteRecoveryAction("t","aaaaaaa","1")));
		assertFalse(write.equals(new WriteRecoveryAction("t","a","111111")));
		assertFalse(write.equals(new AbortRecoveryAction(buildSet("t1"))));
		assertFalse(write.equals(null));
	}
	
	@Test
	public void equalsFlush()
	{
		RecoveryAction flush = new FlushRecoveryAction();
		
		assertTrue(flush.equals(flush));
		assertTrue(flush.equals(new FlushRecoveryAction()));
		assertFalse(flush.equals(new WriteRecoveryAction("t","a","1")));
		assertFalse(flush.equals(null));
	}

	private Set<String> buildSet(String... transactions)
	{
		return new LinkedHashSet<String>(Arrays.asList(transactions));
	}
}
