package daos;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import beans.EncabezadoBean;
import beans.PreguntasBean;
import beans.Res_ConBean;
import beans.RespuestaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import mappers.ConsultaRespuestasMapper;
import mappers.CuestionarioMapper;
import mappers.EncabezadoMapper;
import mappers.EventoMapper;
import mappers.NombreEventoMapper;
import mappers.RespuestasMapper;
import mappers.TipoMapper;
import mappers.regEncMapper;


import utilidades.Constantes;
import utilidades.ObjPrepareStatement;

/**
 *
 * @author dinamarca
 */
public class EvaluarDAOImpl {

    OracleDAOFactory oraDaoFac = new OracleDAOFactory();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    Date date = new Date();
    
    public Connection crearConexion() throws Exception {
        
        Connection conne;
        conne = oraDaoFac.createConnection();
        Constantes.enviaMensajeConsola("conexion abierta.........");
        return conne;

    }

    //creando statement
    public Statement crearStatement(Connection cone) throws Exception {
        Statement stei;
        stei = oraDaoFac.createStatement2(cone);
        return stei;
    }
    
    public List ConsultaEventos() throws Exception {
        String query = "SELECT id_evento,nombre_evento FROM cat_evento where status=1";
        Constantes.enviaMensajeConsola("Consulta eventos----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new EventoMapper());
        return list;
    }
     public List ConsultaRegEnc(Res_ConBean res) throws Exception {
        String query = "SELECT FOLIO, ENCUENSTAS AS ENCUESTAS,NOMBRES||' '||APATERNO||' '||AMATERNO AS NOMBRE_COMPLETO, ID_DATO FROM tbl_datos_generales WHERE FOLIO='"+res.getFOLIO()+"'";
        Constantes.enviaMensajeConsola("Consulta eventos----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new regEncMapper());
        return list;
    }
     
      public List ConsultaRegEncNombre(Res_ConBean res) throws Exception {
        String query = "SELECT FOLIO, ENCUENSTAS AS ENCUESTAS,NOMBRES||' '||APATERNO||' '||AMATERNO AS NOMBRE_COMPLETO, ID_DATO FROM (SELECT ID_DATO,  FOLIO,  ID_NOM_EVE,  ID_TIPO,  ID_GENERO,  FECREG,  EDAD,  CURP,  translate(NOMBRES, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')AS NOMBRES,  translate(APATERNO, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')AS  APATERNO,  translate(AMATERNO, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')AS  AMATERNO,  ENCUENSTAS,  OTRO_CARGO FROM TBL_DATOS_GENERALES) WHERE NOMBRES='"+res.getNOMBRE()+"' AND APATERNO='"+res.getAPATERNO()+"' AND AMATERNO='"+res.getAMATERNO()+"'";
        Constantes.enviaMensajeConsola("Consulta eventos----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new regEncMapper());
        return list;
    }
    
     public String ConsultaRegistro(Res_ConBean res) throws Exception {
        String query = "SELECT  folio FROM tbl_datos_generales where folio='"+res.getFOLIO()+"'";
        Constantes.enviaMensajeConsola("Consulta eventos----->" + query);
        String list = null;
      list = oraDaoFac.queryStringUnCampo(query);
        return list;
    }
    
    public List ConsultaTipos() throws Exception {
        String query = "SELECT id_tipo,descripcion FROM cat_tipo_participante where status=1";
        Constantes.enviaMensajeConsola("Consulta eventos----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new TipoMapper());
        return list;
    }
    
    public List ConsultaNomEvento(String idevento) throws Exception {
        String query = "SELECT id_nom_eve,descripcion FROM cat_nombre_evento where id_evento='"+idevento+"' AND status=1";
        Constantes.enviaMensajeConsola("Consulta nombre eventos----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new NombreEventoMapper());
        return list;
    }
    

    public List ConsultaSecciones() throws Exception {
        String query = "SELECT id_encabezado,nom_encabezado FROM cat_encabezado";
        Constantes.enviaMensajeConsola("Consulta encabezado----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new EncabezadoMapper());
        return list;
    }
    
    
    public List ConsSecciones() throws Exception {
        
        List<PreguntasBean> listaPreguntas = null;
        
        List<PreguntasBean> listaPregSecc = new ArrayList<PreguntasBean>();
        

        List ListaFinal = new ArrayList();
        List listaSecciones = null;

        EncabezadoBean SECC;
        PreguntasBean PREG;
        

        String sWhere = "' ";
        String query = "SELECT id_encabezado,nom_encabezado FROM cat_encabezado";
        Constantes.enviaMensajeConsola("--consulta secciones tabla.....-->" + query);
//        List list = null;
//        list = queryForList(query, new Mapper_Secciones());
//        return list;

        listaSecciones = oraDaoFac.queryForList(query, new EncabezadoMapper());

        listaPreguntas = ConsultaPreguntas(); //llamamos metodo lista preguntas
        
        //System.out.println("TAMAÑO DE LISTA SECCIONES---" + listaSecciones.size());
        
        if (listaSecciones.size() > 0) {
            
            Iterator LS = listaSecciones.iterator();
            while (LS.hasNext()) {
                
                SECC = (EncabezadoBean) LS.next();
                //System.out.println("SECC--->"+ SECC.getNOM_SECCIONS());

                listaPregSecc = new ArrayList<PreguntasBean>();
                
                //System.out.println("TAMAÑO DE LISTA PREGUNTAS---" + listaPreguntas.size());
                
                Iterator LP = listaPreguntas.iterator();
                
                while (LP.hasNext()) {
                    //System.out.println("llegoaqui****************");
                    
                    PREG = (PreguntasBean) LP.next();
                    
                        //System.out.println("IDSECC--->"+ SECC.getID_SECCIONS());
                        //System.out.println("IDSECCPREG--->"+ PREG.getIDSECC());
                        
                    if (SECC.getID_ENCABEZADO().equals(PREG.getID_ENCABEZADO()) ) {
                        
                        listaPregSecc.add(PREG);
                        //System.out.println("si coincide Preguntas---" + PREG.getNOMPREG());
                        //contador=contador+1;
                        //}
                        
                    }
                }
                SECC.setListaPregEnca(listaPregSecc);
                ListaFinal.add(SECC);
            }

        }
        //System.out.println("TAMAÑO FINAL..." + ListaFinal.size());
        return ListaFinal;
    }
    

    public List ConsultaPreguntas() throws Exception {
        String query = "SELECT c.id_encabezado,c.nom_encabezado,p.id_pregunta,p.pregunta,p.tipo_pregunta,r.orden "
                + "FROM TBL_EN_PR R INNER JOIN cat_encabezado C ON r.id_encabezado=c.id_encabezado "
                + "INNER JOIN cat_preguntas P ON r.id_pregunta=p.id_pregunta ORDER BY c.id_encabezado, r.orden";
        Constantes.enviaMensajeConsola("Consulta PREGUNTAS----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new CuestionarioMapper());
        return list;
    }
    
    public List ConsultaRespuestas1() throws Exception {
        String query = "SELECT id_respuesta,respuesta FROM cat_respuestas where id_tipo_pregunta='1' ";
        Constantes.enviaMensajeConsola("Consulta respuestas----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new RespuestasMapper());
        return list;
    }
    public List ConsultaRespuestas2() throws Exception {
        String query = "SELECT id_respuesta,respuesta FROM cat_respuestas where id_tipo_pregunta='2'";
        Constantes.enviaMensajeConsola("Consulta respuestas----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new RespuestasMapper());
        return list;
    }
    
    public List ConsultaRespuestas(String id_ie_ue) throws Exception {
        String query = "SELECT id_evaluacion,id_pregunta,id_respuesta FROM tbl_evaluacion_ue where id_ie_ue='"+id_ie_ue+"' ORDER BY id_evaluacion";
        Constantes.enviaMensajeConsola("Consulta UE en IE ----->" + query);
        List list = null;
        list = oraDaoFac.queryForList(query, new ConsultaRespuestasMapper());
        return list;
    }
    
    public String ConsultaIdDato(String folio) throws Exception {
        String query = "SELECT id_dato FROM tbl_datos_generales where folio='"+folio+"'";
        Constantes.enviaMensajeConsola("Consulta id datos ----->" + query);
        String valor = null;
        valor = oraDaoFac.queryStringUnCampo(query);
        return valor;
    }
    
    public boolean GuardaDatos(Res_ConBean res) throws Exception {

//Crear un ArrayList para agregar los campos a insertar
        ArrayList<ObjPrepareStatement> arregloCampos = new ArrayList<ObjPrepareStatement>();
//Crear un objeto de tipo ObjPrepareStatement
        ObjPrepareStatement temporal;
//imprimiendo los valores del objeto tipo CCT...........
        Constantes.enviaMensajeConsola("Entre al DAO del INSERT...................................");

//En el objeto temporal settear el campo de la tabla, el tipo de dato y el valor a insertar
        
        
        temporal = new ObjPrepareStatement("ID_NOM_EVE", "STRING", res.getID_NOMBRE_EVENTO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_TIPO", "STRING", res.getID_TIPO_PARTICIPANTE());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_GENERO", "STRING", res.getGENERO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("EDAD", "STRING", res.getEDAD());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("OTRO_CARGO", "STRING", res.getOTRO_CARGO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ENCUENSTAS", "STRING", "1");
        arregloCampos.add(temporal);
        
        String Condicion="where FOLIO='"+res.getFOLIO()+"'  ";

//Se terminan de adicionar a nuesto ArrayLis los objetos
//Ejecutar la funcion del OracleDAOFactory queryInsert, se deber pasar como parmetros la tabla en donde se insertara
         return oraDaoFac.queryUpdate("TBL_DATOS_GENERALES", arregloCampos, Condicion);
    }
     public boolean GuardaDatosId(Res_ConBean res) throws Exception {

//Crear un ArrayList para agregar los campos a insertar
        ArrayList<ObjPrepareStatement> arregloCampos = new ArrayList<ObjPrepareStatement>();
//Crear un objeto de tipo ObjPrepareStatement
        ObjPrepareStatement temporal;
//imprimiendo los valores del objeto tipo CCT...........
        Constantes.enviaMensajeConsola("Entre al DAO del INSERT...................................");

//En el objeto temporal settear el campo de la tabla, el tipo de dato y el valor a insertar
        
        
        temporal = new ObjPrepareStatement("ID_NOM_EVE", "STRING", res.getID_NOMBRE_EVENTO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_TIPO", "STRING", res.getID_TIPO_PARTICIPANTE());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_GENERO", "STRING", res.getGENERO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("EDAD", "STRING", res.getEDAD());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("OTRO_CARGO", "STRING", res.getOTRO_CARGO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ENCUENSTAS", "STRING", "1");
        arregloCampos.add(temporal);
        
        String Condicion="where ID_DATO='"+res.getID_DATO()+"'  ";

//Se terminan de adicionar a nuesto ArrayLis los objetos
//Ejecutar la funcion del OracleDAOFactory queryInsert, se deber pasar como parmetros la tabla en donde se insertara
         return oraDaoFac.queryUpdate("TBL_DATOS_GENERALES", arregloCampos, Condicion);
    }
    
    public boolean GuardaEvaluacion(Connection conn, PreparedStatement stat,Res_ConBean res) throws Exception {

//Crear un ArrayList para agregar los campos a insertar
        ArrayList<ObjPrepareStatement> arregloCampos = new ArrayList<ObjPrepareStatement>();
//Crear un objeto de tipo ObjPrepareStatement
        ObjPrepareStatement temporal;
//imprimiendo los valores del objeto tipo CCT...........
        Constantes.enviaMensajeConsola("Entre al DAO del INSERT...................................");

//En el objeto temporal settear el campo de la tabla, el tipo de dato y el valor a insertar
        temporal = new ObjPrepareStatement("ID_DATO", "STRING", res.getID_DATO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_ENCABEZADO", "STRING", res.getID_ENCABEZADO());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_PREGUNTA", "STRING", res.getID_PREGUNTA());
        arregloCampos.add(temporal);
        temporal = new ObjPrepareStatement("ID_RESPUESTA", "STRING", res.getID_RESPUESTA());
        arregloCampos.add(temporal);
        

//Se terminan de adicionar a nuesto ArrayLis los objetos
//Ejecutar la funcion del OracleDAOFactory queryInsert, se deber pasar como parmetros la tabla en donde se insertara
        return oraDaoFac.queryInsertTransaccion(conn, stat,"TBL_EVALUACION_ENCUESTA", arregloCampos);
    }
    
     public boolean ActualizaEvaluacionUE(Connection conn, PreparedStatement stat,Res_ConBean res) throws Exception {

//Crear un ArrayList para agregar los campos a insertar
        ArrayList<ObjPrepareStatement> arregloCampos = new ArrayList<ObjPrepareStatement>();
//Crear un objeto de tipo ObjPrepareStatement
        ObjPrepareStatement temporal;
//imprimiendo los valores del objeto tipo CCT...........
        Constantes.enviaMensajeConsola("Entre al DAO del INSERT...................................");

//En el objeto temporal settear el campo de la tabla, el tipo de dato y el valor a insertar
        
        temporal = new ObjPrepareStatement("ID_RESPUESTA", "STRING", res.getID_RESPUESTA());
        arregloCampos.add(temporal);
        
        String Condicion="where ID_IE_UE='"+res.getFOLIO()+"' AND ID_ENCABEZADO='"+res.getID_ENCABEZADO()+"' AND ID_PREGUNTA='"+res.getID_PREGUNTA()+"' ";

//Se terminan de adicionar a nuesto ArrayLis los objetos
//Ejecutar la funcion del OracleDAOFactory queryInsert, se deber pasar como parmetros la tabla en donde se insertara
        return oraDaoFac.queryUpdateTransaccion(conn, stat,"TBL_EVALUACION_UE", arregloCampos, Condicion);
    }
     
     
    
    
}
