package projectS.service;

import java.util.List;

import projectS.dao.MemberDAO;
import projectS.dto.MemberDTO;

public class MemberService {
	MemberDAO memberDAO;
	
	public MemberService() {
		memberDAO = new MemberDAO();
	}
	
	public List<MemberDTO> listMember(){
		List<MemberDTO> list = memberDAO.listMember();
		return list;
	}
		
/*		
	public int login(MemberDTO dto) {
		int result = -1; // 아이디 없음
		result = memberDAO.login(dto);

		return result;
	} 
*/
}
