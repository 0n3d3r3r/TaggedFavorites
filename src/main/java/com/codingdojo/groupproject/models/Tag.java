package com.codingdojo.groupproject.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name="tags")
public class Tag {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="This message should never show up.")
	private String name;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name="media_tags",
		joinColumns = @JoinColumn(name = "tag_id"),
    	inverseJoinColumns = @JoinColumn(name = "media_id")
	)
	private List<Media> medias;
	
	//@NotEmpty(message="This message should never show up.")
	private Long conflictId;
	
	public Tag() {}
	
	public Tag(String name, Long conflictId) {
		this.name = name;
		this.conflictId = conflictId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Media> getMedias() {
		return medias;
	}

	public void setMedias(List<Media> medias) {
		this.medias = medias;
	}

	public Long getConflictId() {
		return conflictId;
	}

	public void setConflictId(Long conflictId) {
		this.conflictId = conflictId;
	}
	
	
}
