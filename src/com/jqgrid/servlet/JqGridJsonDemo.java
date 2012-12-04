package com.jqgrid.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jqgrid.entity.Invheader;
import com.jqgrid.util.JDBCUtilsSingle;
import com.jqgrid.util.JqGridJsonBean;

public class JqGridJsonDemo extends HttpServlet {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5899385943404433476L;

	/**
	 * Constructor of the object.
	 */
	public JqGridJsonDemo() {
		super();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		String jsonStr = "";
		if ("query".equalsIgnoreCase(method)) {
			try {
				Connection conn = JDBCUtilsSingle.getInstance().getConnection();
				String sql = "select * from invheader";

				PreparedStatement preparedStatement = conn.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();

				List<Invheader> Invheaders = new ArrayList<Invheader>();
				JqGridJsonBean bean = new JqGridJsonBean();

				bean.setPage("1");
				bean.setTotal("2");
				bean.setRecords("10");

				while (rs.next()) {
					Invheader inv = new Invheader();
					inv.setInvid(rs.getInt("invid"));
					inv.setInvdate(rs.getTimestamp("invdate"));
					inv.setName(rs.getString("name"));
					inv.setAmount(rs.getDouble("amount"));
					inv.setTax(rs.getDouble("tax"));
					inv.setTotal(rs.getDouble("total"));
					inv.setNote(rs.getString("note"));

					Invheaders.add(inv);
				}
				bean.setRows(Invheaders);
				ObjectMapper mapper = new ObjectMapper();
				jsonStr = mapper.writeValueAsString(bean);
				// System.out.println("finalinfo is:" + jsonStr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.getWriter().print(jsonStr);
	}
}