package com.chinaunicom.homework.servlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 张永峰
 * @author Administrator
 * 退出登录
 *
 */
@WebServlet("/logout")
public class LogoutServelt extends HttpServlet {
	
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) {
    	request.getSession().removeAttribute("isLogin");
    	//request.getSession().invalidate();
    }

}