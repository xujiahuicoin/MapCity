//
//  LeftView.h
//  AirspaceProject
//
//  Created by xujiahui on 2018/8/7.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftActionDelegate <NSObject>

-(void)leftActionWithTag:(NSInteger)tag;

@end

@interface LeftView : UIView

@property(nonatomic,weak) id <LeftActionDelegate> leftDelegate ;

-(void)setUILoginChange;

@end
