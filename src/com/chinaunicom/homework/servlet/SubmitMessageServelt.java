package com.chinaunicom.homework.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.chinaunicom.homework.bean.CommentBean;


/**
 * 张永峰
 * @author Administrator
 *提交留言
 */
@WebServlet("/submitMessage")
public class SubmitMessageServelt extends HttpServlet {
	
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) {
    		
    	try{
    		
	    	String username = request.getParameter("username");
	    	String title = request.getParameter("title");
	    	String content = request.getParameter("content");
	    	CommentBean commentBean = new CommentBean(username,title,content,new Date());
    		@SuppressWarnings("unchecked")
			ArrayList<CommentBean>  commmentList = (ArrayList<CommentBean> )request.getSession().getAttribute("commentList");
    		if(commmentList == null){
    			 commmentList =  new ArrayList<CommentBean>();
    			 commmentList.add(commentBean);
    		}else{
    			 commmentList.add(commentBean);
    		}
    	    request.getSession().setAttribute("commentList", commmentList);
    	}catch (Exception e) {
    		try {
				resp.getWriter().print(JSON.toJSONString("0"));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
    }

}