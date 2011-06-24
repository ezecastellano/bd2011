package ubadbtools.recoveryLogAnalyzer.redo.common.logRecords;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class RecoveryLogRecordTest
{
	@Test
	public void equalsStart()
	{
		RecoveryLogRecord start = new StartLogRecord("t");
		
		assertTrue(start.equals(start));
		assertTrue(start.equals(new StartLogRecord("t")));
		assertFalse(start.equals(new StartLogRecord("tttttttt")));
		assertFalse(start.equals(new AbortLogRecord("t")));
		assertFalse(start.equals(null));
	}
	
	@Test
	public void equalsAbort()
	{
		RecoveryLogRecord abort = new AbortLogRecord("t");
		
		assertTrue(abort.equals(abort));
		assertTrue(abort.equals(new AbortLogRecord("t")));
		assertFalse(abort.equals(new AbortLogRecord("tttttttt")));
		assertFalse(abort.equals(new CommitLogRecord("t")));
		assertFalse(abort.equals(null));
	}
	
	@Test
	public void equalsCommit()
	{
		RecoveryLogRecord commit = new CommitLogRecord("t");
		
		assertTrue(commit.equals(commit));
		assertTrue(commit.equals(new CommitLogRecord("t")));
		assertFalse(commit.equals(new CommitLogRecord("tttttttt")));
		assertFalse(commit.equals(new StartLogRecord("t")));
		assertFalse(commit.equals(null));
	}
	
	@Test
	public void equalsUpdate()
	{
		RecoveryLogRecord update = new UpdateLogRecord("t","a","1");
		
		assertTrue(update.equals(update));
		assertTrue(update.equals(new UpdateLogRecord("t","a","1")));
		assertFalse(update.equals(new UpdateLogRecord("tttttt","a","1")));
		assertFalse(update.equals(new UpdateLogRecord("t","aaaaaaa","1")));
		assertFalse(update.equals(new UpdateLogRecord("t","a","1000000")));
		assertFalse(update.equals(new CommitLogRecord("t")));
		assertFalse(update.equals(null));
	}
	
	@Test
	public void equalsStartCheckpoint()
	{
		//TODO: Completar si quieren!!
	}
	
	@Test
	public void equalsEndCheckpoint()
	{
		//TODO: Completar si quieren!!
	}
}
