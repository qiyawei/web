package com.kaishengit.web;

import com.google.gson.Gson;
import com.kaishengit.entity.Message;
import com.kaishengit.service.WeiboService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/weibo.do")
public class WeiboServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String maxId = req.getParameter("maxId");
        //System.out.println(maxId);

        List<Message> messageList = new WeiboService().findByMaxId(maxId);
        System.out.println(messageList.size());
        Map<String,Object> map = new HashMap<>();
        map.put("data",messageList);

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(new Gson().toJson(map));
        out.flush();
        out.close();

    }
}
