<%-- 
    Document   : barra-governo
    Created on : 12/07/2019, 09:34:39
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    

<!--ORIGINAL
- quando a barra do governo sofrer alterações, deve-se entrar através de um navegador no link  abaixo (//barra.brasil.gov.br/barra.js) e copiar o código que aparece para o arquivo /include/barra_governo.js
-->
<div id="barra-brasil" style="background:#7F7F7F; height: 20px; padding:0 0 0 10px;display:block;">
  <ul id="menu-barra-temp" style="list-style:none;">
    <li style="display:inline; float:left;padding-right:10px; margin-right:10px; border-right:1px solid #EDEDED">
        <a href="http://brasil.gov.br" style="font-family:sans,sans-serif; text-decoration:none; color:white;">Portal do Governo Brasileiro</a>
    </li>
    <li>
       <a style="font-family:sans,sans-serif; text-decoration:none; color:white;" href="http://epwg.governoeletronico.gov.br/barra/atualize.html">Atualize sua Barra de Governo</a>
    </li>
  </ul>
</div>
<script defer="defer" src="//barra.brasil.gov.br/barra.js" type="text/javascript"></script>
</html>
