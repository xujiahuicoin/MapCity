//
//  XJHSubViews.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^btnAction) (NSInteger tag);
typedef void(^butActionsImg) (void);

NS_ASSUME_NONNULL_BEGIN

@interface XJHSubViews : NSObject

///方块。中间一个label的
+(UIView*)getSquareViewsFrame:(CGRect)frame labelText:(NSString*)text textColor:(UIColor*)textColor imageName:(NSString*)imageName tag:(int)tag actionBtn:(void(^)(int tag))Actions;


///方块 上图片 下文字
+(UIView*)returnBtnOnetop:(CGFloat)top Action:(void(^)(NSInteger tag))ActionTag;

+(UIView *)returnBtnWithImgAndLabelToAction:(butActionsImg)action imageName:(NSString*)imagename titleText:(NSString*)stringtext total:(NSInteger)totleNUm nowNum:(NSInteger)nowsNum AddView:(UIView*)VC;
@end

NS_ASSUME_NONNULL_END
