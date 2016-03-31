package com.kaishengit.web;

import com.kaishengit.entity.Product;
import com.kaishengit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/read.xml")
public class ReadXmlServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = new ProductService().findAll();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<products>");
        for(Product product : list){
            out.println("<product id=\""+product.getId()+"\">");
            out.println("<productName>"+product.getProductName()+"</productName>");
            out.println("<num>"+product.getNum()+"</num>");
            out.println("<price>"+product.getPrice()+"</price>");
            out.println("</product>");
        }
        out.println("</products>");
        out.flush();
        out.close();
    }

}
