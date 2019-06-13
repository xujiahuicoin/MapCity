//
//  HeardView.h
//  FuturesPass
//
//  Created by mac on 2019/6/1.
//  Copyright © 2019 FuturesPass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HeardView : NSObject
///添加headerView 右侧文字点击
+(UIView*)GetHeardViewsFrame:(CGRect)frame title:(NSString*)title BtnText:(NSString*)text actions:(void(^)(void))Actions;

///添加 标题按钮。整体可以点击
+(UIView*)GetHeaderOneViewsWidth:(CGFloat)top tag:(NSInteger)tag title:(NSString*)title actions:(void(^)(NSInteger tag))Actions;

///返回一个进度条样式
+(UIView*)getProgressBarTop:(CGFloat)top title:(NSString*)title with:(CGFloat)floats height:(CGFloat)height ;
@end

NS_ASSUME_NONNULL_END
