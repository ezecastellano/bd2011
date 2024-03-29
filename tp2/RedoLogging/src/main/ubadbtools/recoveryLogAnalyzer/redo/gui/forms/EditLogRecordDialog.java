/*
 * SelectScheduleTypeDialog.java
 *
 * Created on 6 de abril de 2009, 15:44
 */

package ubadbtools.recoveryLogAnalyzer.redo.gui.forms;

import java.awt.Frame;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.swing.GroupLayout;
import javax.swing.JRadioButton;
import javax.swing.LayoutStyle;

import ubadbtools.recoveryLogAnalyzer.redo.common.RecoveryLog;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.AbortLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.CommitLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.EndCkptLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.RecoveryLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartCkptLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartLogRecord;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.UpdateLogRecord;


/**
* This code was edited or generated using CloudGarden's Jigloo
* SWT/Swing GUI Builder, which is free for non-commercial
* use. If Jigloo is being used commercially (ie, by a corporation,
* company or business for any purpose whatever) then you
* should purchase a license for each developer using Jigloo.
* Please visit www.cloudgarden.com for details.
* Use of Jigloo implies acceptance of these licensing terms.
* A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR
* THIS MACHINE, SO JIGLOO OR THIS CODE CANNOT BE USED
* LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
*/
@SuppressWarnings("serial")
public class EditLogRecordDialog extends javax.swing.JDialog {
    
	//[start] Atributos
	private RecoveryLogRecord logRecord = null;
	private Set<String> transactions;
	private JRadioButton rbAbort;
	private Set<String> items;
	private Frame parent;
	private RecoveryLog log;
	private Set<RecoveryLogRecord> available;
	//[end]
	
	//[start] Constructor
    public EditLogRecordDialog(java.awt.Frame parent, boolean modal, RecoveryLog log)
    {
        super(parent, modal);
        
        this.transactions = log.getTransactions();
        this.items = log.getItems();
        this.log=log;
        this.available=log.getAvailableSteps();
        this.parent = parent;
        
    	Iterator<RecoveryLogRecord> it = this.available.iterator();
    	System.out.print("POSIBLES: ");
    	while(it.hasNext()){
    		RecoveryLogRecord record = it.next();
    		System.out.print(record.toString());
    		System.out.print(", ");
    	}
    	System.out.println("");
        
    	initComponents();
    }
    //[end]
    
    //[start] showDialog
    public static RecoveryLogRecord showDialog(Frame parent, RecoveryLog log)
    {
    	EditLogRecordDialog dialog = new EditLogRecordDialog(parent, true, log);
        dialog.setVisible(true);
        
        return dialog.logRecord;
    }
    //[end]
    
    private Boolean hayUn(Class<?> c){
    	Iterator<RecoveryLogRecord> it = this.available.iterator();
    	while(it.hasNext()){
    		RecoveryLogRecord record = it.next();
    		if(record.getClass().equals(c)) return true;
    	}
    	return false;
    }
    
    private Set<RecoveryLogRecord> getAll(Class<?> c){
    	Set<RecoveryLogRecord> all=new LinkedHashSet<RecoveryLogRecord>();    	
    	Iterator<RecoveryLogRecord> it = this.available.iterator();
    	while(it.hasNext()){
    		RecoveryLogRecord record = it.next();
    		if(record.getClass().equals(c)) all.add(record);
    	}
		return all;
    }
    
    //[start] InitComponents (AUTO-GENERATED)
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        rbgActionType = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        rbStart = new javax.swing.JRadioButton();
        rbUpdate = new javax.swing.JRadioButton();
        rbCommit = new javax.swing.JRadioButton();
        rbAbort = new javax.swing.JRadioButton();
        //TODO: boton checkpoint
        rbChkPt = new javax.swing.JRadioButton();
        rbEndChkPt = new javax.swing.JRadioButton();
        jLabel2 = new javax.swing.JLabel();
        butCancelar = new javax.swing.JButton();
        butAceptar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setName("Form"); // NOI18N

        jPanel1.setName("jPanel1"); // NOI18N

        rbgActionType.add(rbStart);
        rbStart.setSelected(true);
        rbStart.setText("Start"); // NOI18N
        rbStart.setName("rbStart"); // NOI18N
        rbStart.setEnabled(this.hayUn(StartLogRecord.class));

        rbgActionType.add(rbUpdate);
        rbUpdate.setText("Update"); // NOI18N
        rbUpdate.setName("rbUpdate"); // NOI18N
        rbUpdate.setEnabled(this.hayUn(UpdateLogRecord.class));
        
        rbgActionType.add(rbAbort);
    	rbAbort.setText("Abort"); // NOI18N
    	rbAbort.setName("rbAbort"); // NOI18N
    	rbAbort.setEnabled(this.hayUn(AbortLogRecord.class));

        rbgActionType.add(rbCommit);
        rbCommit.setText("Commit"); // NOI18N
        rbCommit.setName("rbCommit"); // NOI18N
        rbCommit.setEnabled(this.hayUn(CommitLogRecord.class));
        
        rbgActionType.add(rbChkPt);
        rbChkPt.setText("Start Checkpoint");
        rbChkPt.setName("rbChkPt");
        rbChkPt.setEnabled(this.hayUn(StartCkptLogRecord.class));
        
