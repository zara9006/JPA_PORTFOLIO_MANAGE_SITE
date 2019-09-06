package site.zaraportfolio.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import site.zaraportfolio.domain.Project;
import site.zaraportfolio.service.MainService;
import site.zaraportfolio.util.FileRenamePolicy;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ServletContext servletContext;
	
	@Setter(onMethod_=@Autowired)
	private MainService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "index";
	}
	
	@GetMapping(value = "/project")
	public void project() {}
	
}
