package com.cos.action.user;

import com.cos.action.Action;

public class UserFactory {
	public static Action getAction(String cmd) {
		if(cmd.equals("join")) {
			return new UserJoinAction();
		}else if(cmd.equals("login")) {
			return new UserLoginAction();
		}else if(cmd.equals("logout")) {
			return new UserLogoutAction();
		}else if(cmd.equals("update")){
			return new UserUpdateAction();
		}else if(cmd.equals("emailCheck")) {
			return new UserEmailCheckAction();
		}else if(cmd.equals("userProfile")) {
			return new UserProfileAction();
		}
		return null;
		
	}
}
