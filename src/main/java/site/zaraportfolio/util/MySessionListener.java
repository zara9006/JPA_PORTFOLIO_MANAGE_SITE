package site.zaraportfolio.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.jboss.jandex.Main;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import site.zaraportfolio.service.MainService;

//import com.payment.service.StatisticsService;

public class MySessionListener implements HttpSessionListener {
	
	private static MainService service;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:");
	
	public MySessionListener() {
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
		if(service == null) {
			service = (MainService) context.getBean("mainService");
		}
		service.saveVisitorLog();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
