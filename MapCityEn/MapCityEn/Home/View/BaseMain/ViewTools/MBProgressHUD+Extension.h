//
//  MBProgressHUD+Extension.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Extension)

+(void)ShowProgressView:(UIView *)view animated:(BOOL)animated;

+ (MBProgressHUD *)showProgressText:(NSString *)text HUDAddedTo:(UIView *)view animated:(BOOL)animated;

+ (MBProgressHUD *)showText:(NSString *)text HUDAddedTo:(UIView *)view animated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

- (void)toText:(NSString *)text hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
