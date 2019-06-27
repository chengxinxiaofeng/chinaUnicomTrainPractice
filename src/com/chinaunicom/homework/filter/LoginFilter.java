package com.chinaunicom.homework.filter;



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 张永峰
 * @author Administrator
 * 登录过滤器
 *
 */
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String currentURL = request.getRequestURI();
        String targetURL = currentURL.substring(currentURL.indexOf("/",1),currentURL.length());
        Boolean isLogin = (Boolean)request.getSession().getAttribute("isLogin");
        if("/message.jsp".equals(targetURL)||
        ("/submitMessage").equals(targetURL)||
        ("/getMessageList").equals(targetURL)){
            if(isLogin==null){
                response.sendRedirect(request.getContextPath()+"/forbidden.jsp");
                return;
            }
        }

        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}