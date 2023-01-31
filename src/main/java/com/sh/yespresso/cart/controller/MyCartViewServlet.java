package com.sh.yespresso.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.yespresso.cart.model.dto.Cart;
import com.sh.yespresso.cart.model.service.CartService;

/**
 * Servlet implementation class MyCartViewServlet
 */
@WebServlet("/cart/cart")
public class MyCartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cartMemberId = request.getParameter("memberId");
		List<Cart> myCartList = cartService.selectMyCartList(cartMemberId);
		// jsp 포워딩
		request.getRequestDispatcher("/WEB-INF/views/cart/cart.jsp").forward(request, response);
	}

}
