package site.zaraportfolio.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import site.zaraportfolio.domain.Book;
import site.zaraportfolio.domain.Education;
import site.zaraportfolio.domain.Experience;
import site.zaraportfolio.domain.KeyWord;
import site.zaraportfolio.domain.Member;
import site.zaraportfolio.domain.MemberLikes;
import site.zaraportfolio.domain.MyInfo;
import site.zaraportfolio.domain.Visitor;

@Repository
public class MainRepository {

	@PersistenceContext
    EntityManager em;
	
	// 패스워드, 좋아요수
	public Member getMember() {
		Member member = em.createQuery("select m from Member m",Member.class).getResultList().get(0);
		return member;
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
	public void removeBook(Book book) {
		em.remove(book);
	}
	
	// 책 조회
	public List<Book> findAllBooks() {
		return em.createQuery("select b from Book b",Book.class).getResultList();
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
			em.persist(edu);
		}else {
			em.merge(edu);
		}
	}
	
	// 교육과정 삭제
	public void removeEducation(Education edu) {
		em.remove(edu);
	}
	
	// 교육과정 수정
	public void updateEducation(Education edu) {
		Education t_edu = em.find(Education.class, edu.getId());
		t_edu.changeDate(edu);
	}
	
	// 교육과정 조회
	public List<Education> findAllEducation(){
		return em.createQuery("select e from Education e",Education.class).getResultList();
	}
	
	// 코딩 경험 저장
	public void saveExperience(Experience exp) {
		if(exp.getId() != null) {
			em.persist(exp);
		}else {
			em.merge(exp);
		}
	}
	
	// 코딩 경험 삭제
	public void removeExperience(Experience exp) {
		em.remove(exp);
	}
	
	// 코딩 경험 수정
	public void updateExperience(Experience exp) {
		Experience t_exp = em.find(Experience.class, exp.getId());
		t_exp.changeDate(exp);
	}
	
	// 코딩 경험 조회
	public List<Experience> findAllExperience(){
		return em.createQuery("select e from Experience e",Experience.class).getResultList();
	}
	
}
