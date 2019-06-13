//
//  LoginTools.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "LoginTools.h"
//登陆账号
#define loginPhoneNum @"15120006180"
#define loginPasswords @"123456"
///判断登陆与否
#define loginYN @"loginYN"
@implementation LoginTools



///  申请登录  账号+ 密码
+(BOOL)getLoginresoultwoth:(NSString*)account passWord:(NSString*)passWord VCview:(UIViewController*)VC{
    
    
    if (account.length!=11) {
        [MBProgressHUD showText:@"手机号输入有误" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
        return NO;
    }
    
    BOOL logins = NO;
    //匹配现有的内存
    NSString * pass = [[NSUserDefaults standardUserDefaults] objectForKey:account];
    if ([pass isEqualToString:passWord] ||  ([account isEqualToString:loginPhoneNum] && [passWord isEqualToString:loginPasswords])) {
        
        [MBProgressHUD showText:@"登录成功" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
        //一致
        logins = YES;
        [[NSUserDefaults standardUserDefaults] setObject:account forKey:loginYN];
        //发送登录成功通知
        [[NSNotificationCenter defaultCenter] postNotificationName:loginYN object:nil];
    }else{
        
        [MBProgressHUD showText:@"账号/密码有误" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
        return NO;
    }
    
    
    return logins;

}

///注册账户 账户+ 密码
+(BOOL)getRegistResoultwoth:(NSString*)account passWord:(NSString*)passone passTwo:(NSString * )passTwo VC:(UIViewController*)VC{
    
    if (account.length==11) {
        if ([passone isEqualToString:passTwo]) {
            
            //
            
            //匹配现有的内存
            NSString * pass = [[NSUserDefaults standardUserDefaults] objectForKey:account];
            if (!pass) {
                //进行保存
                [[NSUserDefaults standardUserDefaults] setObject:passTwo forKey:account];
                
                return  YES;
            }
            [MBProgressHUD showText:@"请勿重复注册" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
            
            
        }else{
            [MBProgressHUD showText:@"两次密码输入不一致" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
        }
        
    }else{
        
        //
        [MBProgressHUD showText:@"请正确输入手机号" HUDAddedTo:VC.view animated:YES afterDelay:showtime];
    }
    
    return NO;
    
}

///返回是否登录
+(BOOL)getLoginIsYesOrNO{
   
    NSString * loginbool = [[NSUserDefaults standardUserDefaults] objectForKey:loginYN];
    if (loginbool.length<1) {
        return NO;
    }
    
    
    return YES;
    
}
+(NSString*)getLoginAcount{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:loginYN];
}
+(void)getoutLogin{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:loginYN];
}
@end
