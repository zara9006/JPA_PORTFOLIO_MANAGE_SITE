package site.zaraportfolio.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.Setter;
import site.zaraportfolio.domain.Book;
import site.zaraportfolio.domain.Education;
import site.zaraportfolio.domain.Experience;
import site.zaraportfolio.domain.Project;
import site.zaraportfolio.domain.ProjectInfo;
import site.zaraportfolio.dto.LikeDTO;
import site.zaraportfolio.service.MainService;
import site.zaraportfolio.util.Encrypt;
import site.zaraportfolio.util.FileRenamePolicy;

@Controller
public class HomeController {
	
	
	@Autowired
	private ServletContext servletContext;
	
	@Setter(onMethod_=@Autowired)
	private MainService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest requeset) throws Exception{
		model.addAttribute("pList",service.mainPageProjectList());
		model.addAttribute("eList",service.getExperiencesList());
		model.addAttribute("edList",service.getEducationList());
		model.addAttribute("bList",service.getBookList());
		model.addAttribute("log",service.getSiteLog());
		model.addAttribute("like",service.getThumbsState(Encrypt.encryptSHA25(requeset.getRemoteAddr())));
		return "index";
	}
	
	@GetMapping(value="/pdf")
	public void getPDF(HttpServletResponse res) throws Exception{
		try {
			InputStream is= new FileInputStream(new File("C:\\eclipse\\portfolio.pdf"));
			IOUtils.copy(is, res.getOutputStream());
			res.flushBuffer();
		}catch(IOException ex) {
			System.out.println(ex);
		}
	}
	
	@PostMapping(value="/login")
	public String login(String password,HttpServletResponse res,HttpSession session) throws IOException{
		if(service.loginCheck(password)) {
			session.setAttribute("loginInfo", "site_admin_logined");
		}else {
			System.out.println("로그인 실패 !!!!!!!!!!!!!!!");
			PrintWriter out = res.getWriter();
			res.setContentType("text/html;charset=UTF-8");
			out.println("<script>alert('패스워드가 틀렸습니다.'); history.back();</script>");
			out.flush();
			out.close();
		}
		return "redirect:/";
	}
	
	@GetMapping(value="/thumbsup")
	@ResponseBody
	public LikeDTO thumbsUp(HttpServletRequest request) {
		try {
			return service.getThumbs(Encrypt.encryptSHA25(request.getRemoteAddr()));
		} catch (Exception e) {
			return null;
		}
	}
	
	@GetMapping(value = "/project")
	public void project(Model model) {
		model.addAttribute("pList",service.mainPageProjectList());
	}
	
	@GetMapping(value="/project/{id}")
	public String projectView(@PathVariable("id") Long id,Model model) {
		model.addAttribute("project",service.getProject(id));
		return "projectview";
	}
	
	@GetMapping(value = "/experience")
	public void experience(Model model) {
		model.addAttribute("eList",service.getExperiencesList());
	}
	
	@GetMapping(value = "/education")
	public void education(Model model) {
		model.addAttribute("edList",service.getEducationList());
	}
	
	@GetMapping(value="/aboutme")
	public void aboutme(Model model) {
		model.addAttribute("bList",service.getBookList());
	}
	
	@GetMapping(value = "/projectwrite")
	public String projectWritePage(Long id,Model model) {
		if(id == null) model.addAttribute("project",new Project());			
		else model.addAttribute("project",service.getProject(id));				
		return "projectwrite";
	}
	
	@GetMapping(value="/experiencewrite")
	public String experienceWritePage(Long id,Model model) {
		if(id == null) model.addAttribute("experience",new Experience());
		else model.addAttribute("experience",service.getExperience(id));
		return "experiencewrite";
	}
	
	@GetMapping(value="/educationwrite")
	public String educationWritePage(Long id,Model model) {
		if(id == null) model.addAttribute("education",new Education());
		else model.addAttribute("education",service.getEducation(id));
		return "educationwrite";
	}
	
	@GetMapping(value="/project/delete/{id}")
	public String deleteProject(@PathVariable("id") Long id) {
		service.deleteProject(id);
		return "redirect:/project";
	}
	
	
	@PostMapping(value = "/uploadimage")
	public void uploadImage(MultipartFile mulImage, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().println("http://"+InetAddress.getLocalHost().getHostAddress()
				+ servletContext.getInitParameter("uploadPath") + saveFile(mulImage));
	}
	
	@PostMapping(value="/uploadProject")
	public String uploadProject(Project project,ProjectInfo info, MultipartFile mulImage) throws IOException{
		project.setImage(saveFile(mulImage));
		project.setProjectInfo(info);
		service.saveProject(project);
		return "redirect:/";
	}
	
	@PostMapping(value="/updateProject")
	public String updateProject(Project project, ProjectInfo info,MultipartFile mulImage) throws IOException {
		if(mulImage != null) project.setImage(saveFile(mulImage));
		project.setProjectInfo(info);
		service.updateProject(project);
		return "redirect:/";
	}
	
	@PostMapping(value="/uploadExperience")
	public String uploadExperience(Experience experience) {
		service.saveExperience(experience);
		return "redirect:/";
	}
	
	@GetMapping(value = "/experience/delete/{id}")
	private String deleteExperience(@PathVariable("id") Long id) {
		service.deleteExperience(id);
		return "redirect:/experience";
	}
	
	@PostMapping(value = "/updateExperience")
	private String updateExperience(Experience experience) {
		service.updateExperience(experience);
		return "redirect:/experience";
	}
	
	@PostMapping(value = "/uploadEducation")
	private String uploadEducation(Education education) {
		service.saveEducation(education);
		return "redirect:/education";
	}
	
	@PostMapping(value = "/updateEducation")
	private String updateEducation(Education education) {
		service.updateEducation(education);
		return "redirect:/education";
	}
	
	@GetMapping(value="/education/delete/{id}")
	private String deleteEducation(@PathVariable("id")Long id) {
		service.deleteEducation(id);
		return "redirect:/education";
	}
	
	@PostMapping(value="/uploadBook")
	@ResponseBody
	public Book uploadBook(Book book) {
		Book uploadedBook = service.saveBook(book);
		return uploadedBook;
	}
	
	@GetMapping(value="/book/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		service.deleteBook(id);
		return "redirect:/aboutme";
	}
	
	@GetMapping(value="/project/search")
	public String getProjectCategoryList(String category,Model model){
		if(category.equals("ALL")) {
			model.addAttribute("pList",service.mainPageProjectList());
		}else {
			model.addAttribute("pList",service.getProjectCategoryList(category));
		}
		return "/make/project";
	}
	
	@GetMapping(value="/naver/search")
	@ResponseBody
	public List<Map<String,String>> searchBook(String query) {
		String clientId = "55quE_7hbBJN9x0uGCBW";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "Zu3Elf0gfe";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(query, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JsonObject object = (JsonObject) new JsonParser().parse(response.toString());
            JsonArray array = object.getAsJsonArray("items");
            // title 
            // image
            ArrayList result = new ArrayList();
            for(int i = 0; i<array.size();i++) {
            	JsonObject o = (JsonObject)array.get(i);
            	Map<String,String> map = new HashMap<String,String>();
            	map.put("title", o.get("title").getAsString());
            	map.put("image", o.get("image").getAsString());
            	result.add(map);
            }
            
            return result;
        } catch (Exception e) {
        	return null;
        }
	}

	private String saveFile(MultipartFile mulFile) throws IOException{
		String path = servletContext.getInitParameter("uploadPath");
		String savePath = servletContext.getRealPath(path);
		File file = FileRenamePolicy.rename(new File(savePath+mulFile.getOriginalFilename()));
		mulFile.transferTo(file);
		return file.getName();
	}
	
}
