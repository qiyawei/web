package com.kaishengit.web;

import com.kaishengit.util.HttpClientUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by qiyawei on 2016/3/31.
 */
@WebServlet("/cidian.do")
public class CidianServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word =request.getParameter("word");
        word = new String(word.getBytes("ISO8859-1"),"UTF-8");
        String msg = HttpClientUtil.getStringByUrl("" + word);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(msg);
        out.flush();
        out.close();
    }
}
