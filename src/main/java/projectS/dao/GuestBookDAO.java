package projectS.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import projectS.dto.GuestBookDTO;
import projectS.sqlMap.MybatisManager;

public class GuestBookDAO {
	
	
	// 조건 검색
	public List<GuestBookDTO> searchList(String searchkey, String search){
		System.out.println("dao searchList() 처리중:  search:"+("%"+search+"%"));
		System.out.println("검색 옵션 : "+searchkey);
		SqlSession session = MybatisManager.getInstance().openSession();
		
		search = "%"+search+"%";	// "%홍길동%"
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchkey", searchkey);
		map.put("search", search);
		
		List<GuestBookDTO> searchlist;
		if (searchkey.equals("name_content")) {
			searchlist = session.selectList("guestbook.searchNameContent",search);
		} else {
			searchlist = session.selectList("guestbook.searchList",map);
		}
		session.close();
		
		return searchlist;
	}
	// 전체 조회
	public List<GuestBookDTO> getList(){
		System.out.println("dao list() 처리중");
		// SqlSessionFactory객체를 이용하여 SqlSession객체를 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		List<GuestBookDTO> list = session.selectList("guestbook.gbList");
		session.close();
		System.out.println("dao list() 처리 완료");
		return list;
	}
	
	public void gbInsert(GuestBookDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("guestbook.gbInsert",dto);
		session.commit();// insert, update, delete처리시 반드시 commit() 적용
		session.close();
	}
	
	public boolean passwCheck(HashMap<String, Object> map) {
		boolean result;
		SqlSession session = MybatisManager.getInstance().openSession();
		Object rs = session.selectOne("guestbook.passwdCheck", map);
		System.out.println("rs:"+rs);
		
		if (rs == null) {
			result = false;
		} else {
			result = true;
		}
		
		return result;
	}
	
	public GuestBookDTO gbDetail(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		GuestBookDTO dto = new GuestBookDTO();
		dto = session.selectOne("guestbook.gbDetail",idx);
		session.close();
		
		return dto;
	}
	public void gbUpdate(GuestBookDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		System.out.println(dto.toString());
		session.update("guestbook.update", dto);
		session.commit();
		session.close();
	}
	public void gbDelete(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("guestbook.delete", idx);
		session.commit();
		session.close();
	}
}
