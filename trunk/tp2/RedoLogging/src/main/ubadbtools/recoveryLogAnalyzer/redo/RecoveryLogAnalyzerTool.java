package ubadbtools.recoveryLogAnalyzer.redo;

import ubadbtools.recoveryLogAnalyzer.redo.gui.forms.RecoveryAnalyzerForm;

public class RecoveryLogAnalyzerTool
{
	public static void main(String[] args)
	{
		java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RecoveryAnalyzerForm().setVisible(true);
            }
        });
	}
}
