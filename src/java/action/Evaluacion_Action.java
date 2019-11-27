/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import beans.Cat_EventoBean;
import beans.Cat_Nom_EveBean;
import beans.Cat_TipoParticipanteBean;
import beans.EncabezadoBean;
import beans.PreguntasBean;
import beans.Res_ConBean;
import beans.RespuestaBean;

import beans.moduloAuxBean;
import beans.moduloBean;
import beans.usuarioBean;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import daos.EvaluarDAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import utilidades.Constantes;

/**
 *
 * @author pedro
 */
public class Evaluacion_Action extends ActionSupport implements SessionAware {

    private usuarioBean usuariocons;
    private String cveusuario;
    private String pasusuario;
    private String nomModulo;
    private String modulo;
    private String nombreUsuario;
    private String TipoError;
    private String TipoException;

    private boolean banMuestraForm;
    private boolean banMuestraFormAct;

    public List<moduloBean> modulosAUX = new ArrayList<moduloBean>();
    public List<moduloAuxBean> modulosAUXP = new ArrayList<moduloAuxBean>();

    private List<Cat_EventoBean> ListaEvento= new ArrayList<Cat_EventoBean>(); 
    private List<Cat_Nom_EveBean> ListaNomEve= new ArrayList<Cat_Nom_EveBean>();
    private List<Cat_TipoParticipanteBean> ListaTipo= new ArrayList<Cat_TipoParticipanteBean>();

    public Evaluacion_Action() {
    }
    
    private List<EncabezadoBean> ListaEncabezado = new ArrayList<EncabezadoBean>();
    private List<PreguntasBean> listaPregEnca = new ArrayList<PreguntasBean>();

    private List<RespuestaBean> ListaRespuestas1 = new ArrayList<RespuestaBean>();
    private List<RespuestaBean> ListaRespuestas2 = new ArrayList<RespuestaBean>();
    private List<Res_ConBean> ListaContestados = new ArrayList<Res_ConBean>();
    
    private List<Res_ConBean> ListaRegEncuestados = new ArrayList<Res_ConBean>();

    Res_ConBean res = new Res_ConBean();

    //conexiones................................PARA LAS LISTAS
    Statement objConexion;
    PreparedStatement objPreConexion;
    Connection conecta;
    String registrado="";
    boolean ocultaboton =false;
      boolean muestraboton =true;
      boolean bantipo=false;
      boolean banConstancia=false;
      boolean banMateriales=false;
      boolean banfolio=false;
      boolean bannombres=false;
      boolean tipoacceso=true;
    
    

    //******************** PARA OBJETO DE NAVEGACIoN ***********************************************
    private Map session;

    
    
     public String elegirAcceso() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();
            
            if(res.getTIPO().equals("1")){
                banfolio=true;
                bannombres=false;
                
                
            }
           
            if(res.getTIPO().equals("2")){
                banfolio=false;
                bannombres=true;
                
            }
            
        
            

         
            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
     
     
     public static String remove1(String input) {
    // Cadena de caracteres original a sustituir.
    String original = "áàäéèëíìïóòöúùuÁÀÄÉÈËÍÌÏÓÒÖÚÙÜçÇ";
    // Cadena de caracteres ASCII que reemplazarán los originales.
    String ascii = "aaaeeeiiiooouuuAAAEEEIIIOOOUUUcC";
    String output = input;
    for (int i=0; i<original.length(); i++) {
        // Reemplazamos los caracteres especiales.
        output = output.replace(original.charAt(i), ascii.charAt(i));
    }//for i
    return output;
}
    
    
    

    public String MuestraFormEvaluaion() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();
            
             
            res.setRUTAIMAGENES(Constantes.rutaImages);
         
            
            if(res.getTIPO().equals("1")){
                
                   res.setFOLIO(res.getFOLIO().toUpperCase());
                
                
                 ListaRegEncuestados=con.ConsultaRegEnc(res);
                
                
                
                
            }
            
            
            
