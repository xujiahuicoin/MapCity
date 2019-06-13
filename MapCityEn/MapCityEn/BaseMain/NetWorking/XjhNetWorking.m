//
//  XjhNetWorking.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XjhNetWorking.h"

@implementation XjhNetWorking

+(instancetype)shareNetWorking{
    
    static XjhNetWorking * networking = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        networking = [[self alloc] init];
    });
    
    return networking;
    
}

-(instancetype)init{
    
    if (self = [super init]) {
        
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.requestSerializer.timeoutInterval = 10.f;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        _manager.securityPolicy.allowInvalidCertificates = YES;
        _manager.securityPolicy.validatesDomainName = NO;
        
    }
    
    return self;
}

///Get
-(void)GetSessionManagerWithUrl:(NSString*)urlStr parameters:(id)parame success:(void(^)(id resposData))SuccessAction faile:(void(^)(NSString*errorStr))FaileAction{
    
    [SVProgressHUD show];
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.manager GET:urlStr parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        if (SuccessAction) {
            SuccessAction(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
    }];
    
}
///Post
-(void)PostSessionManagerWithUrl:(NSString*)urlStr parameters:(id)parame success:(void(^)(id resposData))SuccessAction faile:(void(^)(NSString*errorStr))FaileAction{
    
    [SVProgressHUD show];
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self.manager POST:urlStr parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        if (SuccessAction) {
            SuccessAction(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
    }];
    
}
@end
