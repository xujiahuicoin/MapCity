//
//  XjhNetWorking.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

#define XJHNetWorks [XjhNetWorking shareNetWorking]
@interface XjhNetWorking : NSObject
@property(nonatomic,strong) AFHTTPSessionManager * manager ;

+(instancetype)shareNetWorking;

///Get
-(void)GetSessionManagerWithUrl:(NSString*)urlStr parameters:(id)parame success:(void(^)(id resposData))SuccessAction faile:(void(^)(NSString*errorStr))FaileAction;
///Post
-(void)PostSessionManagerWithUrl:(NSString*)urlStr parameters:(id)parame success:(void(^)(id resposData))SuccessAction faile:(void(^)(NSString*errorStr))FaileAction;
@end


