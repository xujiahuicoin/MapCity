//
//  XjhCollection.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XjhCollection : UICollectionView
///初始化
-(instancetype)initWithViewFrame:(CGRect)frame scrollDirectionVerTical:(BOOL)Vertical ;


@property(nonatomic,weak) id<XjhClickTypeDelegate> xjhDelegate ;

///type:1:homeindex 
-(void)UpDateCollectionViewWithType:(ClickTypeEnum)clickType array:(NSArray*)array;
@end


