/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.ControllerQuiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ricardo Mota
 */
@WebServlet(name = "ServletQuiz", urlPatterns = {"/ServletQuiz"})
public class ServletQuiz extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             Logger.getLogger("ola mundo");
            /* TODO output your page here. You may use following sample code. */
            String answer[] = new String[10];
            String nameParameter = "";
            for (int i = 0; i < 10; i++) {
                nameParameter = "question-"+(i+1);
                answer[i] = request.getParameter(nameParameter);
            }
            
            ControllerQuiz quiz = new ControllerQuiz();
            String name = (String)request.getSession().getAttribute("name");
            quiz.setAnswer(answer);
            quiz.setUser(name);
            quiz.saveHistory();
            
            System.out.println(quiz.finalAcceptQuestion);
            
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            session.setAttribute("accept", Integer.toString(quiz.finalAcceptQuestion));
            //String returnControllerAnswer[] = quiz.returnAnswer();
            
            response.sendRedirect("resultado.jsp");
//            int acertos = quiz.countCorrect();
            
            //Out
//            for (int i = 0; i < 10; i++) {
//                out.print("<p>Questão " + (i+1) + " = " + returnControllerAnswer[i] + "</p>");
//            }
//            out.print("<p>Corretos: "+acertos+"</p>");
           
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletQuiz.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletQuiz.class.getName()).log(Level.SEVERE, null, ex);
        }
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
