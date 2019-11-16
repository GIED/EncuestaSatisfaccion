<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>



<script type="text/javascript">
    

function IniciaEvaluacion(accion) {

        document.formularioPrincipal.action = accion;
        document.formularioPrincipal.submit();
    }

    function cerrar(accion) {

        document.formularioPrincipal.action = accion;
        document.formularioPrincipal.submit();
    }
    
    
    function MuestraForm(accion) {

      
      document.formularioPrincipal.action = accion;
      document.formularioPrincipal.submit();

    }
    
     function Muestra(accion, id_ue_ie) {

      document.formularioPrincipal.id_ue_ie.value = id_ue_ie;
      document.formularioPrincipal.action = accion;
      document.formularioPrincipal.submit();

    }
    
     function GuardaEvaluacion(accion) {

      
      document.formularioPrincipal.action = accion;
      document.formularioPrincipal.submit();

    }
    
     function Activa(accion, id_ue_ie,status) {

      document.formularioPrincipal.id_ue_ie.value = id_ue_ie;
      document.formularioPrincipal.status.value = status;
      document.formularioPrincipal.action = accion;
      document.formularioPrincipal.submit();

    }
    
     
    
    
     window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
                                    var pos = window.name || 0;
                                    window.scrollTo(0, pos);

            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button" //chrome
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            }
            
            

        }

        window.onunload = function () {
            window.name = self.pageYOffset
                    || (document.documentElement.scrollTop + document.body.scrollTop);


        }
        
        
            
       

</script>

<style>

#resultado {
    
    color: red;
    font-weight: bold;
}
#resultado.ok {
    
    color: green;
    font-weight: bold;
}

#resultado2 {
    
    color: red;
    font-weight: bold;
}
#resultado2.ok {
    
    color: green;
    font-weight: bold;
}

</style>



