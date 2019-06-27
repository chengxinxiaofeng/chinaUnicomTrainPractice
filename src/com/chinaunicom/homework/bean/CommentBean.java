package com.chinaunicom.homework.bean;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 张永峰
 * 评论实体
 * @author Administrator
 *
 */
public class CommentBean {

	
	String username;
	String title;
	String content;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	Date createTime;
	public CommentBean(String username,String title, String content,Date createTime){
		this.username = username;
		this.title =  title;
		this.content =  content;
		this.createTime = createTime;
	}
	public CommentBean(){
		
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
