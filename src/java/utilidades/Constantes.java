package utilidades;

import java.io.Serializable;

public class Constantes implements Serializable {
	private static final long serialVersionUID = -3358884679090829992L;
	
     //GENERALES
	 public static final String tablaDual="dual";
	 public static final String nombreSistema = "SEGESCN";
	 public static String usuarioseg= "SEGESCN";
	 public static final String modulo0 = "0";
	 public static final String moduloSegEsc = "segesc";

	 
	 //JOVENES CON VALOR
     //TABLAS
	 public static final String TablaUsuarios="TBL_USUARIOS";
	 public static final String TablaModulosPerfiles="TBL_MODULOSPERFILES";
	 public static final String TablaModulos="TBL_MODULOS";
	 public static final String catJoven= "CATALOGOSERVICIO";
	 
		
		
	 
		/*/******************* Desarrollo*******************************************************
      
		public static final boolean esDesarrollo = true;		
		public static final String rutaProyectos =   "http://aplicaciones.edugem.gob.mx/";
		public static final String rutareportesjasper = "/home/pedro/Escritorio/";		                                                  
		public static final String rutaArch = "/apachetomcat/webapps/programas/permanecerestudiando/";  				
		public static final String rutaEstilos = "http://aplicaciones.edugem.gob.mx/estilosUDAI/";		                                        
		public static final String rutaImages = "/home/pedro/Escritorio/";
		public static final String rutaManuales = "http://aplicaciones.edugem.gob.mx/manuales/ManualUsuario3P.pdf";		
		//*/
                
                //******************* producción*******************************************************
      
		public static final boolean esDesarrollo = true;		
		public static final String rutaProyectos =   "http://aplicaciones.edugem.gob.mx/";
		public static final String rutareportesjasper = "/apachetomcat/reportes/encuestaforo/";		                                                  
		public static final String rutaArch = "/apachetomcat/webapps/programas/permanecerestudiando/";  				
		public static final String rutaEstilos = "http://aplicaciones.edugem.gob.mx/estilosUDAI/";		                                        
		public static final String rutaImages = "/apachetomcat/reportes/encuestaforo/img/";
		public static final String rutaManuales = "http://aplicaciones.edugem.gob.mx/manuales/ManualUsuario3P.pdf";		
		//*/
                
	  

	  public static void enviaMensajeConsola(String cadena){
			if(Constantes.esDesarrollo){
				System.out.println("MENSAJE_DESARROLLO: "+cadena);
			}
		}
} 

