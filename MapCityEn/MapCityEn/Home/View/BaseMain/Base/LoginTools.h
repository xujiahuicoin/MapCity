//
//  LoginTools.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LoginTools : NSObject

///  申请登录  账号+ 密码
+(BOOL)getLoginresoultwoth:(NSString*)account passWord:(NSString*)passWord VCview:(UIViewController*)VC;

///注册账户 账户+ 密码
+(BOOL)getRegistResoultwoth:(NSString*)account passWord:(NSString*)passone passTwo:(NSString * )passTwo VC:(UIViewController*)VC;

///返回是否登录
+(BOOL)getLoginIsYesOrNO;

///返回登录账户
+(NSString*)getLoginAcount;
///退出登录
+(void)getoutLogin;


@end


