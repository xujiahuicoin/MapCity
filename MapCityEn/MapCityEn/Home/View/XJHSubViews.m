//
//  XJHSubViews.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XJHSubViews.h"

@implementation XJHSubViews

///方块。中间一个label的
+(UIView*)getSquareViewsFrame:(CGRect)frame labelText:(NSString*)text textColor:(UIColor*)textColor imageName:(NSString*)imageName tag:(int)tag actionBtn:(void(^)(int))Actions{
    
    UIView * views = [[UIView alloc] initWithFrame:frame];
    views.layer.cornerRadius = 8;
    views.layer.masksToBounds = YES;
    
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:views.bounds];
    imageV.image = UIimageName(imageName);
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    imageV.layer.masksToBounds = YES;
    [views addSubview:imageV];
    
    UILabel * label = [myLabel labelWithframe:CGRectMake(0, views.height/2-10, views.width, 20) backgroundColor:ColorClear title:text font:14 Alignment:NSTextAlignmentCenter textColor:textColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    
    [views addSubview:label];
    
    
    UIButton * btns = [myButton buttonWithType:UIButtonTypeCustom frame:views.bounds title:@"" colors:ColorClear andBackground:ColorClear tag:tag andBlock:^(myButton *button) {
        
        Actions(button.tag);
        
    }];

    [ views addSubview:btns];
    
    return views;
    
    
}

///方块 上图片 下文字
+(UIView*)returnBtnOnetop:(CGFloat)top Action:(void(^)(NSInteger tag))ActionTag {
    //@"ic_me_consult"
    NSArray * ArrayImg = @[@"icon_1",@"icon_2",@"icon_3",@"icon_4",@"icon_5"];
    NSArray * ArrayText = @[@"今日涨势",@"今日跌势",@"我的记录",@"查看行情",@"我的自选"];
    
    //底部b高度
    int labelBackH = 15;
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, top, ScreenWidth, ScreenWidth/3*0.7*2+10)];
    backView.backgroundColor = ColorWhite;
    for (int i=0; i<ArrayImg.count; i++) {
        
        [self returnBtnWithImgAndLabelToAction:^{
            ActionTag(i);
        } imageName:ArrayImg[i] titleText:ArrayText[i] total:ArrayImg.count nowNum:i AddView:backView];
        
    }
    
    //底部灰色
    UILabel * labelback  = [[UILabel alloc] initWithFrame:CGRectMake(0, backView.height-IPHONEHIGHT(labelBackH), ScreenWidth, IPHONEHIGHT(labelBackH))];
    labelback.backgroundColor = ColorbackGround;
    [backView addSubview:labelback];
    
    
    
    return backView;
    
}

+(UIView *)returnBtnWithImgAndLabelToAction:(butActionsImg)action imageName:(NSString*)imagename titleText:(NSString*)stringtext total:(NSInteger)totleNUm nowNum:(NSInteger)nowsNum AddView:(UIView*)VC{
    
    UIView * backGroundv = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/3*(nowsNum%3), (nowsNum>2?(VC.height/2):0), ScreenWidth/3, VC.height/2)];
    [VC addSubview:backGroundv];
    
    float bili = 0.6;
    int imgWith = 138*bili;
    UIImageView * imagevi = [[UIImageView alloc] initWithFrame:CGRectMake((backGroundv.width-IPHONEWIDTH(imgWith))/2, (VC.height/2-(IPHONEWIDTH(imgWith)+IPHONEWIDTH(15+21)))/2, IPHONEWIDTH(imgWith-8), IPHONEWIDTH(imgWith-8))];
    imagevi.contentMode = UIViewContentModeScaleAspectFit;
    imagevi.image = [UIImage imageNamed:imagename];
    [backGroundv addSubview:imagevi];
    
    //label
    UILabel * textlabel = [myLabel labelWithframe:CGRectMake(0, imagevi.bottom+IPHONEWIDTH(15), backGroundv.width, IPHONEWIDTH(21)) backgroundColor:ColorClear title:stringtext font:IPHONEWIDTH(28) Alignment:NSTextAlignmentCenter textColor:Colorblack];
    [backGroundv addSubview:textlabel];
    
    UIButton * actionBut = [myButton buttonWithType:UIButtonTypeCustom frame:backGroundv.frame title:@"" colors:ColorBlue andBackground:ColorClear tag:nowsNum+1000 andBlock:^(myButton *button) {
        
        action();
    }];
    
    [VC addSubview:actionBut];
    
    return backGroundv;
    
}

@end
