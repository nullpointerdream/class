package com.hlk.util;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionFilter implements Filter {

    public void destroy() {
        // TODO 暂不使用

    }

    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
            throws IOException, ServletException {

        //获取request和response
        HttpServletRequest request = (HttpServletRequest)arg0;
        HttpServletResponse response = (HttpServletResponse)arg1;
        //获取session
        HttpSession session = request.getSession();
        //获取请求
        String url = request.getServletPath();
        //System.out.println(url);
        //获取登录用户信息
        Object user = (Object) session.getAttribute("user");
        if(user != null && !"".equals(user)){//用户已登录
            arg2.doFilter(arg0, arg1);//不拦截
            return;
        }else{//用户未登录
            //允许样式通过(即css、js、images、bootstrap)
            if(url.indexOf("css") > -1 || url.indexOf("image") > -1
                    || url.indexOf("bootstrap") > -1 || url.indexOf("img") > -1
                    || url.indexOf("fonts") > -1 || url.indexOf("js") > -1){

                arg2.doFilter(arg0, arg1);//不拦截
                return;
            }
            //允许登录和注册register
            if(url.contains("login")||url.contains("insert")||url.contains("register")){
                arg2.doFilter(arg0, arg1);//不拦截
                return;
            }else{
                request.setAttribute("message", "您还未登录，请先登录！");
                request.getRequestDispatcher("/").forward(request, response);//重定向到登录界面
                return;
            }
        }

    }

    public void init(FilterConfig arg0) throws ServletException {
        // TODO 暂不使用

    }

}
