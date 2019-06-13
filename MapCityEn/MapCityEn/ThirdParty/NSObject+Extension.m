//
//  NSObject+Extension.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
-(void)checkNilWithBlock:(void(^_Nullable)())block{
    if (self!=nil &&![self isKindOfClass:[NSNull class]]) {
        block();
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
            [MBProgressHUD showText:@"参数错误" HUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES afterDelay:1.5];
        });
    }
}
-(void)checkNilWithNilBlock:(void(^_Nullable)())nilBlock NOnilBlock:(void(^_Nullable)())NOnilBlock{
    if (self!=nil &&![self isKindOfClass:[NSNull class]]) {
        NOnilBlock();
    }else{
        nilBlock();
    }
}

-(BOOL)checkIsNil{
    if (self!=nil &&![self isKindOfClass:[NSNull class]]) {
        return NO;
    }else{
        return YES;
    }
}
@end
