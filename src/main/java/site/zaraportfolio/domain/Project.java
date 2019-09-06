package site.zaraportfolio.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Project {
	
	@Id @GeneratedValue
	@Column(name = "PROJECT_ID")
	private Long id;
	
	@Enumerated(EnumType.STRING)
	private ProjectCategory category;
	
	private String image;
	
	private String title;
	
	private String goal;
	
	private String likes;
	
	private String hits;
	
	private int saved;
	
	@OneToOne
	@JoinColumn(name = "project")
	private ProjectInfo projectInfo;
	
	
	public void setProjectInfo(ProjectInfo projectInfo) {
		this.projectInfo = projectInfo;
		projectInfo.setProject(this);
	}
	
}
