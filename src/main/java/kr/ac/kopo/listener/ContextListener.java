package kr.ac.kopo.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.service.BoardService;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
@WebListener
public class ContextListener implements ServletContextListener {

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
    	System.out.println("리스너 시작...");
    	
    	ServletContext sc = event.getServletContext();
    	
    	BoardDAO boardDao = new BoardDAO();
    	// 서비스(비니시스로직)에게 매개변수로 넘겨줘야함 
    	BoardService boardService = new BoardService(boardDao);
    	
    	sc.setAttribute("boardDao", boardDao);
    	sc.setAttribute("boardService", boardService);
    }
	
}
