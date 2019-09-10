package site.zaraportfolio.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.zaraportfolio.domain.Book;
import site.zaraportfolio.domain.Education;
import site.zaraportfolio.domain.Experience;
import site.zaraportfolio.domain.Member;
import site.zaraportfolio.domain.Project;
import site.zaraportfolio.domain.ProjectCategory;
import site.zaraportfolio.dto.LikeDTO;
import site.zaraportfolio.repository.MainRepository;

@Service
public class MainService {

	@Autowired
	MainRepository repository;
	
	public void saveProject(Project project) {
		repository.saveProject(project);
	}
	
	public List<Project> mainPageProjectList() {
		return repository.findAllProjects();
	}
	
	public void deleteProject(Long id) {
		repository.removeProject(id);
	}
	
	public Project getProject(Long id) {
		return repository.findOneProject(id);
	}
	
	public void updateProject(Project project) {
		repository.updateProject(project);
	}
	
	public void saveExperience(Experience exp) {
		repository.saveExperience(exp);
	}
	
	public List<Experience> getExperiencesList(){
		return repository.findAllExperience();
	}
	
	public void deleteExperience(Long id) {
		repository.removeExperience(id);
	}
	
	public void updateExperience(Experience exp) {
		repository.updateExperience(exp);
	}
	
	public Experience getExperience(Long id) {
		return repository.findOneExperience(id);
	}
	
	public Education getEducation(Long id) {
		return repository.findOneEducation(id);
	}
	
	public List<Education> getEducationList(){
		return repository.findAllEducation();
	}
	
	public void saveEducation(Education education) {
		repository.saveEducation(education);
	}
	
	public void updateEducation(Education education) {
		repository.updateEducation(education);
	}
	
	public void deleteEducation(Long id) {
		repository.removeEducation(id);
	}
	
	public void saveVisitorLog() {
		repository.uploadLog(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	}
	
	public Map<String,Object> getSiteLog(){
		return repository.findSiteLog();
	}
	
	public Book saveBook(Book book) {
		repository.saveBook(book);
		return repository.findOneBook(book.getId());
	}
	
	public Book getBook(Long id) {
		return repository.findOneBook(id);
	}
	
	public List<Book> getBookList(){
		return repository.findAllBooks();
	}
	
	public void deleteBook(Long id) {
		repository.removeBook(id);
	}
	
	public List<Project> getProjectCategoryList(String category) {
		return repository.findProjectByCategory(ProjectCategory.valueOf(category));
	}
	
	public LikeDTO getThumbs(String shaStr) {
		return new LikeDTO(repository.saveLike(shaStr),repository.getMember().getLikes());
	}
	
	public LikeDTO getThumbsState(String shaStr) {
		return new LikeDTO(repository.likeState(shaStr),repository.getMember().getLikes());
	}
	
	public boolean loginCheck(String password) {
		Member member = repository.getMember();
		if(member.getPassword().equals(password)) {
			return true;
		}else {
			return false;
		}
	}
	
}
