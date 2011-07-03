package ubadbtools.recoveryLogAnalyzer.redo.common;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.LinkedList;
import java.util.Set;
import java.util.ListIterator;
import java.util.HashSet;

import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.*;
import ubadbtools.recoveryLogAnalyzer.redo.common.recoveryActions.*;
import ubadbtools.recoveryLogAnalyzer.redo.common.logRecords.StartLogRecord;



public class RecoveryLog
{
	private List<RecoveryLogRecord> logRecords;
	private Set<String> items;	//Sets para evitar repetidos
	private Set<String> transactions;
	
	public RecoveryLog()
	{
		logRecords 	= new ArrayList<RecoveryLogRecord>();
		items 		= new LinkedHashSet<String>();	//Provee un orden de iteracion predecible (no como HashSet)
		transactions= new LinkedHashSet<String>();
	}

	public RecoveryLog(Set<String> items, Set<String> transactions, List<RecoveryLogRecord> logRecords)
	{
		this.items 			= items;
		this.transactions	= transactions;
		this.logRecords 	= logRecords;
	}

	public List<RecoveryLogRecord> getLogRecords()
	{
		return logRecords;
	}
	
	public Set<String> getItems()
	{
		return items;
	}

	public Set<String> getTransactions()
	{
		return transactions;
	}
	
	public void addLogRecord(RecoveryLogRecord logRecord)
	{
		logRecords.add(logRecord);
	}
	
	public void addItem(String item)
	{
		items.add(item);
	}

	public void addTransaction(String transaction)
	{
		transactions.add(transaction);
	}

	public void replaceLogRecord(int position, RecoveryLogRecord logRecord)
	{
		logRecords.set(position, logRecord);
	}
	
	////// Lo que sigue es lo que deben completar ///////////
	
	/**
	 * Devuelve un conjunto porque no importa el orden de los pasos habilitados para ejecutarse en el log
	 */
	/**
	 * @return
	 */
	public Set<RecoveryLogRecord> getAvailableSteps()
	{
		Set<RecoveryLogRecord> result = new LinkedHashSet<RecoveryLogRecord>();//resultado del metodo
		Set<String> transaccionesActivas = new LinkedHashSet<String>();//acumula las transacciones activas
		
		RecoveryLogRecord next;//aca voy guardando el valor del iterador
		EndCkptLogRecord endckpt = new EndCkptLogRecord();//lo uso para ir creando el resultado
		
		if(!transactions.isEmpty())
		{
			
			/*
			 * Antes de leer la lista de RecoveryLogRecords,
			 * cualquier transacción podría hacer "start".
			 */
			Iterator<String> iter1 = transactions.iterator();
			while(iter1.hasNext())
			{
				result.add(new StartLogRecord(iter1.next()));
			}
			
			/*
			 * Ahora recorro el log y, segun el tipo de log que levante,
			 * son las opciones que voy a agregar/eliminar
			 * */
			ListIterator<RecoveryLogRecord> iter2 = logRecords.listIterator();
			while(iter2.hasNext())
			{
				
				/* Guardo el valor del siguiente elemento */
				next = iter2.next();
				
				/* Si leo un start lo borro del conjunto de
				 * posibles acciones, lo agrego a las transacciones
				 * activas y agrego como posibles acciones un abort y un commit */
				if(next.getClass() == StartLogRecord.class)
				{
					result.remove(next);
					result.add(new AbortLogRecord( ((StartLogRecord) next).getTransaction()) );
					result.add(new CommitLogRecord( ((StartLogRecord) next).getTransaction()) );
					transaccionesActivas.add(((StartLogRecord) next).getTransaction());
				}
				
				/* Si leo un commit, saco el commit y el abort
				 * de las posibles acciones, agrego un start y saco a 
				 * la transaccion de las transacciones activas */
				else if(next.getClass() == CommitLogRecord.class)
				{
					result.remove(new AbortLogRecord(((CommitLogRecord) next).getTransaction()));
					result.remove(new CommitLogRecord(((CommitLogRecord) next).getTransaction()));
					result.add(new StartLogRecord(((CommitLogRecord) next).getTransaction()));
					transaccionesActivas.remove(((CommitLogRecord) next).getTransaction());
				}
				
				/* Si leo un abort, saco el commit y el abort
				 * de las posibles acciones, agrego un start y saco a 
				 * la transaccion de las transacciones activas */
				else if(next.getClass() == AbortLogRecord.class)
				{
					result.remove(new AbortLogRecord(((AbortLogRecord) next).getTransaction()));
					result.remove(new CommitLogRecord(((AbortLogRecord) next).getTransaction()));
					result.add(new StartLogRecord(((AbortLogRecord) next).getTransaction()));
					transaccionesActivas.remove(((AbortLogRecord) next).getTransaction());
				}
				
				/* Si leo un start checkpoint, agrego la posibilidad de
				 * escribir un endcheckpoint */
				/* TODO: ver si hace falta crearlo arriba para que siempre 
				 * agregue o elimine el mismo. Algo me dice que usando un
				 * new va a agregar siempre uno nuevo y a eliminar nada */
				else if(next.getClass() == StartCkptLogRecord.class)
				{
					result.add(endckpt);
				}
				
				/* Si leo un end checkpoint, saco la posibilidad de
				 * escribir un endcheckpoint */
				else if(next.getClass() == StartCkptLogRecord.class)
				{
					result.remove(endckpt);
				}
				
				else //si es un update log record, no hago nada
				{
					//NADA
				}
			}
			
			//si no quedo ningun startckpt abierto y hay transacciones activas
			if(!result.contains(endckpt) && !transaccionesActivas.isEmpty())
			{
				result.add(new StartCkptLogRecord(transaccionesActivas));
			}
			if(!transaccionesActivas.isEmpty())
			{
				iter1 = transaccionesActivas.iterator();
				while(iter1.hasNext()){
					result.add(new UpdateLogRecord(iter1.next(), "*", "*"));
				}
				
			}
			
		}
		
		return result;
	}
	
