package memo;

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

import member.MemberDTO;


@WebServlet("/memo_servlet/*")
public class memoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uri=request.getRequestURI();
	String context=request.getContextPath();
	memoDAO dao = new memoDAO();
	if(uri.indexOf("list.do")!=-1) {
		Map<String,Object> map = new HashMap<>();
		List<memoDTO> list = dao.listMemo();
		map.put("list",list);
		map.put("count",list.size());
		request.setAttribute("map", map);
		String page="/school/memo_list.jsp";
		RequestDispatcher rd= request.getRequestDispatcher(page);
		rd.forward(request, response);
	}else if(uri.indexOf("insert.do") != -1) {
		String name=request.getParameter("name");
		String memo=request.getParameter("memo");
		memoDTO dto=new memoDTO();//MemberDTO 생성
		dto.setName(name);
		dto.setMemo(memo);
		dao.insert(dto);
	}else if(uri.indexOf("delete.do") != -1) {
		String name=request.getParameter("name");
		//레코드 삭제 처리
		dao.delete(name);
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
