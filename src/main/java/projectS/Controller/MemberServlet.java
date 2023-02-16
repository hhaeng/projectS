package projectS.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import projectS.dao.MemberDAO;
import projectS.dto.MemberDTO;
import projectS.service.MemberService;
import projectS.url.LoginImpl;
 

@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao = new MemberDAO();

	// 1. 조회 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandler(request, response);
	}
	protected void doHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("요청 성공");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ServletContext ctx = getServletContext();

		String command = request.getParameter("command");
		System.out.println("~~~~~작업: "+command+"~~~~~");
		
		if(command != null && command.equals("addMember")){  
			//입력작업
			String id = request.getParameter("id");
			String pwd= request.getParameter("password"); //"pwd"
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPwd(pwd);
			dto.setName(name);
			dto.setEmail(email);
			
			System.out.println(dto);
			
			// dao에 전달하여 DB에 저장하는 기능 수행
			int result = dao.addMember(dto);
			if(result != -1) {
				System.out.println("회원가입 성공! -code:"+result);
				
				//
				//request.setAttribute("member",dto);
				RequestDispatcher dispatch = request.getRequestDispatcher("/member/member1.jsp");
				dispatch.forward(request, response);
				

			}else {
				System.out.println("회원가입 실패! -code:"+result);
			}
			
		}else if(command != null && command.equals("delMember")) {
			//삭제작업
			String id = request.getParameter("id");
			dao.delMember(id);
			
			response.sendRedirect("/projectS/member/deleteMember.jsp");

			
		}else if(command != null && command.equals("modifyMember")) {
			//수정작업form
			String id = request.getParameter("id");
			
			//회원 정보 읽기
			MemberDTO dto = dao.getMember(id);
			
			//수정화면에 전송
			request.setAttribute("member",dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("/member/modifyForm.jsp");
			dispatch.forward(request, response);
			//수정된 화면에서 넘어온 데이터를 db반영

		}else if (command !=null&& command.equals("updateMember")) {
			System.out.println("db 수정작업");
			String id = request.getParameter("id");
			String pwd = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPwd(pwd);
			dto.setName(name);
			dto.setEmail(email);
			
			dao.updateMember(dto);
			System.out.println(dto);

			request.setAttribute("member",dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("/member/member1.jsp");
			dispatch.forward(request, response);
			
		} else if (command != null && command.equals("viewMember")) {	// 아이디클릭
			String id = request.getParameter("id");
			//System.out.println("view: "+id+"(ID)");
			
			//회원 정보 읽기
			MemberDTO dto = dao.getMember(id);
			System.out.println(dto);
			
			//수정화면에 전송
			request.setAttribute("member",dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("/member/viewForm.jsp");
			dispatch.forward(request, response);
		
//로그인////////////////////////////////////////////////////////////
		}else if (command != null && command.equals("login.do")) {
			System.out.println("login 요청");
			
			// 클라이언트로 받은 id,pw
			String user_id = request.getParameter("user_id");//user_id
			String user_pwd = request.getParameter("user_pwd");//user_pw
			// db확인
			MemberDTO dto = dao.getID(user_id, user_pwd);
			System.out.println("아이디: "+dto.getId()+", 비번: "+dto.getPwd());
			
			if(user_id.equals(dto.getId())){	// 아이디 일치
				if(user_pwd.equals(dto.getPwd())) {	//비번 일치
					System.out.println("아이디 일치, 비번 일치");
				}else{	// 아이디 일치, 비번 불일치
					response.sendRedirect("/projectS/member/loginMess.jsp?mess=user_pwd");
					System.out.println("아이디 일치, 비번 불일치");
				}
			}else {	// 아이디가 없음
				response.sendRedirect("/projectS/member/loginMess.jsp?mess=user_id");
				System.out.println("아이디 없음");

			}
			
//중복체크--------------------------------------------			
		}else if (command != null && command.equals("idCheck")) {
			System.out.println("아이디 중복 확인");
			String id = request.getParameter("id");
			
			MemberDTO dto = dao.getMember(id);
			System.out.println(dto);
			
			response.getWriter().write(new MemberDAO().idCheck(id) + ""); 
	 
		
		} else if (command != null && command.equals("logout") ) {
			System.out.println("로그아웃 요청");
			
			HttpSession session = request.getSession();
			session.invalidate(); //세션은 유효시간을 무효화(제거)
			
			response.sendRedirect("/projectS/member/loginMess.jsp?mess=logout");
//-----------------------------------------------
			
		} else {
			
		List<MemberDTO> list = dao.listMember();
		String ctxPath = ctx.getContextPath(); //=>"/projectS"
		
		request.setAttribute("memberList", list);
		request.setAttribute("path", ctxPath);
		
		String nextPage = "/member/memList.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
		}
		
	}

}
