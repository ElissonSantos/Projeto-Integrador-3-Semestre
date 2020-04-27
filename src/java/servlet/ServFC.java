package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.FaleConosco;
import modelo.FaleConoscoDAO;

@WebServlet(name = "ServFC", urlPatterns = {"/faleConosco", "/fc"})
public class ServFC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nome = request.getParameter("nome_contato");
        String email = request.getParameter("email_contato");
        String telefone = request.getParameter("telefone_contato");
        String mensagem = request.getParameter("mensagem");

        FaleConosco contatoFC = new FaleConosco(nome, email, telefone, mensagem);
        FaleConoscoDAO.salvarFale(contatoFC);

        if (contatoFC == null) {
            request.setAttribute("result", "Não foi possivel capturar sua mensagem.");
            request.getRequestDispatcher("faleConosco.jsp").forward(request, response);
        } else {
            request.setAttribute("result", "Mensagem enviada com sucesso.");
            request.getRequestDispatcher("faleConosco.jsp").forward(request, response);
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
