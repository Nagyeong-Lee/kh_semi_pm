package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.boardfile")
public class BoardFileController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		System.out.println(uri);

		String filePath = request.getServletContext().getRealPath("files");
		System.out.println(filePath);


		try {


			// 게시글 이미지 입력
			if(uri.equals("/imageupload.boardfile")) {

				int maxSize = 1024*1024*10;
				String savePath = request.getServletContext().getRealPath("/files");
				File fileSavePath = new File(savePath);
				if(!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}

				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				String sysName = multi.getFilesystemName("image");
				response.setContentType("text/html;charset=utf8");
				response.getWriter().append("/files/"+sysName);

			}else if(uri.equals("/download.file")) {
				// 여기에 권한 check 같은 것도 넣을 수 있다 검사 검증 다운로드 거절 가능해서 서블릿만들어서 쓰는 게 장점이 있다
				// 서블릿을 거쳤을 때 그 페이지를 가는 것을 허락/ 기록 등 제어할 수 있다
				String sysName = request.getParameter("sysname");
				String oriName = request.getParameter("oriname");

				//			System.out.println(filePath + "/" + sysName);
				File target = new File(filePath + "/" + sysName);
				//			FileInputStream fis = new FileInputStream(target);
				//			DataInputStream dis = new DataInputStream(fis);
				//			//하드디스트->RAM
				//배열을 만들어 준다 파일크기 감당하려면
				byte[] fileContents = new byte[(int)target.length()];
				// 배열 만들려면 사이즈 알아와야 하는데 파일 사이즈를 모르니까 사이즈를 알아오는 것 target.length()
				// 파일 사이즈는 long 값인데 배열인 int 값을 받아와야 하니까 casting 데이터 날라가는 거 걱정해도 애초에 사이즈 제한을 10mb로 해놔서 데이터 손실 발생 안 한다.
				//			dis.readFully(fileContents);
				//			// 하드디스크의 모든 파일 내용을 ram으로 복사 bite배열로 넘어옴.
				//			// 여기까지 클라이언트가 선택한 내용을 램으로 가져왔다 
				//			// 이제 클라이언트한테 보내줘야 한다.

				oriName = new String(oriName.getBytes("utf8"), "ISO-8859-1");
				//			한글 파일 이름 안 깨지게

				// 클라이언트가 메시지를 보냈을 때 항상 서버는 응답을 해줬는데 클라이언트는 응답을 받았을 때 어떤 행동을 하나? 브라우저에 넣어서 렌더링 실행
				// 이 배열을 리스판스에 담아봤자 자바스크립트도 에이치티엠엘도 아니다 그냥 문자 나열 

				// 렌더링하라고 말한 거 사실은 있다. jsp에 contentType="text/html; charset=UTF-8"
				// 있어도 깨져 있는 0101010

				// 지금 내가 보내는 거 렌더링한 거 아니다라고 말해줘야 한다.

				//			response.reset(); 필수는 아님

				response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
				// 지금 내가 보내는 것은 파일이다. 이거 첨부파일이다. 파일의 내용이라고 판단해서 다운로드로 동작하게 된다. 파일이 다운로드 중입니다라고 뜰 때 뜨는 파일 이름이 여기에다 쓰는 것
				// oriname을 써야 하는데 디비? 클라이언트가 보내주는? 최대한 디비 접속을 피해보자 오리네임을 같이 넘겨받아

				//			request response 페이지 전환 에이태그도
				//			파일다운시 페이지 전환x
				try(ServletOutputStream sos = response.getOutputStream();
						//					리스판스로 데이터를 내보내는 스트림을 만든 다음에 이걸 변수로 담아두고
						FileInputStream fis = new FileInputStream(target);
						DataInputStream dis = new DataInputStream(fis);){

					dis.readFully(fileContents);
					sos.write(fileContents);
					//			파일 내보내기
					sos.flush();

				}		
			}
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("/error.jsp");

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

