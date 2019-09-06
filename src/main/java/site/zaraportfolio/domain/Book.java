package site.zaraportfolio.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "BOOKS")
@Getter @Setter
public class Book {
	
	@Id @GeneratedValue
	@Column(name = "BOOK_ID")
	private Long id;
	
	private String image;
	
	private String title;
	
	private String topic;
	
}
