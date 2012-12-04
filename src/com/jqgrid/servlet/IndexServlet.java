package com.jqgrid.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jqgrid.entity.LeftTreeEntity;

public class IndexServlet extends HttpServlet {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3868071992604369847L;

	/**
	 * Constructor of the object.
	 */
	public IndexServlet() {
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
		if ("getLeftTree".equalsIgnoreCase(method)) {
			jsonStr = getLeftTree();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonStr);
	}

	private String getLeftTree() throws JsonProcessingException {
		List<LeftTreeEntity> leftTreeGridList = new ArrayList<LeftTreeEntity>();

		LeftTreeEntity root1 = new LeftTreeEntity();
		root1.setId("1");
		root1.setMenu("Loading Data");
		root1.setUrl("");
		root1.setParent("0");
		root1.setLevel("0");
		root1.setIsLeaf("false");
		root1.setExpanded("false");
		root1.setLoaded("true");

		LeftTreeEntity root1_1 = new LeftTreeEntity();
		root1_1.setId("2");
		root1_1.setMenu("XML Data");
		root1_1.setUrl("");
		root1_1.setParent("1");
		root1_1.setLevel("1");
		root1_1.setIsLeaf("true");
		root1_1.setExpanded("true");
		root1_1.setLoaded("true");

		LeftTreeEntity root1_2 = new LeftTreeEntity();
		root1_2.setId("3");
		root1_2.setMenu("JSON Data");
		root1_2.setUrl("");
		root1_2.setParent("1");
		root1_2.setLevel("1");
		root1_2.setIsLeaf("true");
		root1_2.setExpanded("true");
		root1_2.setLoaded("true");

		LeftTreeEntity root1_3 = new LeftTreeEntity();
		root1_3.setId("4");
		root1_3.setMenu("Load once");
		root1_3.setUrl("");
		root1_3.setParent("1");
		root1_3.setLevel("1");
		root1_3.setIsLeaf("true");
		root1_3.setExpanded("true");
		root1_3.setLoaded("true");

		LeftTreeEntity root1_4 = new LeftTreeEntity();
		root1_4.setId("5");
		root1_4.setMenu("Array Data");
		root1_4.setUrl("");
		root1_4.setParent("1");
		root1_4.setLevel("1");
		root1_4.setIsLeaf("true");
		root1_4.setExpanded("true");
		root1_4.setLoaded("true");

		LeftTreeEntity root2 = new LeftTreeEntity();
		root2.setId("6");
		root2.setMenu("其他");
		root2.setUrl("");
		root2.setParent("0");
		root2.setLevel("0");
		root2.setIsLeaf("false");
		root2.setExpanded("false");
		root2.setLoaded("true");

		leftTreeGridList.add(root1);
		leftTreeGridList.add(root1_1);
		leftTreeGridList.add(root1_2);
		leftTreeGridList.add(root1_3);
		leftTreeGridList.add(root1_4);
		leftTreeGridList.add(root2);

		ObjectMapper mapper = new ObjectMapper();
		String treeGridJson = mapper.writeValueAsString(leftTreeGridList);
		return "{\"response\":" + treeGridJson + "}";
	}
}