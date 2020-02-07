package com.aimdek;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class FJ {

	public static void main(String[] args) {
//	      @SuppressWarnings("resource")
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Demo objA = (Demo) context.getBean("demo");
//	     obj.getMessage();
		objA.setMessage("I'm object A");
		objA.getMessage();

		Demo objB = (Demo) context.getBean("demo");
		objB.setMessage("I'm object B");
		objB.getMessage();

	}
}
