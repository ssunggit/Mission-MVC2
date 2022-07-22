package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet(urlPatterns = {"*.do"},
			initParams =  {@WebInitParam(name="controllers", 
										 value="kr.ac.kopo.board.controller.BoardController"
										 + "|kr.ac.kopo.login.controller.LoginController")})						
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping mappings;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		String ctrlNames = config.getInitParameter("controllers");
//		System.out.println(ctrlNames);

		try {
			mappings = new HandlerMapping(ctrlNames);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		System.out.println("uri : " + uri);
		String view = "";
//		System.out.println(mappings.getCtrlAndMethod("/board/list.do").getTarget());
//		System.out.println(mappings.getCtrlAndMethod("/board/list.do").getMethod());
		try {			
			CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
			System.out.println("cam : " + cam);
			if(cam == null) {
				throw new Exception("해당 URL은 존재하지 않습니다.");
			}
			
			Object target = cam.getTarget();
			Method method = cam.getMethod();
			
//			메소드를 실행해라(메소드, 파라미터)
			ModelAndView mav = (ModelAndView)method.invoke(target, request, response);
			view = mav.getView();
			
			// 공유영역 등록			
			Map<String, Object> model = mav.getModel();
			Set<String> keys = model.keySet();
			
			for(String key : keys) {
				request.setAttribute(key, model.get(key));
			}
			
		} catch (Exception e) {	
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(e.getMessage());
			out.close();
			
			System.out.println(e.getMessage());
		}
		// 응답(forward, sendRedirect)
		if(view.startsWith("redirect:")) {
			view = view.substring("redirect:".length());
			response.sendRedirect(view);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
}
