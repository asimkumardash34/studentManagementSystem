package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Fees extends Connect
{
	/////Function for connect to the MySQL Server Database////////////
	public Fees()
	{
		Connect.connect_mysql();
	}
	//////////Save the Fees Details /////
	public String saveFees(HashMap feesData)
	{
		String SQL = "INSERT INTO fees (fees_student_id, fees_month, fees_amount, fees_date) VALUES (?, ?, ?, ?);";
		int record=0; 
		String error = "";

		try
		{
			pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,(String) feesData.get("fees_student_id"));
			pstmt.setString(2,(String) feesData.get("fees_month"));
			pstmt.setString(3,(String) feesData.get("fees_amount"));
			pstmt.setString(4,(String) feesData.get("fees_date"));
	
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
	//////////////////Function for getting Fees Details//////////	
    public HashMap getFeesDetails(int fees_id)
	{
		HashMap results = new HashMap();
		int count=0;
		try
		{
		String SQL =  "SELECT * FROM fees WHERE fees_id = "+fees_id ;
		statement = connection.createStatement();
		rs = statement.executeQuery(SQL);
		while(rs.next())
		{
			results.put("fees_id",rs.getString("fees_id"));
			results.put("fees_student_id",Integer.parseInt(rs.getString("fees_student_id")));
			results.put("fees_month",Integer.parseInt(rs.getString("fees_month")));
			results.put("fees_amount",rs.getString("fees_amount"));
			results.put("fees_date",Integer.parseInt(rs.getString("fees_date")));
			
			count++;
		}
		if(count==0)
		{
			results.put("fees_id","");
			results.put("fees_student_id",0);
			results.put("fees_month",0);
			results.put("fees_amount","");
			results.put("fees_date","");
		}
		}
		catch(Exception e)
		{
			System.out.println("Error is: "+ e);
		}
		return results;
    	}
    
	////// Function for updating fees details ////
	public String updateFees(HashMap feesData)
	{
		String SQL = "UPDATE 'fees' SET 'fees_student_id' = ?, 'fees_month' = ?, 'fees_amount' = ?, 'fees_date' = ? WHERE 'fees_id' = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) feesData.get("fees_student_id"));
			pstmt.setString(2,(String) feesData.get("fees_month"));
			pstmt.setString(3,(String) feesData.get("fees_amount"));
			pstmt.setString(4,(String) feesData.get("fees_date"));
			pstmt.setString(5,(String) feesData.get("fees_id"));
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
	
	////////////////Function for getting all the feess details listing////////////////////  
	public ArrayList getAllFees(String student_id)
	{
		String SQL = "SELECT * FROM fees, student where fees_student_id = student_id";
		int count=0;
		ArrayList resultArray = new ArrayList();
		try
		{
			if(!student_id.equals("0"))
			{
				SQL = "SELECT * FROM fees, student WHERE fees_student_id = student_id AND fees_student_id = "+student_id;
			}
			statement = connection.createStatement();
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("fees_id",rs.getString("fees_id"));
				results.put("fees_student_id",Integer.parseInt(rs.getString("fees_student_id")));
				results.put("fees_month",Integer.parseInt(rs.getString("fees_month")));
				results.put("fees_amount",rs.getString("fees_amount"));
				results.put("fees_date",rs.getString("fees_date"));
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
	
    /////Function for Getting the List////////////
	public String getMonthOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("month","month_id","month_name","month_id,month_name",selectedID,"1");
    }	
}
