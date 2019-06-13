//
//  NSObject+Extension.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
-(void)checkNilWithBlock:(void(^_Nullable)())block;
-(void)checkNilWithNilBlock:(void(^_Nullable)())nilBlock NOnilBlock:(void(^_Nullable)())NOnilBlock;

/**
 检查是否为空或null

 @return 是空YES 非空NO
 */
-(BOOL)checkIsNil;
@end
