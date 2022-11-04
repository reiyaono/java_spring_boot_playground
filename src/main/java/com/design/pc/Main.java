package com.design.pc;

import com.design.factory.Factory;
import com.design.factory.Product;

public class Main {
	public static void main(String[] args) {
		
		Factory factory = new PcFactory();
		System.out.println("hogeeeeeee");
		
		Product pc1 = factory.create("A001");
		Product pc2 = factory.create("A002");
		Product pc3 = factory.create("A003");
		
		pc1.use();
		pc2.use();
		pc3.use();
		
	}
}