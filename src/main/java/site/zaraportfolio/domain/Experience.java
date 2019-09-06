package site.zaraportfolio.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Experience extends BaseEntity{

	@Id @GeneratedValue
	@Column(name = "EXPERIENCE_ID")
	private Long id;
	
	private String title;
	
	private String problem;
	
	private String solution;
	
	public void changeDate(Experience exp) {
		if(exp.getProblem() != null) this.problem = exp.getProblem();
		if(exp.getSolution() != null) this.solution = exp.getSolution();
		if(exp.getTitle() != null) this.title = exp.getTitle();
		this.setLastModifiedDate(new Date());
	}
	
}