        rbgActionType.add(rbEndChkPt);
        rbEndChkPt.setText("End Checkpoint");
        rbEndChkPt.setName("rbEndChkPt");
        rbEndChkPt.setEnabled(this.hayUn(EndCkptLogRecord.class));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createSequentialGroup()
    		.addComponent(rbChkPt , GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(rbEndChkPt , GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(rbStart , GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(rbUpdate, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(rbAbort , GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(rbCommit, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE));
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createSequentialGroup()
        	.addContainerGap()
        	.addGroup(jPanel1Layout.createParallelGroup()
    			.addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbChkPt, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE))
                .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbEndChkPt, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE))
            	.addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbStart, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE))
        	    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbCommit, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE))
        	    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbUpdate, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE))
        	    .addGroup(GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
        	        .addComponent(rbAbort, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 6, Short.MAX_VALUE)))
        	.addContainerGap());

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel2.setText("Esto es a modo de ejemplo, aca deberian aparecer solo las opciones disponibles"); // NOI18N

        butCancelar.setText("Cancelar"); // NOI18N
        butCancelar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                butCancelarMouseClicked(evt);
            }
        });

        butAceptar.setText("Aceptar"); // NOI18N
        butAceptar.setName("jButton1"); // NOI18N
        butAceptar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                butAceptarMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setVerticalGroup(layout.createSequentialGroup()
        	.addContainerGap()
        	.addComponent(jLabel2, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addComponent(jPanel1, GroupLayout.PREFERRED_SIZE, 150, GroupLayout.PREFERRED_SIZE)
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	.addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
        	    .addComponent(butAceptar, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	    .addComponent(butCancelar, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
        	.addContainerGap(38, 38));
        layout.setHorizontalGroup(layout.createSequentialGroup()
        	.addContainerGap(16, 16)
        	.addGroup(layout.createParallelGroup()
        	    .addComponent(jLabel2, GroupLayout.Alignment.LEADING, 0, 420, Short.MAX_VALUE)
        	    .addGroup(layout.createSequentialGroup()
        	        .addGap(136)
        	        .addGroup(layout.createParallelGroup()
        	            .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	                .addComponent(butAceptar, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	                .addComponent(butCancelar, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	                .addGap(0, 68, Short.MAX_VALUE))
        	            .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	                .addGap(36)
        	                .addComponent(jPanel1, GroupLayout.PREFERRED_SIZE, 152, GroupLayout.PREFERRED_SIZE)
        	                .addGap(0, 0, Short.MAX_VALUE)))
        	        .addGap(96)))
        	.addContainerGap(47, 47));

        pack();
    }// </editor-fold>//GEN-END:initComponents
	//[end]
    
    //[start] Eventos
    private void butAceptarMouseClicked(java.awt.event.MouseEvent evt)
    {//GEN-FIRST:event_butAceptarMouseClicked

    	// Genero el registro de log segun los valores en los controles del dialogo
		if(rbStart.isSelected()){
			Set<RecoveryLogRecord> starters=this.getAll(StartLogRecord.class);
			Set<String> tr=new LinkedHashSet<String>();
			Iterator<RecoveryLogRecord> it = starters.iterator();
	    	while(it.hasNext()) tr.add(((StartLogRecord)it.next()).getTransaction());
    		logRecord = StartLogRecordDialog.showDialog(parent, tr);
		}else if(rbCommit.isSelected()){
			Set<RecoveryLogRecord> commiters=this.getAll(CommitLogRecord.class);
			Set<String> tr=new LinkedHashSet<String>();
			Iterator<RecoveryLogRecord> it = commiters.iterator();
	    	while(it.hasNext()) tr.add(((CommitLogRecord)it.next()).getTransaction());
    		logRecord = CommitLogRecordDialog.showDialog(parent, tr);
		}else if(rbChkPt.isSelected()){
    		logRecord = this.getAll(StartCkptLogRecord.class).iterator().next();//new StartCkptLogRecord(this.transactions);
		}else if(rbEndChkPt.isSelected()){
    		logRecord = new EndCkptLogRecord();
		}else if(rbUpdate.isSelected()){
			Set<RecoveryLogRecord> updaters=this.getAll(UpdateLogRecord.class);
			Set<String> tr=new LinkedHashSet<String>();
			Set<String> its=new LinkedHashSet<String>();
			Iterator<RecoveryLogRecord> it = updaters.iterator();
	    	while(it.hasNext()){
	    		UpdateLogRecord el=(UpdateLogRecord)it.next();
    			tr.add(el.getTransaction());
    			//its.add(el.getItem());
	    	}
    		logRecord = UpdateLogRecordDialog.showDialog(parent, tr,items);
		}else if(rbAbort.isSelected()){
			Set<RecoveryLogRecord> aborters=this.getAll(AbortLogRecord.class);
			Set<String> tr=new LinkedHashSet<String>();
			Iterator<RecoveryLogRecord> it = aborters.iterator();
	    	while(it.hasNext()) tr.add(((AbortLogRecord)it.next()).getTransaction());
    		logRecord = AbortLogRecordDialog.showDialog(parent, tr);
		}
    	this.setVisible(false);
    }//GEN-LAST:event_butAceptarMouseClicked

    private void butCancelarMouseClicked(java.awt.event.MouseEvent evt)
    {//GEN-FIRST:event_butCancelarMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_butCancelarMouseClicked
    //[end]

    //[start] Variables Form (AUTO-GENERATED)
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton butAceptar;
    private javax.swing.JButton butCancelar;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton rbCommit;
    private javax.swing.JRadioButton rbStart;
    private javax.swing.JRadioButton rbUpdate;
    private javax.swing.JRadioButton rbChkPt;
    private javax.swing.JRadioButton rbEndChkPt;
    private javax.swing.ButtonGroup rbgActionType;
    // End of variables declaration//GEN-END:variables
    //[end]
}
