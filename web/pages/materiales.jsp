<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>



<script type="text/javascript">
    
    
    
    
     function validarSiNumero(numero){
    if (!/^\-?[1-9]\d{0,2}$/.test(numero))
     
    
     
     document.getElementById('EDAD').value="";
     
  }
    
    function telquita() {
  var x = document.getElementById("quitamen").style="display:none;";
  
}
 function telquita1() {
  var x = document.getElementById("quitamen1").style="display:none;";
  
}

 function telquita2() {
  var x = document.getElementById("quitamen2").style="display:none;";
  
}

 function telquita3() {
  var x = document.getElementById("quitamen3").style="display:none;";
  
}

 function telquita4() {
  var x = document.getElementById("quitamen4").style="display:none;";
  
}

 function telquita5() {
  var x = document.getElementById("quitamen5").style="display:none;";
  
}
 function telquita6() {
  var x = document.getElementById("quitamen6").style="display:none;";
  
}
function telquita9() {
  var x = document.getElementById("quitamen9").style="display:none;";
  
}

 function validarInput(input) {
	var curp = input.value.toUpperCase(),
    	resultado = document.getElementById("resultado"),
        valido = "No válido";
        div = document.getElementById('btnvalidar');
        div.style.display = 'none';
                
    if (curpValida(curp)) {
    	valido = "Válido";
        resultado.classList.add("ok");
        
        div = document.getElementById('btnvalidar');
        div.style.display = '';    
        
        
        
    } else {
    	resultado.classList.remove("ok");
    }
      
    resultado.innerText = "\n Formato de folio: " + valido;
      
}
    
    
    
  function curpValida(curp) {
	var re = /^([A-Z]{1}[0-9]{4,5})$/,
       
                validado = curp.match(re);
	
    if (!validado)  //Coincide con el formato general?
    	return false;
    
    //Validar que coincida el dígito verificador
    
    
     else   
	return true; //Validado
}
        


    

function IniciaEvaluacion(accion) {
     
     
    
    
        document.formularioPrincipal.action = accion;
        document.formularioPrincipal.submit();
    
        
    }
    
    function valorotros(accion) {
        
        document.formularioPrincipal.action = accion;
        document.formularioPrincipal.submit();
           
    }
    
    
    
