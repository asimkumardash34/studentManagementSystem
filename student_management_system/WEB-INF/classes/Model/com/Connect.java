package com;
import java.sql.*;
import java.util.*;

public class Connect
{
    public static Statement statement = null;
    public static Connection connection;
	public static ResultSet rs;
	public static PreparedStatement pstmt;
    /////Function for connect to the MySQL Server Database////////////
	public static void connect_mysql()
    {
    	try  
    	{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
    		connection = DriverManager.getConnection("jdbc:mysql://localhost/student_management_system?" + "user=root");
			statement=connection.createStatement();
   		}
   		catch(Exception e)  
    	{
			System.out.println(" Error : "+ e.toString());
    	}
    }
	////////Function for geting the Option/////////////////////
	public static String getOptionList(String tableName,String idColumn,String valueColumn,String Columns,int selID,String conn)
	{
		String SQL = "SELECT "+Columns+" FROM "+tableName+" where "+conn; 
		String Option="<option value=''>Please Select</option>";
		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				int selectedID = rs.getInt(idColumn);
				if(selectedID==selID)
					Option+="<option value=\""+selectedID+"\" Selected>"+rs.getString(valueColumn)+"</option>";
				else
					Option+="<option value=\""+selectedID+"\">"+rs.getString(valueColumn)+"</option>";
			}
		}
		catch(Exception e)
		{
			System.out.println("Error : "+e);
		}
		return Option;
	}
	//////////////////Function for getting Option Details//////////	
    public String getOptionValue(String tableName, String colValue, String colName, int colId)
	{
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count=0;
		try
		{
            SQL =  "SELECT "+colValue+" FROM "+tableName+" WHERE "+colName+" = "+colId ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				value = rs.getString(colValue);
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return value;
    }
}
