package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Attendance extends Connect
{
	/////Function for connect to the MySQL Server Database////////////
	public Attendance()
	{
		Connect.connect_mysql();
	}
	//////////Save the Attendance Details /////
	public String saveAttendance(HashMap attendanceData)
	{
		String SQL = "INSERT INTO attendance (attendance_student_id, attendance_date, attendance_in_time, attendance_out_time) VALUES (?, ?, ?, ?);";
		int record=0; 
		String error = "";

		try
		{
			pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,(String) attendanceData.get("attendance_student_id"));
			pstmt.setString(2,(String) attendanceData.get("attendance_date"));
			pstmt.setString(3,(String) attendanceData.get("attendance_in_time"));
			pstmt.setString(4,(String) attendanceData.get("attendance_out_time"));
	
			record = pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				int last_inserted_id = rs.getInt(1);
				error = Integer.toString(last_inserted_id);
			}
			
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Attendance Details//////////	
    public HashMap getAttendanceDetails(int attendance_id)
	{
		HashMap results = new HashMap();
		int count=0;
		try
		{
		String SQL =  "SELECT * FROM attendance WHERE attendance_id = "+attendance_id ;
		statement = connection.createStatement();
		rs = statement.executeQuery(SQL);
		while(rs.next())
		{
			results.put("attendance_id",rs.getString("attendance_id"));
			results.put("attendance_student_id",Integer.parseInt(rs.getString("attendance_student_id")));
			results.put("attendance_date",Integer.parseInt(rs.getString("attendance_month")));
			results.put("attendance_in_time",rs.getString("attendance_amount"));
			results.put("attendance_out_time",Integer.parseInt(rs.getString("attendance_date")));
			
			count++;
		}
		if(count==0)
		{
			results.put("attendance_id","");
			results.put("attendance_student_id",0);
			results.put("attendance_date","");
			results.put("attendance_in_time","");
			results.put("attendance_out_time","");
		}
		}
		catch(Exception e)
		{
			System.out.println("Error is: "+ e);
		}
		return results;
    	}
    
	////// Function for updating attendance details ////
	public String updateAttendance(HashMap attendanceData)
	{
		String SQL = "UPDATE 'attendance' SET 'attendance_student_id' = ?, 'attendance_month' = ?, 'attendance_amount' = ?, 'attendance_date' = ? WHERE 'attendance_id' = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) attendanceData.get("attendance_student_id"));
			pstmt.setString(2,(String) attendanceData.get("attendance_month"));
			pstmt.setString(3,(String) attendanceData.get("attendance_amount"));
			pstmt.setString(4,(String) attendanceData.get("attendance_date"));
			pstmt.setString(5,(String) attendanceData.get("attendance_id"));
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the attendances details listing////////////////////  
	public ArrayList getAllAttendance(String student_id)
	{
		String SQL = "SELECT * FROM attendance, student where attendance_student_id = student_id";
		int count=0;
		ArrayList resultArray = new ArrayList();
		try
		{
			if(!student_id.equals("0"))
			{
				SQL = "SELECT * FROM attendance, student WHERE attendance_student_id = student_id AND attendance_student_id = "+student_id;
			}
			statement = connection.createStatement();
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("attendance_id",rs.getString("attendance_id"));
				results.put("attendance_student_id",rs.getString("attendance_student_id"));
				results.put("attendance_date",rs.getString("attendance_date"));
				results.put("attendance_in_time",rs.getString("attendance_in_time"));
				results.put("attendance_out_time",rs.getString("attendance_out_time"));
				results.put("student_name",rs.getString("student_first_name")+" "+rs.getString("student_middle_name")+" "+rs.getString("student_last_name"));
				
				count++;
				resultArray.add(results);
			}
		}
		catch(Exception e)
		{
			System.out.println("Error is: "+ e);
		}
		return resultArray;
	}
}
