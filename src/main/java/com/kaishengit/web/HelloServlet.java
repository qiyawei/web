package com.kaishengit.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by qiyawei on 2016/3/29.
 */
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String username = req.getParameter("name");
       // username = new String(username.getBytes("ISO8859-1"),"UTF-8");
        PrintWriter out = resp.getWriter();
        if("tom".equals(username)){
            out.print("yes");
        }else{
            out.print("no");
        }
    }
}
