package org.apache.jsp.viewsPortal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class insertObj_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Portal-CV</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link media=\"screen\" href=\"../css/plone.css\" type=\"text/css\" rel=\"stylesheet\" id=\"plone-css\" />    \n");
      out.write("        <link media=\"all\" href=\"../css/main.css\" type=\"text/css\" rel=\"stylesheet\" id=\"main-css\" />  \n");
      out.write("        <link media=\"all\" href=\"../css/style.css\" type=\"text/css\" rel=\"stylesheet\" id=\"style-css\" />\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("        <link media=\"all\" href=\"../css/css-intranet-inpe.css\" rel=\"stylesheet\" id=\"intranet-css\" /> \n");
      out.write("        <link media=\"all\" href=\"../css/css-menu.css\" rel=\"stylesheet\" id=\"menu-css\" /> \n");
      out.write("        <link media=\"all\" href=\"../css/css-home.css\" rel=\"stylesheet\"/>\n");
      out.write("        <link media=\"all\" rel=\"stylesheet\" type=\"text/css\" href=\"../css/css-servico-inpe.css\"/>\n");
      out.write("        <link media=\"all\" href=\"../css/css-branco-inpe.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link media=\"all\" href=\"../css/css-intranet-inpe-contraste.css\" rel=\"stylesheet\" id=\"intranet-css-contraste\" /> \n");
      out.write("        <link media=\"all\" href=\"../css/css-menu-contraste.css\" rel=\"stylesheet\" id=\"menu-css-contraste\" />   \n");
      out.write("\n");
      out.write("        <script src=\"../js/jquery/jquery-1.9.1.js\" type=\"application/javascript\"></script>  \n");
      out.write("        <script src=\"../js/jquery/jquery.cookie.js\" type=\"application/javascript\"></script>  \n");
      out.write("        <script src=\"../js/functions.js\" type=\"application/javascript\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../views/topo.jsp", out, false);
      out.write("\n");
      out.write("        <div id=\"main\" role=\"main\">\n");
      out.write("            <div id=\"plone-content\">\n");
      out.write("                <div id=\"portal-columns\" class=\"row\">\n");
      out.write("                    <!-- Column 1 - MENU --> \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../views/menu.jsp", out, false);
      out.write("\n");
      out.write("                    <!-- Conteudo -->\n");
      out.write("                    <div id=\"portal-column-content\" class=\"cell width-3:4 position-1:4\">\n");
      out.write("                        <div id=\"main-content\">    \n");
      out.write("                            <div id=\"content\">\n");
      out.write("                                <h1 class=\"documentFirstHeading\">Cataclysmic register</h1>\n");
      out.write("                                <form method=\"POST\" action=\"./feedbackCreate.jsp\">      \n");
      out.write("                                    <fieldset>\n");
      out.write("                                        <div class=\"form-group mt-3\">\n");
      out.write("                                            <label for=\"ra\">Object name</label>\n");
      out.write("                                            <input type=\"text\" name=\"nameObj\" class=\"form-control col-md-4\"required>                            \n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group mt-3\">\n");
      out.write("                                            <label for=\"ra\">RA</label>\n");
      out.write("                                            <input type=\"text\" name=\"raObj\" class=\"form-control col-md-4\" placeholder=\"hh mm ss.ss\" required>                            \n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group mt-4\">\n");
      out.write("                                            <label for=\"dec\">DEC</label>\n");
      out.write("                                            <input type=\"text\" name=\"decObj\" class=\"form-control col-md-4\" placeholder=\"+/-dd mm ss.ss\" required>                            \n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-success mt-2\">Submit</button>   \n");
      out.write("                                        <button type=\"reset\" class=\"btn btn-primary mt-2 ml-3\">Reset values</button>\n");
      out.write("                                        <br><br>                                        \n");
      out.write("                                    </fieldset>\n");
      out.write("                                </form>\n");
      out.write("                                <br><br><br><br>\n");
      out.write("                                <p>\n");
      out.write("                                    <strong>Desenvolvido por <a href=\"http://www.cea.inpe.br/\" title=\"Acesse COCTI/INPE\" target=\"_blank\">CEA/INPE</a></strong>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <div class=\"clear\"></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Fim do Conteudo -->      \n");
      out.write("                    <div class=\"clear\"><!-- --></div>\n");
      out.write("                    <div id=\"voltar-topo\"><a href=\"#topo\" title=\"Acesse Voltar para o topo\">Voltar para o topo</a></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"clear\"><!-- --></div>\n");
      out.write("\n");
      out.write("        <!-- Footer -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../views/rodape.jsp", out, false);
      out.write("\n");
      out.write("        <!-- /Footer-->\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
