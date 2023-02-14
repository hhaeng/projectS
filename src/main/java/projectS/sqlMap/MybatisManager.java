package projectS.sqlMap;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	
	// 생성자
	private MybatisManager() {}
	
	private static SqlSessionFactory instance;
	public static SqlSessionFactory getInstance() {
		Reader reader = null;
		if (reader == null) {
			String resource = "sqlMap/SqlMapConfig.xml";
			try {
				reader = Resources.getResourceAsReader(resource);
				
				// SqlSessionFactory 객체 생성
				instance = new SqlSessionFactoryBuilder().build(reader);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					// 자원 해제
					if (reader!=null) reader.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return instance;
	}
}
