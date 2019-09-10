package site.zaraportfolio.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import site.zaraportfolio.domain.Book;
import site.zaraportfolio.domain.KeyWord;
import site.zaraportfolio.domain.Member;
import site.zaraportfolio.domain.MemberLikes;
import site.zaraportfolio.domain.MyInfo;
import site.zaraportfolio.domain.Project;
import site.zaraportfolio.domain.ProjectCategory;
import site.zaraportfolio.domain.ProjectInfo;
import site.zaraportfolio.repository.MainRepository;
import site.zaraportfolio.service.MainService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:root-context.xml")
@Transactional
public class ProjectTest {

	@Autowired
	MainService service;
	@Autowired
	MainRepository repository;
	@PersistenceContext
	EntityManager em;

	@Test
	@Ignore
	public void memberLikesTest() {
		// Given
		Member member = new Member();
		member.setLikes(0);
		member.setPassword("1234");
		em.persist(member);
		System.out.println("회원 아이디 : " + member.getId());

		// When
		MemberLikes ml = new MemberLikes();
		ml.setMd5IP("123123123123");
		repository.changeLikes(ml);
		repository.changeLikes(ml);
		repository.changeLikes(ml);

		// Then
		System.out.println("1 이어야 함 : " + member.getLikes());
	}

	@Test
	@Ignore
	public void bookSaveRemoveTest() {
		// Given
		Book book = new Book();
		book.setImage("java.png");
		book.setTitle("자바의 정석");
		book.setTopic("자바");
		Book book2 = new Book();
		book2.setImage("spring.png");
		book2.setTitle("코드로 배우는 스프링 웹 프로젝트");
		book2.setTopic("Spring");

		// When ( 책 Save )
		repository.saveBook(book);
		repository.saveBook(book2);

		// Then
		for (Book b : repository.findAllBooks()) {
			System.out.println(b.getId() + "번째 책 : " + b.getTitle());
		}
		
		// When2 ( 책 remove )
		repository.removeBook(book2.getId());
		
		// Then2
		for (Book b : repository.findAllBooks()) {
			System.out.println(b.getId() + "번째 책 : " + b.getTitle());
		}
	}
	
	@Test
	@Ignore
	public void myInfoTest() {
		// Given
		MyInfo mi = new MyInfo();
		mi.setContent("content!!!content!!!content!!!content!!!content!!!content!!!content!!!content!!!content!!!content!!!");
		mi.setKeyword(KeyWord.Challenge);
		mi.setTitle("title");
		repository.saveMyInfo(mi);
		
		// When ( 소개 수정 )
		MyInfo mi2 = new MyInfo();
		mi2.setTitle("Change Title");
		mi2.setId(mi.getId());
		repository.updateMyInfo(mi2);
		
		// Then
		System.out.println(repository.findMyInfoByKeyWord(KeyWord.valueOf("Challenge")).getTitle());
	
		// When2 ( 소개 삭제 )
		repository.removeMyInfo(mi);
		
		// Then
		System.out.println("삭제 성공 ? "+repository.findMyInfoByKeyWord(KeyWord.valueOf("Challenge")) == null);
	}
	
	@Test
	@Ignore
	public void visitorLogTest() {
		repository.uploadLog(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		repository.uploadLog(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		Date d = new Date();
		d.setDate(6);
		repository.uploadLog(new SimpleDateFormat("yyyy-MM-dd").format(d));
	}
	
	@Test
	@Ignore
	public void projectTest() {
		// Given
		Project p = new Project();
		p.setCategory(ProjectCategory.WEB);
		p.setGoal("하이버네이트 기초 공부");
		p.setHits(0);
		p.setImage("hibernate.png");
		p.setLikes(0);
		p.setSaved(0);
		p.setTitle("포트폴리오 관리 사이트");
		
		ProjectInfo pi = new ProjectInfo();
		pi.setContent("프로젝트 설명!");
		pi.setEnvironment("Spring+Hibernate");
		pi.setLibrary("lombok, hibernate, ...");
		pi.setPeriod("2019-09-06~");
		pi.setPosition("전부");
		p.setProjectInfo(pi);
		
		// When ( 프로젝트 등록 )
		service. saveProject(p);
		
		// Then ( 조회 )
		System.out.println(repository.findOneProject(p.getId()).getProjectInfo().getContent());
		System.out.println(repository.findProjectByCategory(ProjectCategory.WEB).get(0).getGoal());
		System.out.println(repository.findAllProjects().size());
	
		// When2 ( 삭제 )
		repository.removeProject(p.getId());
		
		// Then2 ( 확인 )
		System.out.println(repository.findAllProjects().size());
	}
	
	@Test
	public void siteLogTest() {
		System.out.println(service.loginCheck("zara9006!@"));
	}

}
