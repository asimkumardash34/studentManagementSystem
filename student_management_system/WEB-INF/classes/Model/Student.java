package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Student extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
    public Student()
    {
		Connect.connect_mysql();
    }
    //////////Save User Details /////
    public String saveStudent(HashMap studentData)
    {

	String SQL = "INSERT INTO student (student_user, student_password, student_level, student_sal, student_first_name, student_middle_name, student_last_name, student_gender, student_address, student_village, student_state, student_country, student_landline, student_mobile, student_email, student_status, student_deparment, student_dob, student_nationalty) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?);";
	int record=0,last_inserted_id=0; 
	String error = "";
	
	try
	{
		pstmt = connection.prepareStatement(SQL);
		pstmt.setString(1,(String) studentData.get("student_user"));
		pstmt.setString(2,(String) studentData.get("student_password"));
		pstmt.setString(3,(String) studentData.get("student_level"));
		pstmt.setString(4,(String) studentData.get("student_sal"));
		pstmt.setString(5,(String) studentData.get("student_first_name"));
		pstmt.setString(6,(String) studentData.get("student_middle_name"));
		pstmt.setString(7,(String) studentData.get("student_last_name"));
		pstmt.setString(8,(String) studentData.get("student_gender"));
		pstmt.setString(9,(String) studentData.get("student_address"));
		pstmt.setString(10,(String) studentData.get("student_village"));
		pstmt.setString(11,(String) studentData.get("student_state"));
		pstmt.setString(12,(String) studentData.get("student_country"));
		pstmt.setString(13,(String) studentData.get("student_landline"));
		pstmt.setString(14,(String) studentData.get("student_mobile"));
		pstmt.setString(15,(String) studentData.get("student_email"));
		pstmt.setString(16,(String) studentData.get("student_status"));
		pstmt.setString(17,(String) studentData.get("student_deparment"));
		pstmt.setString(18,(String) studentData.get("student_dob"));
		pstmt.setString(19,(String) studentData.get("student_nationalty"));
		
		record = pstmt.executeUpdate();
		/// Get the Last Insert ID ///
		rs = pstmt.getGeneratedKeys();
		if(rs.next())
		{
			last_inserted_id = rs.getInt(1);
		}
		  
		pstmt.close();
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
	
	/// Save Credentials to Login ////
    SQL = "INSERT INTO login (login_emp_id, login_user, login_password, login_email) VALUES (?, ?, ?, ? );";
    try
	{
		pstmt = connection.prepareStatement(SQL);
		pstmt.setInt(1,last_inserted_id);
		pstmt.setString(2,(String) studentData.get("student_user"));
		pstmt.setString(3,(String) studentData.get("student_password"));
		pstmt.setString(4,(String) studentData.get("student_email"));
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
	
    //////////////////Function for getting Users Details//////////	
    public HashMap getStudentDetails(int student_id)
	{
        HashMap resultsArray = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM student WHERE student_id = "+student_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				resultsArray.put("student_id",rs.getString("student_id"));
				resultsArray.put("student_user",rs.getString("student_user"));
				resultsArray.put("student_level",rs.getString("student_level"));
				resultsArray.put("student_sal",Integer.parseInt(rs.getString("student_sal")));
				resultsArray.put("student_first_name",rs.getString("student_first_name"));
				resultsArray.put("student_middle_name",rs.getString("student_middle_name"));
				resultsArray.put("student_last_name",rs.getString("student_last_name"));
				resultsArray.put("student_gender",rs.getString("student_gender"));
				resultsArray.put("student_address",rs.getString("student_address"));
				resultsArray.put("student_village",rs.getString("student_village"));
				resultsArray.put("student_state",Integer.parseInt(rs.getString("student_state")));
				resultsArray.put("student_country",Integer.parseInt(rs.getString("student_country")));
				resultsArray.put("student_landline",rs.getString("student_landline"));
				resultsArray.put("student_mobile",rs.getString("student_mobile"));
				resultsArray.put("student_email",rs.getString("student_email"));
				resultsArray.put("student_status",Integer.parseInt(rs.getString("student_status")));
				resultsArray.put("student_deparment",Integer.parseInt(rs.getString("student_deparment")));
				resultsArray.put("student_dob",rs.getString("student_dob"));
				resultsArray.put("student_nationalty",rs.getString("student_nationalty"));
				count++;
            }
			if(count==0)
			{
				resultsArray.put("student_id","");
				resultsArray.put("student_user","");
				resultsArray.put("student_level","");
				resultsArray.put("student_sal",0);
				resultsArray.put("student_first_name","");
				resultsArray.put("student_middle_name","");
				resultsArray.put("student_last_name","");
				resultsArray.put("student_gender","");
				resultsArray.put("student_address","");
				resultsArray.put("student_village","");
				resultsArray.put("student_state",0);
				resultsArray.put("student_country",0);
				resultsArray.put("student_landline","");
				resultsArray.put("student_mobile","");
				resultsArray.put("student_email","");
				resultsArray.put("student_status",0);
				resultsArray.put("student_deparment",0);
				resultsArray.put("student_dob","");
				resultsArray.put("student_nationalty","");

			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return resultsArray;
    }

	public String updateStudent(HashMap studentData)
	{
		String SQL = "UPDATE student SET student_sal = ?, student_first_name = ?, student_middle_name = ?, student_last_name = ?, student_gender = ?, student_address = ?, student_village = ?, student_state = ?, student_country = ?, student_landline = ?, student_mobile = ?, student_email = ?, student_status = ?, student_deparment = ?, student_dob = ?, student_nationalty = ? WHERE student_id = ?";
		String error = "";
		
		int record=0;	
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) studentData.get("student_sal"));
			pstmt.setString(2,(String) studentData.get("student_first_name"));
			pstmt.setString(3,(String) studentData.get("student_middle_name"));
			pstmt.setString(4,(String) studentData.get("student_last_name"));
			pstmt.setString(5,(String) studentData.get("student_gender"));
			pstmt.setString(6,(String) studentData.get("student_address"));
			pstmt.setString(7,(String) studentData.get("student_village"));
			pstmt.setString(8,(String) studentData.get("student_state"));
			pstmt.setString(9,(String) studentData.get("student_country"));
			pstmt.setString(10,(String) studentData.get("student_landline"));
			pstmt.setString(11,(String) studentData.get("student_mobile"));
			pstmt.setString(12,(String) studentData.get("student_email"));
			pstmt.setString(13,(String) studentData.get("student_status"));
			pstmt.setString(14,(String) studentData.get("student_deparment"));
			pstmt.setString(15,(String) studentData.get("student_dob"));
			pstmt.setString(16,(String) studentData.get("student_nationalty"));
			pstmt.setString(17,(String) studentData.get("student_id"));
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
	public boolean deleteStudent(int student_id)
	{
		return true;
	}

	/////Function for Getting the List////////////
	public String getStateOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("state","state_id","state_name","state_id,state_name",selectedID,"1");
    }
	
	/////Function for Getting the List////////////
	public String getStudentsOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("student","student_id","student_id","student_id,student_id",selectedID,"1");
    }
    
	/////Function for Getting the List////////////
	public String getCountryOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("country","country_id","country_name","country_id,country_name",selectedID,"1");
    }	
	
	/////Function for Getting the List////////////
	public String getSalutionOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("salutions","sl_id","sl_name","sl_id,sl_name",selectedID,"1");
    }	
	
	/////Function for Getting the List////////////
	public String getConnectionTypeOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("connection_type","cont_id","cont_name","cont_id,cont_name",selectedID,"1");
    }
    
	/////Function for Getting the List////////////
	public String getStatusOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("status","status_id","status_name","status_id,status_name",selectedID,"1");
    }
    
    /////Function for Getting the List////////////
	public String getDepartmentOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("department","dept_id","dept_name","dept_id,dept_name",selectedID,"1");
    }
    
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllStudent()
	{
		int count=0;
		String error = "";
		
        ArrayList resultArray = new ArrayList();
        try
		{
            String SQL = "SELECT * FROM student" ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("student_id",rs.getString("student_id"));
				results.put("student_user",rs.getString("student_user"));
				results.put("student_level",rs.getString("student_level"));
				results.put("student_sal",rs.getString("student_sal"));
				results.put("student_first_name",rs.getString("student_first_name"));
				results.put("student_middle_name",rs.getString("student_middle_name"));
				results.put("student_last_name",rs.getString("student_last_name"));
				results.put("student_gender",rs.getString("student_gender"));
				results.put("student_address",rs.getString("student_address"));
				results.put("student_village",rs.getString("student_village"));
				results.put("student_state",rs.getString("student_state"));
				results.put("student_country",rs.getString("student_country"));
				results.put("student_landline",rs.getString("student_landline"));
				results.put("student_mobile",rs.getString("student_mobile"));
				results.put("student_email",rs.getString("student_email"));
				results.put("student_status",Integer.parseInt(rs.getString("student_status")));
				results.put("student_deparment",Integer.parseInt(rs.getString("student_deparment")));
				results.put("student_dob",rs.getString("student_dob"));
				results.put("student_nationalty",rs.getString("student_nationalty"));
				count++;
                resultArray.add(results);
            }
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
        return resultArray;
    }
	
	public String getDepartment(int dept_id)
	{
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count=0;
		try
		{
            SQL =  "SELECT dept_name FROM department WHERE dept_id = "+dept_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				value = rs.getString("dept_name");
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return value;
    }
    
    public String getStatus(int status_id)
	{
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count=0;
		try
		{
            SQL =  "SELECT status_name FROM status WHERE status_id = "+status_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				value = rs.getString("status_name");
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return value;
    }
}
