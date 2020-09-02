package egovframework.example.tp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.example.tp.service.UserVO;

public class LoginCheckFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("public void destory() 매소드 작동");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		boolean isRedirect = false;
		String requestURI = request.getRequestURI();
		System.out.println("doFilter작동: " + requestURI);
		
		if (!requestURI.equals("/testProject/newIndex.do") && !requestURI.equals("/testProject/loginUser.do") 
				&& !requestURI.equals("/testProject/joinForm.do") && !requestURI.equals("/testProject/idCheck.do") && !requestURI.equals("/testProject/insertUser.do")) {
			UserVO loginEmp = (UserVO) request.getSession().getAttribute("whoSession");
			if(loginEmp == null) {
				isRedirect = true;
			}
		}
		
		if(isRedirect == true) {
			/*req.getRequestDispatcher("/testProject/newIndex.do").forward(req, resp);*/
			response.sendRedirect("/testProject/newIndex.do");
		}else {
			chain.doFilter(req, resp);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("public void init() 매소드 작동");
	}
	
	
}
