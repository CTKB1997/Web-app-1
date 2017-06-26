/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thanh
 */
public class DieuphoiServlet extends HttpServlet {

    private final String loginPage = "login.html";
    private final String loginServlet = "LoginServlet";
    private final String searchServlet = "SearchServlet";
    private final String deleteRecordServlet = "DeleteRecordServlet";
    private final String updateRecordServlet = "UpdateRecordServlet";
    private final String nullServlet = "NullServlet";
    private final String addItemServlet = "AddItemServlet";
    private final String viewCartPage = "viewCart.jsp";
    private final String removeItemServlet = "RemoveItemServlet";
    private final String createRecordServlet = "CreateRecordServlet";
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = loginPage;
        try {
            /* TODO output your page here. You may use following sample code. */
            String button = request.getParameter("btAction");

            if (button == null) {
                url = nullServlet;
            } else if (button.equals("Login")) {
                url = loginServlet;
            } else if (button.equals("Search")) {
                url = searchServlet;
            } else if(button.equals("delete")) {
                url = deleteRecordServlet;
            } else if (button.equals("Update")) {
                url = updateRecordServlet;
            } else if (button.equals("Add Book To Your Cart")) {
                url = addItemServlet;
            } else if (button.equals("View Your Card")) {
                url = viewCartPage;
            } else if (button.equals("Remove Selected Items")) {
                url = removeItemServlet;
            } else if (button.equals("Create New Account")) {
                url = createRecordServlet;
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
