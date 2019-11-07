package org.apache.jsp.viewsPortal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class table_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Portal-CV</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Tabulator config -->\n");
      out.write("        <link href=\"../node_modules/tabulator-tables/dist/css/tabulator.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script type=\"text/javascript\" src=\"../node_modules/tabulator-tables/dist/js/tabulator.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div id=\"example-table\"></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            var Tabulator = require('tabulator-tables');\n");
      out.write("            //define some sample data\n");
      out.write("            var tabledata = [\n");
      out.write("                {id: 1, name: \"Oli Bob\", age: \"12\", col: \"red\", dob: \"\"},\n");
      out.write("                {id: 2, name: \"Mary May\", age: \"1\", col: \"blue\", dob: \"14/05/1982\"},\n");
      out.write("                {id: 3, name: \"Christine Lobowski\", age: \"42\", col: \"green\", dob: \"22/05/1982\"},\n");
      out.write("                {id: 4, name: \"Brendon Philips\", age: \"125\", col: \"orange\", dob: \"01/08/1980\"},\n");
      out.write("                {id: 5, name: \"Margret Marmajuke\", age: \"16\", col: \"yellow\", dob: \"31/01/1999\"},\n");
      out.write("            ];\n");
      out.write("\n");
      out.write("            //create Tabulator on DOM element with id \"example-table\"\n");
      out.write("            var table = new Tabulator(\"#example-table\", {\n");
      out.write("                height: 205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)\n");
      out.write("                data: tabledata, //assign data to table\n");
      out.write("                layout: \"fitColumns\", //fit columns to width of table (optional)\n");
      out.write("                columns: [//Define Table Columns\n");
      out.write("                    {title: \"Name\", field: \"name\", width: 150},\n");
      out.write("                    {title: \"Age\", field: \"age\", align: \"left\", formatter: \"progress\"},\n");
      out.write("                    {title: \"Favourite Color\", field: \"col\"},\n");
      out.write("                    {title: \"Date Of Birth\", field: \"dob\", sorter: \"date\", align: \"center\"},\n");
      out.write("                ],\n");
      out.write("                rowClick: function(e, row) { //trigger an alert message when the row is clicked\n");
      out.write("                    alert(\"Row \" + row.getData().id + \" Clicked!!!!\");\n");
      out.write("                },\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
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
