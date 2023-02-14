package projectS.url;


import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@WebListener
public class LoginImpl implements HttpSessionListener{
	
	String user_id;
	String user_pw;
	
	public static int total_user =0;

//	@Override
//	public void sessionCreated(HttpSessionEvent se) {
//		//세션에 저장시 수행: 접속자 수 증가
//		System.out.println("사용자 접속");
//		++total_user;		
//	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		//세션이 소면 수행: 접속자 수 감소
		System.out.println("사용자 접속 해지");
		total_user--;
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		//세션에 저장시 수행: 접속자 수 증가
		System.out.println("사용자 접속하여 증가");
		++total_user;		
	}
	
}
 