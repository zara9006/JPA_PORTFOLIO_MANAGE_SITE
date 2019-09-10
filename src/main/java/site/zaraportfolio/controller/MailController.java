package site.zaraportfolio.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	@PostMapping(value = "/mail/send")
	public void mailSending(HttpServletResponse res, String email, String content, String title) {

		String toEmail = "zara9006@naver.com";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(email); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(toEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);

			PrintWriter out = res.getWriter();
			res.setContentType("text/html;charset=UTF-8");
			out.println("<script>alert('메일을 발송했습니다.'); location.href='/'</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}