package com.cos.util;

public class Test {
	public static void main(String[] args) {
		byte b = 117;
		String s = Integer.toString(b);
		System.out.println(s);
		
		// 00000000 00000000 00000000 00000001 = binary
		int i =1;
		System.out.println(Integer.toBinaryString(i));
		
		// 00000000 00000000 00000000 10010110 = int
		// 11111111 11111111 11111111 10010110 = binary
		int j = 150;
		System.out.println(Integer.toBinaryString(j));
		
		System.out.println(Integer.toString((byte)j & 0xff, 16));
	}
	
	
}
