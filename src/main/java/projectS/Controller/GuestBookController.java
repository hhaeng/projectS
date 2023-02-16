package projectS.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectS.dao.GuestBookDAO;
import projectS.dto.GuestBookDTO;

@WebServlet("/guestbook_servlet/*")
public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		System.out.println("요청 url: "+url);
		
		// db처리하는 객체 생성 : dao객체 
		GuestBookDAO dao = new GuestBookDAO();
		
		if (url.contains("list.do")) {
			System.out.println("list.do 처리중...");
			
			// 방명록 리스트를 받음
			List<GuestBookDTO> items = dao.getList();
			
			// view페이지에서 출력할 자료보관
			request.setAttribute("list", items);
			System.out.println("list.do() 처리 완료후 list.jsp페이지 이동");
			
			// view페이지 이동
			String page = "/guestbook/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.contains("insert.do")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			GuestBookDTO dto = new GuestBookDTO();
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			// 받은 자료 db저장
			dao.gbInsert(dto);
			
			response.sendRedirect(request.getContextPath()+"/guestbook_servlet/list.do");
			
			String page = "/guestbook/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if (url.contains("passwd_check.do")) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String passwd = request.getParameter("passwd");
			System.out.println("idx:"+idx+", passwd:"+passwd);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("idx", idx);
			map.put("passwd", passwd);
			
			boolean result = dao.passwCheck(map);
			System.out.println("passwd check result : "+ result);
			// result : true이면 비밀번호일치, 아니면 불일치
						
			String page ="";
			if (result) {
				GuestBookDTO dto = new GuestBookDTO();
				// 수정 페이지에 적용될 자료 얻어옴
				dto = dao.gbDetail(idx);
				
				request.setAttribute("dto", dto);
				page = "/guestbook/edit.jsp";
				
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {
				page=request.getContextPath()+"/guestbook_servlet/list.do";
				response.sendRedirect(page);
			}
		} else if (url.contains("update.do")) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String name 	= request.getParameter("name");
			String email 	= request.getParameter("email");
			String passwd 	= request.getParameter("passwd");
			String content 	= request.getParameter("content");
			
			GuestBookDTO dto = new GuestBookDTO(idx,name, email, passwd, content);
			dao.gbUpdate(dto);
			
			String page = "/guestbook_servlet/list.do";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			 
		} else if (url.contains("delete.do")) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			System.out.println("idx: "+idx);
			
			dao.gbDelete(idx);
			
			String page = "/guestbook_servlet/list.do";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if (url.contains("search.do")) {
			// 검색 옵션
			String searchkey = request.getParameter("searchkey");
			// 검색 키워드
			String search = request.getParameter("search");
			System.out.println("검색옵션: "+searchkey+", 검색 키워드: "+search);
			
			List<GuestBookDTO> items = dao.searchList(searchkey, search);
			
			request.setAttribute("list", items);
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			
			// view페이지 이동
			String page = "/guestbook/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		String page = "/guestbook/list.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