<html xmlns="http://www.w3.org/1999/xhtml">


    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon2.png">
            <link rel="icon" type="image/png" href="assets/img/favicon.png">
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
                <title>
                    Encuesta de Satisfacción
                </title>
                <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
                <!--     Fonts and icons     -->
                <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
                    <!-- CSS Files -->
                    <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
                    <!-- CSS Just for demo purpose, don't include it in your project -->
                    <link href="assets/demo/demo.css" rel="stylesheet" />
                    </head>

                    <body class="">
                        <s:form name="formularioPrincipal" id="formularioPrincipal" enctype="multipart/form-data">
                            <div class="wrapper ">
                                <div class="sidebar" data-color="rose" data-background-color="black" data-image="assets/img/sidebar-1.jpg">
                                    <!--
                                      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
                              
                                      Tip 2: you can also add an image using data-image tag
                                    -->
                                    <div class="logo">
                                        <a href="#" class="simple-text logo-normal" style="text-align: center;">
                                            Estado de México
                                        </a>
                                    </div>
                                    <div class="sidebar-wrapper">
                                        <div class="user">
                                            <div class="photo">
                                                <img src="assets/img/faces/m.png" />
                                            </div>
                                            <div class="user-info">
                                                <a data-toggle="collapse" href="#collapseExample" class="username">
                                                    <span>
                                                        <s:property value="usuariocons.USUARIO"></s:property>
                                                            <!--  <b class="caret"></b> -->
                                                        </span>
                                                    </a>
                                                    <div class="collapse" id="collapseExample">
                                                        <!-- <ul class="nav">
                                                           <li class="nav-item">
                                                             <a class="nav-link" href="#">
                                                               <span class="sidebar-mini"> MP </span>
                                                               <span class="sidebar-normal"> My Profile </span>
                                                             </a>
                                                           </li>
                                                           <li class="nav-item">
                                                             <a class="nav-link" href="#">
                                                               <span class="sidebar-mini"> EP </span>
                                                               <span class="sidebar-normal"> Edit Profile </span>
                                                             </a>
                                                           </li>
                                                           <li class="nav-item">
                                                             <a class="nav-link" href="#">
                                                               <span class="sidebar-mini"> S </span>
                                                               <span class="sidebar-normal"> Settings </span>
                                                             </a>
                                                           </li>
                                                         </ul> -->
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="nav">
                                            <jsp:include page="menu.jsp"></jsp:include>	
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="main-panel">
                                        <!-- Navbar -->
                                        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
                                            <div class="container-fluid">
                                                <div class="navbar-wrapper">

                                                    <a class="navbar-brand" href="#pablo">Encuesta de Satisfacción</a>
                                                </div>
                                                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                                                    <span class="sr-only">Toggle navigation</span>
                                                    <span class="navbar-toggler-icon icon-bar"></span>
                                                    <span class="navbar-toggler-icon icon-bar"></span>
                                                    <span class="navbar-toggler-icon icon-bar"></span>
                                                </button>
                                                <div class="collapse navbar-collapse justify-content-end">

                                                    <ul class="navbar-nav">


                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="material-icons">person</i>
                                                                <p class="d-lg-none d-md-block">
                                                                    Account
                                                                </p>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">

                                                                <!-- <div class="dropdown-divider"></div>-->
                                                                <a class="dropdown-item" href="Javascript:cerrar('CerrarSesion')">Cerrar Sesión</a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </nav>
                                        <!-- End Navbar -->
                                        <div class="content">
                                            <div class="row" style="margin-top: -40px;">
                                                <div class="col-md-12">
                                                    <div class="card">
                                                        <div class="card-header card-header-icon card-header-rose">
                                                            <div class="card-icon">
                                                                <i class="material-icons">perm_identity</i>
                                                            </div>
                                                            <h4 class="card-title">Perfil: 
                                                                <small class="category"><s:property value="usuariocons.NAMEPERFIL"></s:property></small>
                                                            </h4>
                                                        </div>
                                                        <div class="card-body">

                                                            <div class="row">
                                                                  <!--FOLIO -->                  
                                                                    <div class="col-md-12" >
                                                                        <div class="card">
                                                                            <div class="card-header card-header-primary card-header-icon">
                                                                                <div class="card-icon" style="background: #6200ea;">
                                                                                    <i class="material-icons" >location_city</i>
                                                                                </div>
                                                                                <h4 class="card-title">Encuesta de satisfación</h4>
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <div class="form-group">
                                                                                    <div class="col-12">
                                                                                        <s:textfield cssClass="form-control" name="FOLIO" id="FOLIO" placeholder="Ingrese su número de folio"></s:textfield> 
                                                                                    </div>
                                                                                    <br></br>
                                                                                    <div class="col-12 text-center">
                                                                                        <a class="btn btn-round btn-rose"  href="Javascript:IniciaEvaluacion('MuestraForm')">Iniciar encuesta</a>
                                                                                    </div>
                                                                                </div>
                                                                            
                                                                            </div>
                                                                            <!-- end content-->
                                                                        </div>
                                                                        <!--  end card  -->
                                                                        <s:if test="banMuestraForm">
                                                                        <div class="card">
                                                                            <div class="card-header text-center  font-weight-bold">
                                                                                <h3>Encuesta de Satisfacción</h3>
                                                                                <p class="text-left">Se evaluara la unidad económica con <strong>RFC:</strong><span class="text-primary font-weight-bold"><s:property value="ue.RFC" ></s:property></span> <br></br> <strong>Razon social:</strong><span class="text-primary font-weight-bold"> <s:property value="ue.RAZON_SOCIAL"></s:property></span> <br></br> <strong>Sucursal:</strong> <span class="text-primary font-weight-bold"><s:if test="ue.NOMBRE_SUC.lenght()>0"><s:property value="ue.NOMBRE_SUC"></s:property></s:if><s:else>SIN SUCURSAL</s:else></span> </p> 
                                                                                 <s:hidden name="ue.RFC" id="%{ue.RFC}"></s:hidden>
                                                                                 <s:hidden name="ue.RAZON_SOCIAL" id="%{ue.RAZON_SOCIAL}"></s:hidden>
                                                                                 <s:hidden name="ue.NOMBRE_SUC" id="%{ue.NOMBRE_SUC}"></s:hidden>
                                                                                
                                                                            </div>
                                                                            <div class="card-body">
                                                                                 <s:fielderror  fieldName="ERRORPREG" cssClass="col-lg-12 alert alert-danger"></s:fielderror>
                                                                                <div class="col-sm-12">                              
                                                                                    <div class="row">                                   
                                                                                        <s:if test="ListaEncabezado.size()>0">
                                                                                            <table class="table col-lg-12" >
                                                                                                <s:set var="NoPreg" value="1"/>
                                                                                                <s:set var="cont" value="0" />
                                                                                                <s:iterator value="ListaEncabezado" id="ListaEncabezado" status="stat1">
                                                                                                    
                                                                                                        <tr >
                                                                                                            <td class="badge-dark" colspan="2"  >
                                                                                                                <s:property value="NOM_ENCABEZADO"/>
                                                                                                                <s:hidden  name = "ListaEncabezado[%{#stat1.index}].ID_ENCABEZADO" id="ID_ENCABEZADO"></s:hidden>
                                                                                                                <s:hidden  name = "ListaEncabezado[%{#stat1.index}].NOM_ENCABEZADO" id="NOM_ENCABEZADO"></s:hidden>
                                                                                                            </td>
                                                                                                        </tr>    
                                                                                                   
                                                                                                        <s:iterator value="listaPregEnca" id="listaPregEnca" status="stat2">
                                                                                                                         
                                                                                                                        <tr>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].PREGUNTA" id="PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].ID_PREGUNTA" id="ID_PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].TIPO_PREGUNTA" id="TIPO_PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].ID_ENCABEZADO" id="ID_ENCABEZADO"></s:hidden>

                                                                                                                            
                                                                                                                                <td>
                                                                                                                                <s:property value="#NoPreg" />)&nbsp;&nbsp;
                                                                                                                                <%--<s:property value="#cont" />--%>
                                                                                                                                <s:property value="PREGUNTA"/><br/>
                                                                                                                            </td>
                                                                                                                            <td >
                                                                                                                                <s:if test="TIPO_PREGUNTA==1">
                                                                                                                                    <s:select  cssClass="form-control" name="ListaContestados[%{#cont}].ID_RESPUESTA" list="ListaRespuestas1"  listKey="ID_RESPUESTA" listValue="RESPUESTA"  headerKey="" headerValue="-SELECCIONA-"  style=" width:340px"/>
                                                                                                                                </s:if>
                                                                                                                                <s:elseif test="TIPO_PREGUNTA==2">
                                                                                                                                    <s:select  cssClass="form-control" name="ListaContestados[%{#cont}].ID_RESPUESTA" list="ListaRespuestas2"  listKey="ID_RESPUESTA" listValue="RESPUESTA"  headerKey="" headerValue="-SELECCIONA-"  style=" width:340px"/>

                                                                                                                                </s:elseif>
                                                                                                                                <s:hidden  name = "ListaContestados[%{#cont}].ID_ENCABEZADO" value="%{ID_ENCABEZADO}"></s:hidden>
                                                                                                                                <s:hidden  name = "ListaContestados[%{#cont}].ID_PREGUNTA" value="%{ID_PREGUNTA}"></s:hidden>
                                                                                                                                
                                                                                                                                


                                                                                                                                <s:set var="NoPreg" value="%{#NoPreg+1}"/>
                                                                                                                                <s:set var="cont" value="%{#cont+1}"/> 
                                                                                                                            </td>
                                                                                                                        
                                                                                                                            </tr>
                                                                                                                             
                                                                                                                    </s:iterator>                 
                                                                                                                        
                                                                                                                
                                                                                                                            
                                                                                                                                         
                                                                                                                            
                                                                                                    <s:set var="NoPreg" value="1"/>
                                                                                                </s:iterator>
                                                                                            </table>
                                                                                        </s:if>
                                                                                    
                                                                                    <s:iterator value="ListaRespuestas1" id="ListaRespuestas1" status="stat1">                        
                                                                                        <s:hidden  name = "ListaRespuestas1[%{#stat1.index}].ID_RESPUESTA" id="ID_RESPUESTA"></s:hidden>
                                                                                        <s:hidden  name = "ListaRespuestas1[%{#stat1.index}].RESPUESTA" id="RESPUESTA"></s:hidden>
                                                                                    </s:iterator>  
                                                                                    <s:iterator value="ListaRespuestas2" id="ListaRespuestas2" status="stat1">                        
                                                                                        <s:hidden  name = "ListaRespuestas2[%{#stat1.index}].ID_RESPUESTA" id="ID_RESPUESTA"></s:hidden>
                                                                                        <s:hidden  name = "ListaRespuestas2[%{#stat1.index}].RESPUESTA" id="RESPUESTA"></s:hidden>
                                                                                    </s:iterator>  



                                                                                    
                                                                                </div>  
                                                                                &nbsp;
                                                                                &nbsp;
                                                                                <div class=" col-md-12 text-center">
                                                                                    <a class="btn btn-round btn-rose"  href="Javascript:GuardaEvaluacion('GuardaEvaluacion')">Guardar Encuesta</a>
                                                                                </div> 
                                                                            </div>      
                                                                                
                                                                                
                                                                            </div>
                                                                        </div>     
                                                                        </s:if>
                                                                        
                                                                         <s:if test="banMuestraFormAct">
                                                                        <div class="card">
                                                                            <div class="card-header text-center  font-weight-bold">
                                                                                <h3>Actualización de Evaluacion de Unidad Económica</h3>
                                                                                
                                                                                <p class="text-left">Se actualizara la evaluación de la unidad económica con <strong>RFC:</strong><span class="text-primary font-weight-bold"><s:property value="ue.RFC" ></s:property></span> <br></br> <strong>Razon social:</strong><span class="text-primary font-weight-bold"> <s:property value="ue.RAZON_SOCIAL"></s:property></span> <br></br> <strong>Sucursal:</strong> <span class="text-primary font-weight-bold"><s:property value="ue.NOMBRE_SUC"></s:property></span> </p> 
                                                                                 <s:hidden name="ue.RFC" id="%{ue.RFC}"></s:hidden>
                                                                                 <s:hidden name="ue.RAZON_SOCIAL" id="%{ue.RAZON_SOCIAL}"></s:hidden>
                                                                                 <s:hidden name="ue.NOMBRE_SUC" id="%{ue.NOMBRE_SUC}"></s:hidden>
                                                                                
                                                                            </div>
                                                                            <div class="card-body">
                                                                                 <s:fielderror  fieldName="ERRORPREG" cssClass="col-lg-12 alert alert-danger"></s:fielderror>
                                                                                <div class="col-sm-12">                              
                                                                                    <div class="row">                                   
                                                                                        <s:if test="ListaEncabezado.size()>0">
                                                                                            <table class="table col-lg-12" >
                                                                                                <s:set var="NoPreg" value="1"/>
                                                                                                <s:set var="cont" value="0" />
                                                                                                <s:iterator value="ListaEncabezado" id="ListaEncabezado" status="stat1">
                                                                                                    
                                                                                                        <tr >
                                                                                                            <td class="badge-dark" colspan="2"  >
                                                                                                                <s:property value="NOM_ENCABEZADO"/>
                                                                                                                <s:hidden  name = "ListaEncabezado[%{#stat1.index}].ID_ENCABEZADO" id="ID_ENCABEZADO"></s:hidden>
                                                                                                                <s:hidden  name = "ListaEncabezado[%{#stat1.index}].NOM_ENCABEZADO" id="NOM_ENCABEZADO"></s:hidden>
                                                                                                            </td>
                                                                                                        </tr>    
                                                                                                   
                                                                                                        <s:iterator value="listaPregEnca" id="listaPregEnca" status="stat2">
                                                                                                                         
                                                                                                                        <tr>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].PREGUNTA" id="PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].ID_PREGUNTA" id="ID_PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].TIPO_PREGUNTA" id="TIPO_PREGUNTA"></s:hidden>
                                                                                                                        <s:hidden  name = "ListaEncabezado[%{#stat1.index}].listaPregEnca[%{#stat2.index}].ID_ENCABEZADO" id="ID_ENCABEZADO"></s:hidden>

                                                                                                                            
                                                                                                                                <td>
                                                                                                                                <s:property value="#NoPreg" />)&nbsp;&nbsp;
                                                                                                                                <%--<s:property value="#cont" />--%>
                                                                                                                                <s:property value="PREGUNTA"/><br/>
                                                                                                                            </td>
                                                                                                                            <td >
                                                                                                                                <s:if test="TIPO_PREGUNTA==100">
                                                                                                                                    <s:select  cssClass="form-control" name="ListaContestados[%{#cont}].ID_RESPUESTA" list="ListaRespuestas1"  listKey="ID_RESPUESTA" listValue="RESPUESTA"  headerKey="" headerValue="-SELECCIONA-"  style=" width:340px"/>
                                                                                                                                </s:if>
                                                                                                                                <s:elseif test="TIPO_PREGUNTA==200">
                                                                                                                                    <s:select  cssClass="form-control" name="ListaContestados[%{#cont}].ID_RESPUESTA" list="ListaRespuestas2"  listKey="ID_RESPUESTA" listValue="RESPUESTA"  headerKey="" headerValue="-SELECCIONA-"  style=" width:340px"/>

                                                                                                                                </s:elseif>
                                                                                                                                <s:hidden  name = "ListaContestados[%{#cont}].ID_ENCABEZADO" value="%{ID_ENCABEZADO}"></s:hidden>
                                                                                                                                <s:hidden  name = "ListaContestados[%{#cont}].ID_PREGUNTA" value="%{ID_PREGUNTA}"></s:hidden>
                                                                                                                                
                                                                                                                                


                                                                                                                                <s:set var="NoPreg" value="%{#NoPreg+1}"/>
                                                                                                                                <s:set var="cont" value="%{#cont+1}"/> 
                                                                                                                            </td>
                                                                                                                        
                                                                                                                            </tr>
                                                                                                                             
                                                                                                                    </s:iterator>                 
                                                                                                                        
                                                                                                                
                                                                                                                            
                                                                                                                                         
                                                                                                                            
                                                                                                    <s:set var="NoPreg" value="1"/>
                                                                                                </s:iterator>
                                                                                            </table>
                                                                                        </s:if>
                                                                                    
                                                                                    <s:iterator value="ListaRespuestas1" id="ListaRespuestas1" status="stat1">                        
                                                                                        <s:hidden  name = "ListaRespuestas1[%{#stat1.index}].ID_RESPUESTA" id="ID_RESPUESTA"></s:hidden>
                                                                                        <s:hidden  name = "ListaRespuestas1[%{#stat1.index}].RESPUESTA" id="RESPUESTA"></s:hidden>
                                                                                    </s:iterator>  
                                                                                    <s:iterator value="ListaRespuestas2" id="ListaRespuestas2" status="stat1">                        
                                                                                        <s:hidden  name = "ListaRespuestas2[%{#stat1.index}].ID_RESPUESTA" id="ID_RESPUESTA"></s:hidden>
                                                                                        <s:hidden  name = "ListaRespuestas2[%{#stat1.index}].RESPUESTA" id="RESPUESTA"></s:hidden>
                                                                                    </s:iterator>  



                                                                                    
                                                                                </div>  
                                                                                &nbsp;
                                                                                &nbsp;
                                                                                <div class=" col-md-12 text-center">
                                                                                    <a class="btn btn-round btn-rose"  href="Javascript:GuardaEvaluacion('ActualizaEvaluacion')">Actualizar Evaluación de Unidad Económica</a>
                                                                                </div> 
                                                                            </div>      
                                                                                
                                                                                
                                                                            </div>
                                                                        </div>     
                                                                        </s:if>
                                                                        
                                                                        
                                                                    </div>   
                                                                </div>
                                                            </div>                                                          
                                                        </div>
                                                    </div>
                                                    </div>                                                                                                                                                                                                                                         
                                                </div>
                                               
                                                    

                                                                                   
                                            </div>
                                        <footer class="footer">
                                            <div class="container-fluid">
                                                <nav class="float-left">
                                                    <ul>

                                                        <!-- <li>
                                                           <a href="https://www.creative-tim.com/license">
                                                             Licenses
                                                           </a>
                                                         </li> -->
                                                    </ul>
                                                </nav>
                                                <div class="copyright float-center">
                                                    <i class="material-icons"></i> Gobierno del Estado de México.
                                                    
                                                    <s:textfield name="ue.ID_ESC" id="ue.ID_ESC" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.ID_IE_UE" id="id_ue_ie" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.ID_SUC" id="id_suc" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.STATUS_GENERAL" id="status" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.CVE_MUNICIPIOR" id="ue.CVE_MUNICIPIOR" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.CVE_MUNICIPIO_PLA" id="ue.CVE_MUNICIPIO_PLA" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.CVE_MUNICIPIO_SUC" id="ue.CVE_MUNICIPIO_SUC" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.RFCVALIDO" id="rfcvalidado" cssStyle="display:none;"></s:textfield>
                                                    <s:textfield name="ue.VALOR" id="VALOR" cssStyle="display:none;"></s:textfield>
                                                    
                                                   
                                                
                                                </div>
                                            </div>
                                        </footer>
                                    </div>
                                </div>

                                <!--   Core JS Files   -->
                                
                                               
                                
                                <script src="assets/js/core/jquery.min.js"></script>
                                <script src="assets/js/core/popper.min.js"></script>
                                <script src="assets/js/core/bootstrap-material-design.min.js"></script>
                                <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
                                <!-- Plugin for the momentJs  -->
                                <script src="assets/js/plugins/moment.min.js"></script>
                                <!--  Plugin for Sweet Alert -->
                                <script src="assets/js/plugins/sweetalert2.js"></script>
                                <!-- Forms Validations Plugin -->
                                <script src="assets/js/plugins/jquery.validate.min.js"></script>
                                <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
                                <script src="assets/js/plugins/jquery.bootstrap-wizard.js"></script>
                                <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
                                <script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
                                <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
                                <script src="assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
                                <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
                                <script src="assets/js/plugins/jquery.dataTables.min.js"></script>
                                <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
                                <script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
                                <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
                                <script src="assets/js/plugins/jasny-bootstrap.min.js"></script>
                                <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
                                <script src="assets/js/plugins/fullcalendar.min.js"></script>
                                <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
                                <script src="assets/js/plugins/jquery-jvectormap.js"></script>
                                <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
                                <script src="assets/js/plugins/nouislider.min.js"></script>
                                <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
                                <!-- Library for adding dinamically elements -->
                                <script src="assets/js/plugins/arrive.min.js"></script>
                                <!--  Google Maps Plugin    -->
                                <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
                                <!-- Chartist JS -->
                                <script src="assets/js/plugins/chartist.min.js"></script>
                                <!--  Notifications Plugin    -->
                                <script src="assets/js/plugins/bootstrap-notify.js"></script>
                                <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
                                <script src="assets/js/material-dashboard.js?v=2.1.0" type="text/javascript"></script>
                                <!-- Material Dashboard DEMO methods, don't include it in your project! -->
                                <script src="assets/demo/demo.js"></script>
                                <script>
    $(document).ready(function () {
        $().ready(function () {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

            if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                    $('.fixed-plugin .dropdown').addClass('open');
                }

            }

            $('.fixed-plugin a').click(function (event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function () {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function () {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function () {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function () {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function () {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function () {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function () {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function () {
                    clearInterval(simulateWindowResize);
                }, 1000);

            });
        });
    });
                                </script>
                                <script>
                                    $(document).ready(function () {
                                        md.checkFullPageBackgroundImage();
                                    });
                                </script>






                        </body>
                                                                                    
                                                                           
                                                                                    
                                                                                    
                    </s:form>
                    </html>
