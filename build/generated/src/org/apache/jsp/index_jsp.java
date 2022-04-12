package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String email = (String) session.getAttribute("session_email");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title> Royal World - Home </title>\n");
      out.write("        \n");
      out.write("        <!-- Latest compiled and minified CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" />\n");
      out.write("\n");
      out.write("        <!-- Optional theme -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" />\n");
      out.write("\n");
      out.write("        <!-- Latest compiled and minified JavaScript -->\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" ></script>\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" />\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                \n");
      out.write("                ");

                    if( email == null ? email == null : email.trim().equals("null") )
                    {
                
      out.write("\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("                ");

                    }
                    else
                    {
                
      out.write("\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "profileheader.jsp", out, false);
      out.write("\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                \n");
      out.write("                <div class=\"slideshow-container\">\n");
      out.write("                    <div class=\"mySlides fade\">\n");
      out.write("                        <div class=\"numbertext\">1 / 3</div>\n");
      out.write("                        <img class=\"slide-image-design\" alt=\"Background Image One\" src=\"images/font_image_one.jpg\" height=\"600\" width=\"100%\" />\n");
      out.write("                        <div class=\"text\"> Caption One </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div class=\"mySlides fade\">\n");
      out.write("                        <div class=\"numbertext\">2 / 3</div>\n");
      out.write("                        <img class=\"slide-image-design\" alt=\"Background Image Two\" src=\"images/font_image_two.jpg\" style=\"display: none;\" height=\"600\" width=\"100%\" />\n");
      out.write("                        <div class=\"text\"> Caption Two </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div class=\"mySlides fade\">\n");
      out.write("                        <div class=\"numbertext\">3 / 3</div>\n");
      out.write("                        <img class=\"slide-image-design\" alt=\"Background Image Three\" src=\"images/font_image_three.jpg\" style=\"display: none;\" height=\"600\" width=\"100%\" />\n");
      out.write("                        <div class=\"text\"> Caption Three </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <a class=\"prev\" onclick=\"plusSlides(-1)\">&#10094;</a>\n");
      out.write("                    <a class=\"next\" onclick=\"plusSlides(1)\">&#10095;</a>\n");
      out.write("                \n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <br>\n");
      out.write("                \n");
      out.write("                <div style=\"text-align: center;\">\n");
      out.write("                    <span class=\"dot\" onclick=\"currentSlide(1)\"></span>\n");
      out.write("                    <span class=\"dot\" onclick=\"currentSlide(2)\"></span>\n");
      out.write("                    <span class=\"dot\" onclick=\"currentSlide(3)\"></span>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            var slideIndex = 1;\n");
      out.write("            showSlides(slideIndex);\n");
      out.write("            \n");
      out.write("            function plusSlides(n)\n");
      out.write("            {\n");
      out.write("                showSlides(slideIndex += n);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function currentSlide(n)\n");
      out.write("            {\n");
      out.write("                showSlides(slideIndex = n);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function showSlides(n)\n");
      out.write("            {\n");
      out.write("                var i;\n");
      out.write("                var slides = document.getElementsByClassName(\"mySlides\");\n");
      out.write("                var dots = document.getElementsByClassName(\"dot\");\n");
      out.write("                \n");
      out.write("                if( n > slides.length )\n");
      out.write("                {\n");
      out.write("                    slideIndex = 1;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                if( n < 1 )\n");
      out.write("                {\n");
      out.write("                    slideIndex = slides.length;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                for( i = 0 ; i < slides.length ; i++ )\n");
      out.write("                {\n");
      out.write("                    slides[i].style.display = \"none\";\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                for( i = 0 ; i < dots.length ; i++ )\n");
      out.write("                {\n");
      out.write("                    dots[i].className = dots[i].className.replace(\" active\", \"\");\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                slides[slideIndex-1].style.display = \"block\";\n");
      out.write("                dots[slideIndex-1].className += \" active\";\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
