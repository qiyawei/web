package com.kaishengit.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by qiyawei on 2016/4/5.
 */
@WebServlet("/jsonp.js")
public class JsonpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodName = request.getParameter("callback");
        //response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(methodName + "({'name':'jack'})");
        out.flush();
        out.close();
    }
}
