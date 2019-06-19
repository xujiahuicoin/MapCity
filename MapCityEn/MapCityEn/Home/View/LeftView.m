//
//  LeftView.m
//  AirspaceProject
//
//  Created by xujiahui on 2018/8/7.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#import "LeftView.h"

#import "UIViewController+MMDrawerController.h"
#import "MenuView.h"


@interface LeftView()

@end

@implementation LeftView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self initView];
       
        self.backgroundColor = appColors;
        
        
    }
    return  self;
}
-(void)initView{
    self.backgroundColor = ColorWhite;
    [self setUI];
    self.userInteractionEnabled = YES;
  
    UIGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                 initWithTarget:self
                                                 action:@selector(handleftPan:)];
    
    [self addGestureRecognizer:panGestureRecognizer];
    
    
  
//绘制UI
    [self setUI];
    
    
}

-(void)setUI{
    
    
    
}

#pragma mark - 屏幕往右滑处理

-(void)handleftPan:(UIPanGestureRecognizer*)recognizer{
    

    CGFloat Place;
    CGPoint translation = [recognizer translationInView:recognizer.view];
    static CGFloat BeganX;
    
    if(UIGestureRecognizerStateBegan == recognizer.state){
        BeganX = translation.x;
    }
    
    Place = (-translation.x) - (-BeganX);
    
    if (fabs(Place)<0.5) {
        Place=0.1;
    }
    
     if( Place >0){
         
    if(UIGestureRecognizerStateBegan == recognizer.state ||
       UIGestureRecognizerStateChanged == recognizer.state){
 
    [[NSNotificationCenter defaultCenter] postNotificationName:@"onOffisON" object:[NSString stringWithFormat:@"%lf",Place]];
        
    }else{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"onOffisOFF" object:[NSString stringWithFormat:@"%lf",Place]];
        
    }
         
     }
   
}


@end
