package test.com.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UpdateOKAction {
	
	private String member_id;
	
	public UpdateOKAction() {
		// TODO Auto-generated constructor stub
	}
	
	public UpdateOKAction(String member_id) {
		this.member_id = member_id;
	}
	
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String nick = "";
		String age = "";
		String golfAvgCheck = "";
		String loc = "";
		
		String dir_path = 
				request.getServletContext()
				.getRealPath("/upload");
		System.out.println(dir_path);

		
		int fileSizeMax = 1024 * 1024 * 100;

		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);

		if(isMultipartContent) {
			DiskFileItemFactory factory = 
					new DiskFileItemFactory();
			factory.setSizeThreshold(fileSizeMax);
			
			ServletFileUpload sfu = 
					new ServletFileUpload(factory);
			sfu.setFileSizeMax(fileSizeMax);//파일 사이즈 제한

			
			
			try {
				List<FileItem> items = 
						sfu.parseRequest(request);
				for (FileItem item : items) {
					if (item.isFormField()) { //id,pw,name,tel 받기
						if(item.getFieldName().equals("nick")) {
							nick = item.getString("UTF-8");
						}
						if(item.getFieldName().equals("age")) {
							age = item.getString("UTF-8");
						}
						if(item.getFieldName().equals("golfAvgCheck")) {
							golfAvgCheck = item.getString("UTF-8");
						}
						if(item.getFieldName().equals("loc")) {
							loc = item.getString("UTF-8");
						}
					}
				}//end for << items
			} catch (FileUploadException e) {
				e.printStackTrace();
			}


		}//end if << isMultilpart
		System.out.println("nick:"+nick);
		System.out.println("age:"+age);
		System.out.println("golfAvgCheck:"+golfAvgCheck);
		System.out.println("loc:"+loc);
		
		
		MemberVO vo = new MemberVO();
		vo.setMember_id(Long.parseLong(member_id));
		vo.setNickname(nick);
		vo.setAge(age);
		vo.setHandy(golfAvgCheck);
		vo.setLocation(loc);
		
		MemberDAO dao = new MemberDAOimpl();
		int result = dao.update(vo);
		System.out.println("result:" + result);
		
		if(result==1)
			response.sendRedirect("my_page.do");
		else
			response.sendRedirect("m_update.do");
	}
}
