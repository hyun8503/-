package manager;

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


@WebServlet("/manager_servlet/*")
public class ManangerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws 
	ServletException, IOException {
		//String url=request.getRequestURL().toString();
		String uri=request.getRequestURI();
		System.out.println(uri);
		//컨텍스트 패스(웹프로젝트의 식별자)
		String context=request.getContextPath();
		ManagerDAO dao=new ManagerDAO();
		if(uri.indexOf("list.do") != -1) {//member_servlet/list.do
			System.out.println("list.do호출...");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			//HashMap 생성
			Map<String,Object> map=new HashMap<>();
			List<ManagerDTO> list=dao.managerList();
			map.put("list", list);
			//ArrayList에 담겨진 레코드의 갯수로 저장
			map.put("count", list.size());
			
			//최종적으로 map담긴 값을 setAttribute에 저장
			request.setAttribute("map", map);
			//출력을 위해 포워딩할 uri를 지정
			//String page="/project/member_list.jsp";
			String page="/manager/manager_list2.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}else if(uri.indexOf("login.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			ManagerDTO dto=new ManagerDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/manager/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("join_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			ManagerDTO dto=new ManagerDTO();//MemberDTO 생성
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dao.insertBcrypt(dto);
		}else if(uri.indexOf("login_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			ManagerDTO dto=new ManagerDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckBcrypt(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/manager/login_result.jsp";
			RequestDispatcher rd
				=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
