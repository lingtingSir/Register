//
//  Config.h
//  Register
//
//  Created by lmj on 15-10-4.
//
//

#ifndef Register_Config_h
#define Register_Config_h


#pragma mark Register TextField Tag enum
enum TAG_REGISTER_TEXTFIELD{
    
    Tag_AccountTextField = 100 ,        //用户名
    Tag_TempPasswordTextField,    //登录密码
    Tag_ConfirmPasswordTextField, //确认登录密码
   
};
#pragma mark Login TextField Tag enum
enum TAG_LOGIN_TEXTFIELD{
    
    Tag_UserTextField = 200 ,        //用户名
    Tag_PasswordTextField,    //登录密码
    
};


#endif