	public RecoveryResult recoverFromCrash()
	{
		//TODO: Completar
		Boolean conEndCkpt=false;
		Boolean startYend=false;		
		Set<String> empezadas =new HashSet<String>();
		Set<String> commiteadas =new HashSet<String>();
		List<UpdateLogRecord> rehacer=new LinkedList<UpdateLogRecord>();
		Set<String> abortadas=new HashSet<String>();
		
		ListIterator<RecoveryLogRecord> iterLog = logRecords.listIterator(logRecords.size());   //creo iterador la final
		
		while (iterLog.hasPrevious()&&!startYend){												//busco el último StartCKPT con EndCKPT y guardo datos hasta ahi
			
			Object logRcd = iterLog.previous();													//agarro el elemento del iterador de logs
			
			if (logRcd.getClass()==EndCkptLogRecord.class)										//si encuentro un EndCkpt guardo que encontré un end
							conEndCkpt=true;					
					
			if ((logRcd.getClass() == StartCkptLogRecord.class) && conEndCkpt ) 				//si encuentro un start y tenia un end listo, se donde empezar
			{
					startYend=true;			
					empezadas.addAll( ((StartCkptLogRecord)logRcd).getTransactions());			//agrego como empezadas las activas desde el ultimo start con end
			}
												
			if (logRcd.getClass() == CommitLogRecord.class)
					commiteadas.add(((CommitLogRecord) logRcd).getTransaction());           	//agrego la transaccion a la lista de las que tengo que rehacer
									
			if (logRcd.getClass()==AbortLogRecord.class)
					abortadas.add(((AbortLogRecord) logRcd).getTransaction());					//guardo las transacciones abortadas
			
			if (logRcd.getClass()==UpdateLogRecord.class)
				if ( commiteadas.contains( ((UpdateLogRecord) logRcd).getTransaction() ) )  	// si la transaccion commiteo, guardo el update 
						rehacer.add( ((UpdateLogRecord) logRcd) );
			
			if (logRcd.getClass()==AbortLogRecord.class)										//si es un abort, lo guardo en las transacciones abortadas
					abortadas.add( ((AbortLogRecord)logRcd).getTransaction() ); 	
			
			if (logRcd.getClass()==StartLogRecord.class)										//si es un abort, lo guardo en las transacciones abortadas
				empezadas.add( ((StartLogRecord)logRcd).getTransaction() ); 	
			 
		}
		
																								//tengo en commiteadas todas las transacciones que hicieron commit
																								//en rehacer los update de las transacciones que hicieron commit, de la mas nueva a la mas antigua
																								//en abortadas las transacciones que abortaron.
		
		Set<String> incompletos = empezadas;
		incompletos.removeAll(abortadas);														//le saco a todas las transacciones las abortadas 
		incompletos.removeAll(commiteadas);														//le saco a todas las commiteadas y incompletas las abortadas -> incompletas
				
		List<RecoveryAction> listarecovery=new LinkedList<RecoveryAction>();														//creo la lista de RecoveryActions que debo realizar para levantar del crash
		
		ListIterator<UpdateLogRecord> liter=rehacer.listIterator(rehacer.size());
		
		while (liter.hasPrevious())
		{		
				UpdateLogRecord urec=liter.previous();
				listarecovery.add( new WriteRecoveryAction( 
																urec.getTransaction(),
																urec.getItem(),
																urec.getNewValue() 
															)
									);  	
		}																						//agrego desde el mas viejo al mas nuevo la lista de los logs que tengo que rehacer				
				
		if (incompletos.size()>0) listarecovery.add( new AbortRecoveryAction(incompletos ) );         					//agrego el AbortRecoveryActions con incompletos
		if (incompletos.size()>0) listarecovery.add( new FlushRecoveryAction() );											//agrego el flush record	
		
		return new RecoveryResult(listarecovery);		
	}
}
