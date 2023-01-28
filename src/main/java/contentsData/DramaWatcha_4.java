package contentsData;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DramaWatcha_4 {
	public static void main(String[] args) {

		// 파싱한 데이터를 저장할 변수 (첫번째 파싱)
		String firstParsing = "";

		try {

			for(int pageCount=1; pageCount<=5; pageCount++) {

				URL firstURL = new URL("https://api.themoviedb.org/3/discover/tv?api_key=4b5fa5612cda62f4af304556025d6fc5&language=ko&sort_by=popularity.desc&page="+pageCount+"&include_null_first_air_dates=false&with_watch_providers=97&watch_region=KR&with_watch_monetization_types=flatrate&with_type=2");
				BufferedReader bf1;
				bf1 = new BufferedReader(new InputStreamReader(firstURL.openStream(), "UTF-8"));
				firstParsing = bf1.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject firstAllData = (JSONObject)jsonParser.parse(firstParsing);
				System.out.println(firstAllData); // 첫번째 파싱 전체 데이터 출력

				JSONArray resultsList = (JSONArray) firstAllData.get("results"); // 첫번째 파싱 전체 데이터의 results 배열 추출
				System.out.println(resultsList.size()); // 첫번째 파싱 전체 데이터의 results 배열의 size 출력

				// 추출한 데이터를 저장할 배열 생성
				ArrayList <String> id = new ArrayList<>(); 
				ArrayList <String> title = new ArrayList<>(); 
				ArrayList <String> first_air_date = new ArrayList<>(); 
				ArrayList <String> vote_average = new ArrayList<>(); 
				ArrayList <String> poster_path = new ArrayList<>(); 
				ArrayList <String> overview = new ArrayList<>(); 

				// results 배열에서 원하는 데이터 각 list에 저장
				for(int i=0; i<resultsList.size(); i++) {

					JSONObject contents = (JSONObject) resultsList.get(i);

					id.add(contents.get("id").toString());
					title.add(contents.get("name").toString());
					first_air_date.add(contents.get("first_air_date").toString());
					vote_average.add(contents.get("vote_average").toString());
					poster_path.add("https://www.themoviedb.org/t/p/original" + contents.get("poster_path").toString());
					overview.add(contents.get("overview").toString());

				}
				System.out.println(id);

				/* 장르, 런타임 추출 */

				// 파싱한 데이터를 저장할 변수 (두번째 파싱)
				String secondParsing = "";
				
				Thread.sleep(3000); // 시간 느리게
				
				// 추출한 데이터를 저장할 배열 생성
				List <String> genre= new ArrayList<>(); 

				for(int j=0; j<resultsList.size(); j++) {

					URL secondURL = new URL("https://api.themoviedb.org/3/tv/"+id.get(j)+"?api_key=4b5fa5612cda62f4af304556025d6fc5&language=ko");
					BufferedReader bf2;
					bf2 = new BufferedReader(new InputStreamReader(secondURL.openStream(), "UTF-8"));
					secondParsing = bf2.readLine();

					JSONParser jsonParser2 = new JSONParser();
					JSONObject secondAllData = (JSONObject)jsonParser2.parse(secondParsing);

					JSONArray genresList = (JSONArray) secondAllData.get("genres"); // 두번째 파싱 전체 데이터의 genres 배열 추출
					JSONObject genres = (JSONObject) genresList.get(0); // genres 배열 중 제일 첫번째 값만 담기
					genre.add(genres.get("name").toString()); // 제일 첫번째 값의 name값만 담기

				}

				Class.forName("oracle.jdbc.driver.OracleDriver"); // 등록 공식

				//Step 2. DBMS 접속하기		
				String dbURL = "jdbc:oracle:thin:@3.39.199.102:1521:xe"; // 접속 공식
				String dbID = "pm";
				String dbPW = "pm";
				Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);

				String sql = "MERGE INTO drama USING DUAL ON (dr_id = ?) WHEN MATCHED THEN UPDATE SET dr_ottWC = 'Y' WHEN NOT MATCHED THEN INSERT (dr_id,dr_title,dr_genre,dr_first_air_date,dr_vote_average,dr_ottNF,dr_ottWV,dr_ottDZ,dr_ottWC,dr_like,dr_poster_path,dr_overview) VALUES (?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,'Y',DEFAULT,?,?)";

				for (int k=0 ; k<resultsList.size(); k++) {
					PreparedStatement pstat = con.prepareStatement(sql);
					pstat.setString(1, id.get(k));
					pstat.setString(2, id.get(k));
					pstat.setString(3, title.get(k));
					pstat.setString(4, genre.get(k));
					pstat.setString(5, first_air_date.get(k));
					pstat.setString(6, vote_average.get(k));
					pstat.setString(7, poster_path.get(k));
					pstat.setString(8, overview.get(k));

					int result = pstat.executeUpdate();

					if(result > 0 ) {
						System.out.println("입력 성공");
					}else {
						System.out.println("입력 실패");
					}

				}
				con.commit();
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