function ConsultaNomEvento(accion) {

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

                    <body class="" background="assets/img/fondo.jpg">
                     
                        <s:form name="formularioPrincipal" id="formularioPrincipal" enctype="multipart/form-data">
                            <div class="wrapper " style="margin-top: 50px;">
                                
                                <div style="max-width: 900px;  margin: auto;">
                                        <!-- Navbar -->
                                       
                                        <!-- End Navbar -->
                                        <div class="content">
                                            <div class="row" style="margin-top: -40px;">
                                                <div class="col-md-12">
                                                    <div class="card">
                                                       
                                                        <div class="card-body">

                                                            <div class="row">
                                                                  <!--FOLIO -->                  
                                                                    <div class="col-md-12" >
                                                                        <div class="card">
                                                                            
                                                                            <div style="width: 100%;">
                                                                                <img src="assets/img/banner.jpg" alt="" style="width: 100%;"/>
                                                                           
                                                                                
                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                            <div style="width: 100%; text-align: center; margin-top: 20px;">
                                                                                
                                                                                <h3 class="card-title">Materiales</h3>
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <div class="form-group" style="margin-bottom: 20px;">
                                                                                   
                                                                                    
                                                                                     <div class="col-lg-12" style="margin-top: 20px; margin-bottom: 15px;">
                                                                                      <label for="SECTOR">Ingresar por:</label>
                                                                                                  <s:radio label="Genero" name="res.TIPO" list="#{'1':'Folio','2':'Nombre'}"   onclick= "Javascript:valorotros('elegirAccesoMateriales')" cssStyle="margin-left:15px;"  />   
                                                                                                       <s:fielderror  fieldName="D4" cssClass="col-lg-12 alert alert-danger" id="quitamen4"></s:fielderror>

                                                                                 </div>  
                                                                                    
                                                                                    
                                                                                      <s:fielderror  fieldName="SEGUARDO" cssClass="col-lg-12 alert alert-success" cssStyle="margin-top:10px;"></s:fielderror>
                                                                                    <s:fielderror  fieldName="ERRORPREG" cssClass="col-lg-12 alert alert-danger"></s:fielderror>
                                                                                    <s:fielderror  fieldName="ERRORFOLIO" cssClass="col-lg-12 alert alert-danger" id="quitamen6"></s:fielderror>
                                                                                    <s:fielderror  fieldName="SI" cssClass="col-lg-12 alert alert-danger"></s:fielderror>
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                 <s:if test="banfolio">
                                                                                                           
                                                                                   
                                                                                                           <div class="col-12">
                                                                                                           <s:textfield cssClass="form-control" name="res.FOLIO" id="FOLIO" placeholder="Ingrese su número de folio" oninput="validarInput(this); telquita6();"  maxLength="6"></s:textfield> 
                                                                                                           </div>

                                                                                                           <pre id="resultado" > </pre>


                                                                                                       <br></br>
                                                                                                           <div id="btnvalidar" style="display: none;">
                                                                                                               <div class="col-12 text-center">
                                                                                                                   <a class="btn btn-round btn-rose"  href="Javascript:IniciaEvaluacion('MuestraMateriales')">Consultar Folio</a>
                                                                                                               </div>
                                                                                                           </div>

                                                                              </s:if> 
                                                                                                           
                                                                                                           
                                                                            <s:if test="bannombres">
                                                                                                           
                                                                                   
                                                                                                            <div class="col-12" style="margin-bottom: 10px;">
                                                                                                           <s:textfield cssClass="form-control" name="res.NOMBRE" id="NOMBRE" placeholder="Nombre(s)" oninput="telquita10();"  ></s:textfield> 
                                                                                                            <s:fielderror  fieldName="ERRORNOMBRE" cssClass="col-lg-12 alert alert-danger" id="quitamen10"></s:fielderror>
                                                                                                            
                                                                                                            
                                                                                                            </div>
                                                                                                            <div class="col-12" style="margin-bottom: 10px;">
                                                                                                           <s:textfield cssClass="form-control" name="res.APATERNO" id="APATERNO" placeholder="Apellido Paterno" oninput="telquita11();" ></s:textfield> 
                                                                                                           <s:fielderror  fieldName="ERRORAP" cssClass="col-lg-12 alert alert-danger" id="quitamen11"></s:fielderror>

                                                                                                            
                                                                                                            </div>
                                                                                                             <div class="col-12" style="margin-bottom: 10px;">
                                                                                                           <s:textfield cssClass="form-control" name="res.AMATERNO" id="AMATERNO" placeholder="Apellido Materno" oninput="telquita12();"  ></s:textfield> 
                                                                                                             <s:fielderror  fieldName="ERRORAM" cssClass="col-lg-12 alert alert-danger" id="quitamen12"></s:fielderror>

                                                                                                           </div>
                                                                                                          


                                                                                                      
                                                                                                           <div id="btnvalidar">
                                                                                                               <div class="col-12 text-center">
                                                                                                                   <a class="btn btn-round btn-rose"  href="Javascript:IniciaEvaluacion('MuestraMateriales')">Consultar Folio</a>
                                                                                                               </div>
                                                                                                           </div>
                                                                                                             
                                                                                                          <s:fielderror  fieldName="ERRORNONOMBRE" cssClass="col-lg-12 alert alert-danger" id="quitamen12"></s:fielderror>
 
                                                                                                             
                                                                                                             
                                                                                                             
                                                                                                             

                                                                              </s:if>    
                                                                             
                                                                             
                                                                             
                                                                             
                                                                                </div>
                                                                               
                                                                               
                                                                               <s:if test="banMateriales">     
                                                                               
                                                                                <div class="col-md-12">
                                                                <div class="card">
                                                                    <div class="card-header card-header-rose card-header-icon">
                                                                        <div class="card-icon">
                                                                            <i class="material-icons">assignment</i>
                                                                        </div>
                                                                        <h4 class="card-title">Materiales</h4>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-shopping">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th class="text-center"></th>
                                                                                        <th>Materiales</th>
                                                                                        <th class="th-description">Versión</th>
                                                                                        
                                                                                        <th></th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td align="center">
                                                                                            <div class="img-container">
                                                                                                <a href="https://educacionedomex-my.sharepoint.com/:u:/g/personal/pedro_fabela_edugem_gob_mx/EUwrx3TvlWxJk1uDGdjJxtYBtGUs0R0cIWRmoEih7Eia6w?e=OSxCyl" target="_blank"> <img src="assets/img/pdf-icon.png" alt="..." style="width: 50%;"/></a>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td class="td-name">
                                                                                            <a href="https://educacionedomex-my.sharepoint.com/:u:/g/personal/pedro_fabela_edugem_gob_mx/EUwrx3TvlWxJk1uDGdjJxtYBtGUs0R0cIWRmoEih7Eia6w?e=OSxCyl" target="_blank">Materiales Foro 2019</a>
                                                                                            <br>
                                                                                                <small>Materiales del Foro</small>
                                                                                        </td>
                                                                                        <td>
                                                                                            Versión 1.0
                                                                                        </td>
                                                                                       
                                                                                    </tr>
                                                                                    
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>            
                                                            
                                                                        </s:if>    
                                                                               
                                                                                <s:hidden name="banMateriales" id="%{banMateriales}"></s:hidden>
                                                                                    
                                                                                 
                                                                                    
                                                                                    
                                                                                    
                                                                            
                                                                            </div>
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                            <!-- end content-->
                                                                        </div>
                                                                        <!--  end card  -->
                                                                        
                                                                        
                                                                       
                                                                        
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
