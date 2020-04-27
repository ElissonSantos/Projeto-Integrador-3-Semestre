package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Noticia;
import modelo.NoticiaDAO;

@WebServlet(name = "ServEdit", urlPatterns = {"/editPost", "/edit"})
public class ServEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String titulo = request.getParameter("titulo");
        String corpo = request.getParameter("corpo");
        String urlImg = request.getParameter("urlImg");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Noticia editado = new Noticia(id, titulo, corpo, urlImg);
        NoticiaDAO.editar(editado);

        if (editado == null) {
            request.setAttribute("result", "Não foi possivel salvar a edição.");
            request.getRequestDispatcher("admLogado.jsp").forward(request, response);
        } else {
            request.setAttribute("result", "Noticia editada com sucesso.");
            request.getRequestDispatcher("admLogado.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
