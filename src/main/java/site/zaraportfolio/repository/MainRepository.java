package site.zaraportfolio.repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import site.zaraportfolio.domain.Book;
import site.zaraportfolio.domain.Education;
import site.zaraportfolio.domain.Experience;
import site.zaraportfolio.domain.KeyWord;
import site.zaraportfolio.domain.Member;
import site.zaraportfolio.domain.MemberLikes;
import site.zaraportfolio.domain.MyInfo;
import site.zaraportfolio.domain.Project;
import site.zaraportfolio.domain.ProjectCategory;
import site.zaraportfolio.domain.Visitor;

@Repository
@Transactional
public class MainRepository {

	@PersistenceContext
    EntityManager em;
	
	// 패스워드, 좋아요수
	public Member getMember() {
		Member member = em.createQuery("select m from Member m",Member.class).getSingleResult();
		return member;
	}
	
	public boolean saveLike(String strSHA) {
		MemberLikes ml = em.find(MemberLikes.class, strSHA);
		Member member = getMember();
		if(ml == null) {
			em.persist(new MemberLikes(strSHA,member));
			return true;
		}else {
			member.minusLikes();
			em.remove(ml);
			return false;
		}
	}
	
	public boolean likeState(String strSHA) {
		MemberLikes ml = em.find(MemberLikes.class, strSHA);
		if(ml != null) {
			return true;
		}else {
			return false;
		}
	}
	
	// 방문자 수 카운트
	public void uploadLog(String date) {
		Visitor visitor = em.find(Visitor.class, date);
		
		if(visitor == null) {
			Visitor v = new Visitor();
			v.setDate(date);
			v.setCount(1);
			em.persist(v);
			System.out.println("현재 추천수 : "+v.getCount());
		}else {
			visitor.plusCount();
			System.out.println("현재 추천수 : "+visitor.getCount());
		}
	}
	
	// 추천
	public void changeLikes(MemberLikes ml) {
		Member member = getMember();
		
		if(!member.getLikesList().contains(ml)) {
			member.getLikesList().add(ml);
			ml.setMember(member);
			member.plusLikes();
			em.persist(ml);
		}else {
			member.getLikesList().remove(ml);
			member.minusLikes();
			em.remove(ml);
		}	
	}
	
	// 책 저장
	public void saveBook(Book book) {
		if(book.getId() == null) {
			em.persist(book);
		}else {
			em.merge(book);
		}
	}
	
	// 책 삭제
	public void removeBook(Long id) {
		em.remove(em.find(Book.class, id));
	}
	
	// 책 목록 조회
	public List<Book> findAllBooks() {
		return em.createQuery("select b from Book b order by b.id desc",Book.class).getResultList();
	}
	
	// 책 조회
	public Book findOneBook(Long id) {
		return em.find(Book.class, id);
	}
	
	// 내 소개 업로드
	public void saveMyInfo(MyInfo myInfo) {
		if(myInfo.getId() == null) {
			em.persist(myInfo);
		}else {
			em.merge(myInfo);
		}
	}
	
	// 내 소개 삭제
	public void removeMyInfo(MyInfo myInfo) {
		em.remove(myInfo);
	}
	
	// 내 소개 수정
	public void updateMyInfo(MyInfo myInfo) {
		MyInfo t_Info = em.find(MyInfo.class, myInfo.getId());
		t_Info.changeData(myInfo);
	}
	
	// 내 소개 조회
	public MyInfo findMyInfoByKeyWord(KeyWord keyword) {
		List<MyInfo> info = em.createQuery("select m from MyInfo m where m.keyword = :keyword",MyInfo.class)
				.setParameter("keyword", keyword)
				.getResultList();
		if(info.size() == 0) {
			return null;
		}else {
			return info.get(0);
		}
	}
	
	// 내 소개 전체 조회
	public List<MyInfo> findAllMyInfo(){
		return em.createQuery("select m from MyInfo m",MyInfo.class).getResultList();
	}
	
	// 교육과정 추가
	public void saveEducation(Education edu) {
		if(edu.getId() == null) {
			edu.setCreatedDate(new Date());
			em.persist(edu);
		}else {
			em.merge(edu);
		}
	}
	
	// 교육과정 삭제
	public void removeEducation(Long id) {
		em.remove(em.find(Education.class, id));
	}
	
	// 교육과정 수정
	public void updateEducation(Education edu) {
		Education t_edu = em.find(Education.class, edu.getId());
		t_edu.changeDate(edu);
		t_edu.setLastModifiedDate(new Date());
	}
	
	// 교육과정 리스트 조회
	public List<Education> findAllEducation(){
		return em.createQuery("select e from Education e order by e.id asc",Education.class).getResultList();
	}
	
	// 교육과정 조회
	public Education findOneEducation(Long id) {
		return em.find(Education.class, id);
	}
	
	// 코딩 경험 저장
	public void saveExperience(Experience exp) {
		if(exp.getId() != null) {
			exp.setCreatedDate(new Date());
			em.persist(exp);
		}else {
			em.merge(exp);
		}
	}
	
	// 코딩 경험 삭제
	public void removeExperience(Long id) {
		em.remove(em.find(Experience.class, id));
	}
	
	// 코딩 경험 수정
	public void updateExperience(Experience exp) {
		Experience t_exp = em.find(Experience.class, exp.getId());
		t_exp.changeDate(exp);
		t_exp.setLastModifiedDate(new Date());
	}
	
	// 코딩 경험리스트 조회
	public List<Experience> findAllExperience(){
		return em.createQuery("select e from Experience e",Experience.class).getResultList();
	}
	
	// 코딩 경험 조회
	public Experience findOneExperience(Long id){
		return em.find(Experience.class,id);
	}
	
	// 프로젝트 저장
	public void saveProject(Project project) {
		project.setCreatedDate(new Date());
		project.setLastModifiedDate(new Date());
		em.persist(project);
	}
	
	// 프로젝트 삭제
	public void removeProject(Long id) {
		em.remove(em.find(Project.class, id));
	}
	
	// 프로젝트 수정
	public void updateProject(Project project) {
		Project p = em.merge(project);
		p.setLastModifiedDate(new Date());
	}
	
	// 프로젝트 전체 조회
	public List<Project> findAllProjects() {
		return em.createQuery("select p from Project p order by p.id desc").getResultList();
	}
	
	// 프로젝트 카테고리별 조회
	public List<Project> findProjectByCategory(ProjectCategory category){
		return em.createQuery("select p from Project p where p.category=:category").setParameter("category", category).getResultList();
	}
	
	// 프로젝트 상세보기
	public Project findOneProject(Long id) {
		Project p = em.find(Project.class, id);
		p.getProjectInfo().getId();
		p.plusHits();
		return p;
	}
	
	public Map<String,Object> findSiteLog(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", (Object)em.createQuery("select sum(v.count) from Visitor v").getSingleResult());
		try {			
			map.put("today", (Object)em.createQuery("select v.count from Visitor v where v.date = :date")
					.setParameter("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date())).getSingleResult());
		}catch(NoResultException e) {
			map.put("today", 0);			
		}
		return map;
	}
	
}
