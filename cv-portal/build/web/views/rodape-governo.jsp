<%-- 
    Document   : rodape-governo
    Created on : 12/07/2019, 10:31:35
    Author     : lucas
--%>

<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 
    String ip = InetAddress.getLocalHost().getHostAddress(); //pegando o ip da máquina 
    URL caminho = new URL("http://" + ip + ":8080/cv-portal/img/"); //caminho da aplicação web onde está localizado o arquivo
%>

<!DOCTYPE html>
<html>


    <input type="checkbox" name="cont" id="contrasteRodape" checked="checked" class="none" />
    <label for="contrasteRodape" class="contraste none">ALTO CONTRASTE</label>                
    <a class="contraste none" id="contraste-link-rodape" title="Altere o Contraste">Alto Contraste</a>

    <div class="rodope-logo-governo" >    
        <div class="conteudo-rodape">
            <ul>
                <li><a href="http://www.acessoainformacao.gov.br/" title="Acesso à Informação" target="_blank"><img src= <% out.print(caminho+"acesso-a-infornacao.png"); %> alt="Acesso à Informação"></a></li>
                <li><a href="http://www.brasil.gov.br/" title="Portal Brasil" target="_blank"><img src= <% out.print(caminho+"brasil.png"); %> alt="Portal Brasil"></a></li>
            </ul>
            <div class="clear"><!-- --></div>
        </div>
    </div>

    <div class="assina-inpe" >
        <div class="conteudo-rodape">2018 © INPE - Instituto Nacional de Pesquisas Espaciais <span class="right">Desenvolvido por <a href="http://www.cea.inpe.br/" title="Acesse COCTI/INPE" target="_blank" />CEA/INPE</a></span></div>
    </div>
</html>
