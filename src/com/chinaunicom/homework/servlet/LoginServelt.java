package com.chinaunicom.homework.servlet;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


/**
 * 张永峰
 * @author Administrator
 * 用户登录
 *
 */
@WebServlet("/login")
public class LoginServelt extends HttpServlet {
	
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) {
    		
    	try{
	    	String username = request.getParameter("username");
	    	String pwd = request.getParameter("pwd");
	    	HashMap<Object, Object> resultMap = new HashMap<>();
	    	if(username != null && username.equals("unicom") &&
	    		pwd != null	&& pwd.equals("unicom") ){
	    			resultMap.put("isSuccess", "200");
					resp.getWriter().print(JSON.toJSONString(resultMap));
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("username", username);
	    	}else{
	    		resultMap.put("isSuccess", "0");
	    		resp.getWriter().print(JSON.toJSONString(resultMap));
	    	}
    	}catch (Exception e) {
    		try {
				resp.getWriter().print(JSON.toJSONString("0"));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
    }

}