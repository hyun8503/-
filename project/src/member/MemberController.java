package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws 
	ServletException, IOException {
		//String url=request.getRequestURL().toString();
		String uri=request.getRequestURI();
		System.out.println(uri);
		//컨텍스트 패스(웹프로젝트의 식별자)
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
		if(uri.indexOf("list.do") != -1) {//member_servlet/list.do
			System.out.println("list.do호출...");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			//HashMap 생성
			Map<String,Object> map=new HashMap<>();
			List<MemberDTO> list=dao.memberList();
			map.put("list", list);
			//ArrayList에 담겨진 레코드의 갯수로 저장
			map.put("count", list.size());
			
			//최종적으로 map담긴 값을 setAttribute에 저장
			request.setAttribute("map", map);
			//출력을 위해 포워딩할 uri를 지정
			//String page="/project/member_list.jsp";
			String page="/member/member_list2.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}else if(uri.indexOf("join.do") != -1) {//회원등록
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String passwd=request.getParameter("passwd");
			String course=request.getParameter("course");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setCourse(course);
			dao.insert(dto);//추가
			response.sendRedirect(context+"/school/index.jsp");
		}else if(uri.indexOf("join1.do") != -1) {//회원등록
			String course=request.getParameter("course");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setCourse(course);
			dao.update(dto);//추가
			response.sendRedirect(context+"/school/index_student.jsp");
	   }else if(uri.indexOf("view.do") != -1) {
			String email=request.getParameter("email");
			System.out.println("클릭한 아이디 : "+email);
			MemberDTO dto=dao.memberDetail(email);
			request.setAttribute("dto", dto);
			String page="/member/member_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String course=request.getParameter("course");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setCourse(course);
			dao.update(dto);
			//페이지 이동
			response.sendRedirect(context+"/member/member.jsp");
		}else if(uri.indexOf("delete.do") != -1) {
			String email=request.getParameter("email");
			//레코드 삭제 처리
			dao.delete(email);
			//페이지 이동
			response.sendRedirect(context+"/member/member.jsp");
		}else if(uri.indexOf("login.do") != -1) {
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+email);
			System.out.println("패스워드:"+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setEmail(email);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/member/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);					
		}else if(uri.indexOf("join_bcrypt.do") != -1) {
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setName(name);
			dao.insertBcrypt(dto);
		}else if(uri.indexOf("login_bcrypt.do") != -1) {
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+email);
			System.out.println("패스워드:"+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setEmail(email);
			dto.setPasswd(passwd);
			String result=dao.loginCheckBcrypt(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/member/login_result.jsp";
			RequestDispatcher rd
				=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
