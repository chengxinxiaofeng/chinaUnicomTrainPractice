package com.chinaunicom.homework.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.chinaunicom.homework.bean.CommentBean;



/**
 * 张永峰
 * @author Administrator
 * 获取留言
 *
 */
@WebServlet("/getMessageList")
public class GetMessageListServelt extends HttpServlet {
	
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) {
    		
    	try{
    		
	    	HashMap<Object, Object> resultMap = new HashMap<>();
    		@SuppressWarnings("unchecked")
			ArrayList<CommentBean>  commmentList = (ArrayList<CommentBean> )request.getSession().getAttribute("commentList");
    		if(commmentList == null){
    	    	resultMap.put("code", 0);
    	    	resultMap.put("msg", "查询成功");
    	    	resultMap.put("count", 0);
    	    	resultMap.put("data", commmentList);
    		}else{
    		   	resultMap.put("code", 0);
    	    	resultMap.put("msg", "查询成功");
    	    	resultMap.put("count", commmentList.size());
    	    	resultMap.put("data", commmentList);
    		}
	    	resp.getWriter().print(JSON.toJSONString(resultMap));
    	}catch (Exception e) {
    		try {
				resp.getWriter().print(JSON.toJSONString("0"));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
    }

}