              if(res.getTIPO().equals("2")){
                  
                  
                 boolean nombre=false;
                  boolean amaterno=false;
                    boolean apaterno=false;
                    
                    
                if(res.getNOMBRE().length()>0){
                    
                    
                    res.setNOMBRE(res.getNOMBRE().toUpperCase());
                    
                   res.setNOMBRE(remove1(res.getNOMBRE()));
                    
                    
                    nombre=true;
                }   
                else{
                    addFieldError("ERRORNOMBRE", "Campo requerido");
                    nombre=false;
                    
                }
                    
                    if(res.getAMATERNO().length()>0){
                        res.setAMATERNO(res.getAMATERNO().toUpperCase());
                        
                        res.setAMATERNO(remove1(res.getAMATERNO())); 
                    
                    amaterno=true;
                }   
                else{
                         addFieldError("ERRORAM", "Campo requerido");
                    amaterno=false;
                    
                }   
                    
                   if(res.getAPATERNO().length()>0){
                       res.setAPATERNO(res.getAPATERNO().toUpperCase());
                    res.setAPATERNO(remove1(res.getAPATERNO())); 
                    apaterno=true;
                }   
                else{
                       addFieldError("ERRORAP", "Campo requerido");
                    apaterno=false;
                    
                }      
                    
                  
              if(nombre && amaterno && apaterno )    {
                  
            
                  
                ListaRegEncuestados=con.ConsultaRegEncNombre(res);
                
               if(ListaRegEncuestados.size()>0){
                   
                   bannombres=false;
                   
               }
               else{
                   
                    addFieldError("ERRORNONOMBRE", "No se encontro información del participante");
                   
                   return "ERROR";
                   
               }
                
                
                
                
                
                  }
              else{
                  
                  
                  
                  
                  
                  
                  
                  
                  return "ERROR";
              }
                  
                  
                  
                  
                  
                  
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            registrado=con.ConsultaRegistro(res);
            
          
           
           
            
         
            boolean contesto=false;
            
            for (int i = 0; i <ListaRegEncuestados.size() ; i++) {
                
                res.setNOMBRE_COMPLETO(ListaRegEncuestados.get(i).getNOMBRE_COMPLETO());
                res.setID_DATO(ListaRegEncuestados.get(i).getID_DATO());
                
                
               if(ListaRegEncuestados.get(i).getENCUESTAS().equals("1")) {
                contesto=true;
            }
               else{
                   contesto=false;
               }
                
            }
            
            
            
            ocultaboton=false;
            muestraboton=true;
            
            if(ListaRegEncuestados.size()>0){
            
            if(!contesto){
                
                   ListaEvento=con.ConsultaEventos();
           ListaTipo=con.ConsultaTipos();
            
            ListaEncabezado = con.ConsSecciones();
            ListaRespuestas1 = con.ConsultaRespuestas1();
            ListaRespuestas2 = con.ConsultaRespuestas2();
            ListaContestados.clear();

            Constantes.enviaMensajeConsola("lista Respuesta: " + ListaRespuestas1.size());
            Constantes.enviaMensajeConsola("lista Respuesta: " + ListaRespuestas2.size());

            banMuestraForm = true;
            muestraboton=false;
            ocultaboton=false;
            }
            else{
                
                 addFieldError("ERRORPREG", "El folio ya registro la encuesta");
                muestraboton=true;
                ocultaboton=false;
               banMuestraForm = false;  
               banConstancia=true;
                
            }
            }
            else{
                
                res.setFOLIO("");
                
                 addFieldError("ERRORFOLIO", "Folio no encontrado favor de verificarlo");
            }
            

         
            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
      public String MuestraMateriales() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();
            
            registrado=con.ConsultaRegistro(res);
            
            
              if(res.getTIPO().equals("1")){
                
                   res.setFOLIO(res.getFOLIO().toUpperCase());
                
                
                 ListaRegEncuestados=con.ConsultaRegEnc(res);
                
                
                
                
            }
            
            
            
              if(res.getTIPO().equals("2")){
                  
                  
                 boolean nombre=false;
                  boolean amaterno=false;
                    boolean apaterno=false;
                    
                    
                if(res.getNOMBRE().length()>0){
                    
                    
                    res.setNOMBRE(res.getNOMBRE().toUpperCase());
                    
                   res.setNOMBRE(remove1(res.getNOMBRE()));
                    
                    
                    nombre=true;
                }   
                else{
                    addFieldError("ERRORNOMBRE", "Campo requerido");
                    nombre=false;
                    
                }
                    
                    if(res.getAMATERNO().length()>0){
                        res.setAMATERNO(res.getAMATERNO().toUpperCase());
                        
                        res.setAMATERNO(remove1(res.getAMATERNO())); 
                    
                    amaterno=true;
                }   
                else{
                         addFieldError("ERRORAM", "Campo requerido");
                    amaterno=false;
                    
                }   
                    
                   if(res.getAPATERNO().length()>0){
                       res.setAPATERNO(res.getAPATERNO().toUpperCase());
                    res.setAPATERNO(remove1(res.getAPATERNO())); 
                    apaterno=true;
                }   
                else{
                       addFieldError("ERRORAP", "Campo requerido");
                    apaterno=false;
                    
                }      
                    
                  
              if(nombre && amaterno && apaterno )    {
                  
            
                  
                ListaRegEncuestados=con.ConsultaRegEncNombre(res);
                
               if(ListaRegEncuestados.size()>0){
                   
                   bannombres=false;
                   
               }
               else{
                   
                    addFieldError("ERRORNONOMBRE", "No se encontro información del participante");
                   
                   return "ERROR";
                   
               }
                
                
                
                
                
                  }
            
              }
           
            
           
            
            if(ListaRegEncuestados.size()>0){
                
                banMateriales=true;
            }
            else
            {
                
                 addFieldError("ERRORFOLIO", "Folio no encontrado favor de verificarlo");
                
                banMateriales=false;
            }
          

         
            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
    public String ConsultaNomEvento() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

           ListaNomEve=con.ConsultaNomEvento(res.getID_EVENTO());
            
            

            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
     public String materiales2() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

          
            
            

            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
     public String tipo() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

          if(res.getID_TIPO_PARTICIPANTE().equals("4")){
              
              bantipo=true;
              
          }
          else{
              bantipo=false;
          }
            
            

            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
    public String ActualizarFormEvalucion() {

        //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

            //Constantes.enviaMensajeConsola("ID que llega: "+ue.getID_IE_UE());
           

            ListaEncabezado = con.ConsSecciones();
            ListaRespuestas1 = con.ConsultaRespuestas1();
            ListaRespuestas2 = con.ConsultaRespuestas2();
            
           // ListaContestados=con.ConsultaRespuestas(ue.getID_IE_UE());

            Constantes.enviaMensajeConsola("lista Respuesta: " + ListaRespuestas1.size());
            Constantes.enviaMensajeConsola("lista Respuesta: " + ListaRespuestas2.size());

            banMuestraFormAct = true;

            return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }

    public String GuardaEvaluacion() {

       /* //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }*/

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

            //abriendo la conexion.....
           
            //ListaSecciones=(ArrayList<Bean_Secciones>) superior.ConsSecciones(CveCuestionario);

           
            boolean respuestas;
            boolean datos = false;

            int contador = 0;

            for (int i = 0; i < ListaContestados.size(); i++) {

                res.setID_RESPUESTA(ListaContestados.get(i).getID_RESPUESTA());

                if (res.getID_RESPUESTA().length() == 0) {
                    contador = contador + 1;
                   
                }

            }

            if (contador > 0) {
                respuestas = false;
                banMuestraForm=true;
                addFieldError("ERRORPREG2", "Debes responder todas las preguntas");
              

            } else {
                respuestas = true;

            }
            System.out.println("id_participante" + res.getID_TIPO_PARTICIPANTE());
            
           
            
            if(res.getID_EVENTO().length()>0 && res.getID_NOMBRE_EVENTO().length()>0 && res.getID_TIPO_PARTICIPANTE()!=null && res.getGENERO()!=null && res.getEDAD().length()>0){
                
               
                if(res.getID_TIPO_PARTICIPANTE().equals("4")){
                    
                    if(res.getOTRO_CARGO().length()>0){
                        datos=true;
                    }
                    else{
                         if(res.getID_EVENTO().length()==0){
                   
                  addFieldError("D1", "Compo requerido");  
               } 
                 if(res.getID_NOMBRE_EVENTO().length()==0){
                   
                  addFieldError("D2", "Compo requerido");  
               } 
                  if(res.getID_TIPO_PARTICIPANTE()==null ){
                   
                  addFieldError("D3", "Compo requerido");  
               } 
                   if(res.getGENERO()==null){
                   
                  addFieldError("D4", "Compo requerido");  
               } 
                    if(res.getEDAD().length()==0){
                   
                  addFieldError("D5", "Compo requerido");  
               } 
                 if(res.getOTRO_CARGO().length()==0){
                   
                  addFieldError("D7", "Compo requerido");  
               } 
                        
                        datos=false;
                    }
                    
                }
                else{
                    res.setOTRO_CARGO("NO");
                     datos=true;
                }
                
                
               
                
            }
            else{
                
                
               
               if(res.getID_EVENTO().length()==0){
                   
                  addFieldError("D1", "Compo requerido");  
               } 
                 if(res.getID_NOMBRE_EVENTO().length()==0){
                   
                  addFieldError("D2", "Compo requerido");  
               } 
                  if(res.getID_TIPO_PARTICIPANTE()==null ){
                   
                  addFieldError("D3", "Compo requerido");  
               } 
                   if(res.getGENERO()==null){
                   
                  addFieldError("D4", "Compo requerido");  
               } 
                    if(res.getEDAD().length()==0){
                   
                  addFieldError("D5", "Compo requerido");  
               } 
                    if(res.getID_TIPO_PARTICIPANTE().equals("4")){
                        
                        if(res.getOTRO_CARGO().length()==0){
                   
                  addFieldError("D7", "Compo requerido");  
               } 
                        
                    }
                
                
            }
            
            
            
            
            
            

            if (respuestas && datos) {
                
                 conecta = con.crearConexion();
            //statement
            objConexion = con.crearStatement(conecta);

                //Constantes.enviaMensajeConsola("ID que llega: "+ue.getID_IE_UE());
                Constantes.enviaMensajeConsola("ListaContestados: " + ListaContestados.size());
                
                
                
                if(res.getTIPO().equals("1")){
                     con.GuardaDatos(res);
                }
               
                  if(res.getTIPO().equals("2")){
                     con.GuardaDatosId(res);
                }
                  
             

                for (int i = 0; i < ListaContestados.size(); i++) {

                    res.setID_ENCABEZADO(ListaContestados.get(i).getID_ENCABEZADO());
                    res.setID_PREGUNTA(ListaContestados.get(i).getID_PREGUNTA());
                    res.setID_RESPUESTA(ListaContestados.get(i).getID_RESPUESTA());
                    res.setRESPUESTA(ListaContestados.get(i).getID_RESPUESTA());

                  
                    Constantes.enviaMensajeConsola("id encabezado: " + res.getID_ENCABEZADO());
                    Constantes.enviaMensajeConsola("id pregunta: " + res.getID_PREGUNTA());
                    Constantes.enviaMensajeConsola("id respuesta: " + res.getID_RESPUESTA());

                    con.GuardaEvaluacion(conecta, objPreConexion, res);

                    

                }

                //cerrando conexiones...
                cierraConexiones();
                ListaContestados.clear();
               
                res.setID_EVENTO("");
                res.setID_NOMBRE_EVENTO("");
                res.setID_TIPO_PARTICIPANTE("");
                res.setGENERO("");
                res.setEDAD("");
                res.setOTRO_CARGO("");
                res.setTIPO("");
                bantipo=false;
               
                banfolio=false;
                bannombres=false;
                
                banMuestraForm = false;
                 addFieldError("SEGUARDO", "¡La encuesta se guardo con éxito, gracias!");
                 
                 banConstancia=true;

            }
            
            else{
                
                 addFieldError("D6", "¡Todos los campos son requeridos, favor de verificar!");
                
            }
            
             return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
       
    public String ActualizaEvaluacion() {

        //validando session***********************************************************************
        if (session.get("cveUsuario") != null) {
            String sUsu = (String) session.get("cveUsuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }
        if (session.containsKey("usuario")) {
            usuariocons = (usuarioBean) session.get("usuario");
        } else {
            addActionError("**** La sesión ha expirado *** favor de iniciar una nueva sesion *** ");
            return "SESSION";
        }

        try {

            EvaluarDAOImpl con = new EvaluarDAOImpl();

            //abriendo la conexion.....
            conecta = con.crearConexion();
            //statement
            objConexion = con.crearStatement(conecta);
            //ListaSecciones=(ArrayList<Bean_Secciones>) superior.ConsSecciones(CveCuestionario);

            int cont_preg = 0;
            int cont_res = 0;
            int total_aciertos = 0;
            float total = 0;
            int porcentaje = 0;

            int cont_preg2 = 0;
            int cont_res2 = 0;
            int total_aciertos2 = 0;
            float total2 = 0;
            int porcentaje2 = 0;

            int cont_preg3 = 0;
            int cont_res3 = 0;
            int total_aciertos3 = 0;
            float total3 = 0;
            int porcentaje3 = 0;

            int suma_porcentajes = 0;
            float total_general = 0;
            int porcentaje_total = 0;

            boolean respuestas;

            int contador = 0;

            for (int i = 0; i < ListaContestados.size(); i++) {

                res.setID_RESPUESTA(ListaContestados.get(i).getID_RESPUESTA());

                if (res.getID_RESPUESTA().length() == 0) {
                    contador = contador + 1;
                    break;
                }

            }

            if (contador > 0) {
                respuestas = false;
                banMuestraForm=true;
                addFieldError("ERRORPREG", "Debes responder todas las preguntas");
                return "ERROR";

            } else {
                respuestas = true;

            }

            if (respuestas) {

                //Constantes.enviaMensajeConsola("ID que llega: "+ue.getID_IE_UE());
                Constantes.enviaMensajeConsola("ListaContestados: " + ListaContestados.size());

                for (int i = 0; i < ListaContestados.size(); i++) {
                    res.setID_EVALUACION(ListaContestados.get(i).getID_EVALUACION());
                    res.setID_ENCABEZADO(ListaContestados.get(i).getID_ENCABEZADO());
                    res.setID_PREGUNTA(ListaContestados.get(i).getID_PREGUNTA());
                    res.setID_RESPUESTA(ListaContestados.get(i).getID_RESPUESTA());
                    res.setRESPUESTA(ListaContestados.get(i).getID_RESPUESTA());

                    
               
                    Constantes.enviaMensajeConsola("id encabezado: " + res.getID_ENCABEZADO());
                    Constantes.enviaMensajeConsola("id pregunta: " + res.getID_PREGUNTA());
                    Constantes.enviaMensajeConsola("id respuesta: " + res.getID_RESPUESTA());

                    con.ActualizaEvaluacionUE(conecta, objPreConexion, res);

                    if (res.getID_ENCABEZADO().equals("1")) {
                        cont_preg = cont_preg + 1;
                        cont_res = cont_res + Integer.valueOf(res.getID_RESPUESTA());
                    }

                    if (res.getID_ENCABEZADO().equals("2")) {
                        cont_preg2 = cont_preg2 + 1;
                        cont_res2 = cont_res2 + Integer.valueOf(res.getID_RESPUESTA());
                    }

                    if (res.getID_ENCABEZADO().equals("3")) {
                        cont_preg3 = cont_preg3 + 1;
                        cont_res3 = cont_res3 + Integer.valueOf(res.getID_RESPUESTA());
                    }

                }

                //cerrando conexiones...
                cierraConexiones();

                Constantes.enviaMensajeConsola("seccion 1: ");

                total_aciertos = cont_preg * 2;
                total = (float) cont_res / total_aciertos;
                porcentaje = (int) (total * 100);

            Constantes.enviaMensajeConsola("total aciertos: " + total_aciertos);
            Constantes.enviaMensajeConsola("total respuesta: " + cont_res);
            Constantes.enviaMensajeConsola("total : " + total);
            Constantes.enviaMensajeConsola("porcentaje : " + porcentaje);
                Constantes.enviaMensajeConsola("seccion 2: ");

                total_aciertos2 = cont_preg2 * 3;
                total2 = (float) cont_res2 / total_aciertos2;
                porcentaje2 = (int) (total2 * 100);

            Constantes.enviaMensajeConsola("total aciertos2: " + total_aciertos2);
            Constantes.enviaMensajeConsola("total respuesta2: " + cont_res2);
            Constantes.enviaMensajeConsola("total 2: " + total2);
            Constantes.enviaMensajeConsola("porcentaje 2: " + porcentaje2);
                Constantes.enviaMensajeConsola("seccion 3: ");

                total_aciertos3 = cont_preg3 * 3;
                total3 = (float) cont_res3 / total_aciertos3;
                porcentaje3 = (int) (total3 * 100);

            Constantes.enviaMensajeConsola("total aciertos3: " + total_aciertos3);
            Constantes.enviaMensajeConsola("total respuesta3: " + cont_res3);
            Constantes.enviaMensajeConsola("total 3: " + total3);
            Constantes.enviaMensajeConsola("porcentaje 3: " + porcentaje3);
                suma_porcentajes = porcentaje + porcentaje2 + porcentaje3;
                total_general = (float) suma_porcentajes / 3;
                porcentaje_total = (int) (total_general);

                Constantes.enviaMensajeConsola("suma porcentajes: " + suma_porcentajes);
                Constantes.enviaMensajeConsola("total general: " + total_general);
                Constantes.enviaMensajeConsola("porcentaje total: " + porcentaje_total);

                

                ListaContestados.clear();

                banMuestraForm = false;

            }
            
             return "SUCCESS";

        } catch (Exception e) {

            TipoException = e.getMessage();
            return "ERROR";
        }

    }
    
    
    
    //****************************************valida UE***********************************************
    
     
     
     
    
    //********************CONEXION PARA LSITAS
    private void cierraConexiones() {
        try {
            objConexion.close();
//objPreConexion.close();
            conecta.close();

        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Ocurrio un error al cerrar conexiones: " + e);
        }
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public Map getSession() {
        return session;
    }

    public usuarioBean getUsuariocons() {
        return usuariocons;
    }

    public void setUsuariocons(usuarioBean usuariocons) {
        this.usuariocons = usuariocons;
    }

    public String getCveusuario() {
        return cveusuario;
    }

    public void setCveusuario(String cveusuario) {
        this.cveusuario = cveusuario;
    }

    public String getPasusuario() {
        return pasusuario;
    }

    public void setPasusuario(String pasusuario) {
        this.pasusuario = pasusuario;
    }

    public String getNomModulo() {
        return nomModulo;
    }

    public void setNomModulo(String nomModulo) {
        this.nomModulo = nomModulo;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public List<moduloBean> getModulosAUX() {
        return modulosAUX;
    }

    public void setModulosAUX(List<moduloBean> modulosAUX) {
        this.modulosAUX = modulosAUX;
    }

    public List<moduloAuxBean> getModulosAUXP() {
        return modulosAUXP;
    }

    public void setModulosAUXP(List<moduloAuxBean> modulosAUXP) {
        this.modulosAUXP = modulosAUXP;
    }

    public String getTipoError() {
        return TipoError;
    }

    public void setTipoError(String TipoError) {
        this.TipoError = TipoError;
    }

    public String getTipoException() {
        return TipoException;
    }

    public void setTipoException(String TipoException) {
        this.TipoException = TipoException;
    }

    public boolean isBanMuestraForm() {
        return banMuestraForm;
    }

    public void setBanMuestraForm(boolean banMuestraForm) {
        this.banMuestraForm = banMuestraForm;
    }

    public boolean isBanMuestraFormAct() {
        return banMuestraFormAct;
    }

    public void setBanMuestraFormAct(boolean banMuestraFormAct) {
        this.banMuestraFormAct = banMuestraFormAct;
    }

    public List<Cat_EventoBean> getListaEvento() {
        return ListaEvento;
    }

    public void setListaEvento(List<Cat_EventoBean> ListaEvento) {
        this.ListaEvento = ListaEvento;
    }

    public List<Cat_Nom_EveBean> getListaNomEve() {
        return ListaNomEve;
    }

    public void setListaNomEve(List<Cat_Nom_EveBean> ListaNomEve) {
        this.ListaNomEve = ListaNomEve;
    }

    public List<Cat_TipoParticipanteBean> getListaTipo() {
        return ListaTipo;
    }

    public void setListaTipo(List<Cat_TipoParticipanteBean> ListaTipo) {
        this.ListaTipo = ListaTipo;
    }
    
    
    
   

    public List<EncabezadoBean> getListaEncabezado() {
        return ListaEncabezado;
    }

    public void setListaEncabezado(List<EncabezadoBean> ListaEncabezado) {
        this.ListaEncabezado = ListaEncabezado;
    }

    public List<PreguntasBean> getListaPregEnca() {
        return listaPregEnca;
    }

    public void setListaPregEnca(List<PreguntasBean> listaPregEnca) {
        this.listaPregEnca = listaPregEnca;
    }

    public List<RespuestaBean> getListaRespuestas1() {
        return ListaRespuestas1;
    }

    public void setListaRespuestas1(List<RespuestaBean> ListaRespuestas1) {
        this.ListaRespuestas1 = ListaRespuestas1;
    }

    public List<RespuestaBean> getListaRespuestas2() {
        return ListaRespuestas2;
    }

    public void setListaRespuestas2(List<RespuestaBean> ListaRespuestas2) {
        this.ListaRespuestas2 = ListaRespuestas2;
    }

    public List<Res_ConBean> getListaContestados() {
        return ListaContestados;
    }

    public void setListaContestados(List<Res_ConBean> ListaContestados) {
        this.ListaContestados = ListaContestados;
    }

   

    public Res_ConBean getRes() {
        return res;
    }

    public void setRes(Res_ConBean res) {
        this.res = res;
    }

    public Statement getObjConexion() {
        return objConexion;
    }

    public void setObjConexion(Statement objConexion) {
        this.objConexion = objConexion;
    }

    public PreparedStatement getObjPreConexion() {
        return objPreConexion;
    }

    public void setObjPreConexion(PreparedStatement objPreConexion) {
        this.objPreConexion = objPreConexion;
    }

    public Connection getConecta() {
        return conecta;
    }

    public void setConecta(Connection conecta) {
        this.conecta = conecta;
    }

    public String getRegistrado() {
        return registrado;
    }

    public void setRegistrado(String registrado) {
        this.registrado = registrado;
    }

    public boolean isOcultaboton() {
        return ocultaboton;
    }

    public void setOcultaboton(boolean ocultaboton) {
        this.ocultaboton = ocultaboton;
    }

    public boolean isMuestraboton() {
        return muestraboton;
    }

    public void setMuestraboton(boolean muestraboton) {
        this.muestraboton = muestraboton;
    }

    public static Logger getLOG() {
        return LOG;
    }

    public static void setLOG(Logger LOG) {
        ActionSupport.LOG = LOG;
    }

    public List<Res_ConBean> getListaRegEncuestados() {
        return ListaRegEncuestados;
    }

    public void setListaRegEncuestados(List<Res_ConBean> ListaRegEncuestados) {
        this.ListaRegEncuestados = ListaRegEncuestados;
    }

    public boolean isBantipo() {
        return bantipo;
    }

    public void setBantipo(boolean bantipo) {
        this.bantipo = bantipo;
    }

    public boolean isBanConstancia() {
        return banConstancia;
    }

    public void setBanConstancia(boolean banConstancia) {
        this.banConstancia = banConstancia;
    }

    public boolean isBanMateriales() {
        return banMateriales;
    }

    public void setBanMateriales(boolean banMateriales) {
        this.banMateriales = banMateriales;
    }

    public boolean isBanfolio() {
        return banfolio;
    }

    public void setBanfolio(boolean banfolio) {
        this.banfolio = banfolio;
    }

    public boolean isBannombres() {
        return bannombres;
    }

    public void setBannombres(boolean bannombres) {
        this.bannombres = bannombres;
    }

    public boolean isTipoacceso() {
        return tipoacceso;
    }

    public void setTipoacceso(boolean tipoacceso) {
        this.tipoacceso = tipoacceso;
    }
    
    

}
