package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.jspsmart.upload.Request;
import object.*;
import service.CategoryDao;
import service.GoodsDao;

public class UploadServlet_edit extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("utf-8");//第一句，设置服务器端编码
		SmartUpload smartUpload=new SmartUpload();
		String filename=null;
		Request req=smartUpload.getRequest();
		ServletConfig config=this.getServletConfig();
		smartUpload.initialize(config,request,response);
		try {
			
			smartUpload.upload();
			File smartfFile=smartUpload.getFiles().getFile(0);
			filename=smartfFile.getFileName();
			smartfFile.saveAs("/images/"+smartfFile.getFileName(),SmartUpload.SAVE_VIRTUAL);
			
		} catch (SmartUploadException e) {
			System.out.println(e);
			filename=req.getParameter("picture");
		}
		String goodsname=req.getParameter("goodsname");
		Integer categoryid=Integer.parseInt(req.getParameter("categoryid"));
		Float preprice=Float.parseFloat(req.getParameter("preprice"));
		Float nowprice=Float.parseFloat(req.getParameter("nowprice"));
		Integer pepertory=Integer.parseInt(req.getParameter("pepertory"));
		Integer sale=Integer.parseInt(req.getParameter("sale"));
		String describe=req.getParameter("describe");
		Integer goodsid=Integer.parseInt(req.getParameter("goodsid"));
		
		if(filename.equals(req.getParameter("picture"))==false){
			filename="images/"+filename;
			System.out.println(filename);
		}
		GoodsDao goodsDao=new GoodsDao();
		Goods goods=new Goods();
		try {
			goods.setCategoryid(categoryid);
			goods.setGoodsname(goodsname);
			goods.setPreprice(preprice);
			goods.setNowprice(nowprice);
			goods.setPepertory(pepertory);
			goods.setSale(sale);
			goods.setDescribe(describe);
			goods.setPicture(filename);
			goods.setGoodsid(goodsid);
			goodsDao.updateGoods(goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/shopping/managegoods.jsp?kind=0");
	}
}