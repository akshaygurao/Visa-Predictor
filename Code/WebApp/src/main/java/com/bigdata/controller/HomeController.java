package com.bigdata.controller;

import java.io.File;
import java.io.FileReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bigdata.pojo.Eligibility;
import com.google.gson.JsonObject;

import au.com.bytecode.opencsv.CSVReader;



@Controller
public class HomeController {
	
	@Autowired
	ServletContext servletContext;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request,Locale locale, Model model) throws Exception {
					
		return new ModelAndView("home");
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView user(HttpServletRequest request,Locale locale, Model model) throws Exception {
					
		return new ModelAndView("user");
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.POST)
 	public ModelAndView eligibility(HttpServletRequest request,Locale locale, Model model) throws Exception {
		
		double w0=3.960386e+00,w1=0,w2=-3.831457e-07,w3=0,w4=0;
		String status;
		
		switch(request.getParameter("position").toUpperCase()) {
		
		case "YES": w1=5.579838e-01;
		break;
		case "NO": w1=0;
		break;
				
		}
		
		switch(request.getParameter("state").toUpperCase()) {
		
		case "DC" : w3=-1.003631e+00;
            break;
        case "AK":	w3=0;
            break;
        case "AL":	w3=0;
            break;
        case "AR": w3=5.931996e-02;
            break;
        case "AZ": w3=-2.586304e-01;
            break;
        case "CA": w3=-3.584599e-01;
            break;
        case "CO": w3=-2.516657e-01;
            break;
        case "CT": w3=9.268283e-02;
            break;
        case "DE": w3=-2.177352e-01;
            break;
        case "FL": w3=-5.995356e-01;
            break;
        case "GA": w3=-4.286729e-01;
            break;
        case "HI": w3=0;
            break;
        case "IA": w3=-7.230714e-01;
            break;
        case "ID": w3=0;
            break;
        case "IL": w3=-4.663689e-03;
            break;
        case "IN": w3=3.276407e-01;
            break;
        case "KS": w3=-4.723339e-01;
            break;
        case "KY": w3=1.986726e-01;
            break;
        case "LA": w3=0;
            break;
        case "MA": w3=-1.124824e-01;
            break;
        case "MD": w3=-8.500783e-02;
            break;
        case "ME": w3=0;
            break;
        case "MI": w3=7.156613e-02;
            break;
        case "MN": w3=-5.695964e-01;
            break;
        case "MO": w3=5.794500e-01;
            break;
        case "MS": w3=0;
            break;
        case "MT": w3=0;
            break;
        case "NC": w3=-9.132163e-02;
            break;
        case "ND": w3=0;
            break;
        case "NE": w3=0;
            break;
        case "NH": w3=0;
            break;
        case "NJ": w3=1.248069e-01;
            break;
        case "NM": w3=0;
            break;
        case "NV": w3=0;
            break;
        case "NY": w3=-4.444791e-01;
            break;
        case "OH": w3=1.571981e-01;
            break;
        case "OK": w3=0;
            break;
        case "OR": w3=-2.922215e-01;
            break;
        case "PA": w3=1.127175e-01;
            break;
        case "RI": w3=5.590780e-01;
            break;
        case "SC": w3=1.192828e-01;
            break;
        case "SD": w3=0;
            break;
        case "TN": w3=2.487337e-01;
            break;
        case "TX": w3=-3.517202e-01;
            break;
        case "UT": w3=-3.801610e-01;
            break;
        case "VA": w3=-2.563479e-01;
            break;
        case "VT": w3=0;
            break;
        case "WA": w3=0;
            break;
        case "WI": w3=-2.139738e-01;
            break;
        case "WV": w3=0;
            break;
        case "WY": w3=0;
            break;
				
		}
		
		switch(request.getParameter("fow").toUpperCase()) {
		
		case "ACCOUNTANT": w4=-6.952808e-02;
		break;
		case "ENGINEER": w4=3.208683e-02;
		break;
		case "EXECUTIVE": w4=-1.898819e+00;
		break;
		case "MANAGER": w4=-6.692948e-01;
		break;
		case "TECHNICIAN": w4=-8.33E-01;
		break;
		
		}
		
		double eligibility=w0+w1+w2*Float.parseFloat(request.getParameter("salary"))+w3+w4;
		
		
		if(eligibility > 3 && Float.parseFloat(request.getParameter("salary")) > 50000) {
			status="CERTIFIED";			
		}
		
		else {
			status="DENIED";
		}
		
		
		HttpSession s = request.getSession();
		
		
	
		
	//	float eligibility=e.getEligibility();
		
		s.setAttribute("eligibility", status);
		
		return new ModelAndView("user");
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView users(HttpServletRequest request,Locale locale, Model model) throws Exception {
					
		return new ModelAndView("users");
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public ModelAndView usersTable(HttpServletRequest request,Locale locale, Model model,@RequestParam("csv") MultipartFile file) throws Exception {

		String csvFilename1 = "";
		
		File directory;
		String check = File.separator; // Checking if system is linux
										// based or windows based by
										// checking seprator used.
		String path = null;
		if (check.equalsIgnoreCase("\\")) {
			path = servletContext.getRealPath("").replace("build\\", ""); // gives real path as Lab9/build/web/
																		  // so we need to replace build in the path
																				}

		if (check.equalsIgnoreCase("/")) {
			path = servletContext.getRealPath("").replace("build/", "");
			path += "/"; // Adding trailing slash for Mac systems.
		}
		directory = new File(path + "\\" + file);
		boolean temp = directory.exists();
		if (!temp) {
			temp = directory.mkdir();
		}
		if (temp) {
			// We need to transfer to a file
			

			String fileName = file.getOriginalFilename();
			// could generate file names as well

			
			File localFile = new File(directory.getPath(), fileName);
			
			file.transferTo(localFile);
						
			csvFilename1 = localFile.getPath();


		} else {
			System.out.println("Failed to create directory!");
		}

		

        CSVReader reader1 = new CSVReader(new FileReader(csvFilename1));   
        List<Eligibility> eList = new ArrayList<Eligibility>();

        while (reader1.readNext() != null) {
           
        	String[] parsedLine= reader1.readNext();
        	
        	double w0=3.960386e+00,w1=0,w2=-3.831457e-07,w3=0,w4=0;
    		String status;
    		
    		switch(parsedLine[2].toString().toUpperCase()) {
    		
    		case "Y": w1=5.579838e-01;
    		break;
    		case "N": w1=0;
    		break;
    		
    		default : w1=0;
    				
    		}
    		
    		switch(parsedLine[1].toUpperCase()) {
    		
    		case "DC" : w3=-1.003631e+00;
                break;
            case "AK":	w3=0;
                break;
            case "AL":	w3=0;
                break;
            case "AR": w3=5.931996e-02;
                break;
            case "AZ": w3=-2.586304e-01;
                break;
            case "CA": w3=-3.584599e-01;
                break;
            case "CO": w3=-2.516657e-01;
                break;
            case "CT": w3=9.268283e-02;
                break;
            case "DE": w3=-2.177352e-01;
                break;
            case "FL": w3=-5.995356e-01;
                break;
            case "GA": w3=-4.286729e-01;
                break;
            case "HI": w3=0;
                break;
            case "IA": w3=-7.230714e-01;
                break;
            case "ID": w3=0;
                break;
            case "IL": w3=-4.663689e-03;
                break;
            case "IN": w3=3.276407e-01;
                break;
            case "KS": w3=-4.723339e-01;
                break;
            case "KY": w3=1.986726e-01;
                break;
            case "LA": w3=0;
                break;
            case "MA": w3=-1.124824e-01;
                break;
            case "MD": w3=-8.500783e-02;
                break;
            case "ME": w3=0;
                break;
            case "MI": w3=7.156613e-02;
                break;
            case "MN": w3=-5.695964e-01;
                break;
            case "MO": w3=5.794500e-01;
                break;
            case "MS": w3=0;
                break;
            case "MT": w3=0;
                break;
            case "NC": w3=-9.132163e-02;
                break;
            case "ND": w3=0;
                break;
            case "NE": w3=0;
                break;
            case "NH": w3=0;
                break;
            case "NJ": w3=1.248069e-01;
                break;
            case "NM": w3=0;
                break;
            case "NV": w3=0;
                break;
            case "NY": w3=-4.444791e-01;
                break;
            case "OH": w3=1.571981e-01;
                break;
            case "OK": w3=0;
                break;
            case "OR": w3=-2.922215e-01;
                break;
            case "PA": w3=1.127175e-01;
                break;
            case "RI": w3=5.590780e-01;
                break;
            case "SC": w3=1.192828e-01;
                break;
            case "SD": w3=0;
                break;
            case "TN": w3=2.487337e-01;
                break;
            case "TX": w3=-3.517202e-01;
                break;
            case "UT": w3=-3.801610e-01;
                break;
            case "VA": w3=-2.563479e-01;
                break;
            case "VT": w3=0;
                break;
            case "WA": w3=0;
                break;
            case "WI": w3=-2.139738e-01;
                break;
            case "WV": w3=0;
                break;
            case "WY": w3=0;
                break;
            default : w3=0;
    		}
    		
    		switch(parsedLine[0].toUpperCase()) {
    		
    		case "ACCOUNTANT": w4=-6.952808e-02;
    		break;
    		case "ENGINEER": w4=3.208683e-02;
    		break;
    		case "EXECUTIVE": w4=-1.898819e+00;
    		break;
    		case "MANAGER": w4=-6.692948e-01;
    		break;
    		case "TECHNICIAN": w4=-8.33E-01;
    		break;
    		default : w4=0;
    		}
    		
    		double eligibility=w0+w1+w2*Float.parseFloat(parsedLine[3])+w3+w4;
    		
    		
    		if(eligibility > 3 && Float.parseFloat(parsedLine[3])>50000) {
    			status="CERTIFIED";			
    		}
    		
    		else {
    			status="DENIED";
    		}
        	
        	Eligibility e = new Eligibility();
        	
        	e.setWorkField(parsedLine[0]);
        	e.setState(parsedLine[1]);
        	e.setFulltime(parsedLine[2]);
        	e.setSalary(Float.parseFloat(parsedLine[3]));
        	e.setStatus(status);
        	
        	eList.add(e);
        }
        
        reader1.close();
        
         model.addAttribute("candidateDetails", eList);
        		
		return new ModelAndView("users");
	}
	
}
