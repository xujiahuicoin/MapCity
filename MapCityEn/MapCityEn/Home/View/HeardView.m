//
//  HeardView.m
//  FuturesPass
//
//  Created by mac on 2019/6/1.
//  Copyright © 2019 FuturesPass. All rights reserved.
//

#import "HeardView.h"

@implementation HeardView

+(UIView*)GetHeardViewsFrame:(CGRect)frame title:(NSString *)title BtnText:(NSString *)text actions:(void (^)(void))Actions{
    
    UIView * views = [[UIView alloc] initWithFrame:frame];
    views.backgroundColor = ColorWhite;
    
    
    UILabel * lab = [myLabel labelWithframe:CGRectZero backgroundColor:appColors title:@"" font:16 Alignment:NSTextAlignmentLeft textColor:appColors];
    [views addSubview:lab];
    lab.layer.cornerRadius = 2;
    lab.layer.masksToBounds = YES;
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(views.mas_left).mas_offset(20);
        make.top.equalTo(views.mas_top).mas_offset(8);
        make.bottom.equalTo(views.mas_bottom).mas_offset(-8);
        make.width.mas_offset(4);
        
    }];
    
    UILabel * label = [myLabel labelWithframe:CGRectZero backgroundColor:ColorWhite title:title font:16 Alignment:NSTextAlignmentLeft textColor:Colorblack];
    [views addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lab.mas_left).mas_offset(8);
        make.centerY.equalTo(views.mas_centerY);
    }];
    
    
    //button 更多
    UIButton * gengduo = [myButton buttonWithType:UIButtonTypeCustom frame:CGRectZero title:text colors:ColorOrange andBackground:ColorClear tag:23232 andBlock:^(myButton *button) {
        Actions();
    }];
    gengduo.titleLabel.font = UiFontIPH(28);
    [views addSubview:gengduo];
    
    [gengduo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(views.mas_right).mas_offset(-30);
        make.centerY.equalTo(views.mas_centerY);
//        make.width.mas_offset(110);
    }];
    
    return views;
}



///添加 标题按钮。整体可以点击
+(UIView*)GetHeaderOneViewsWidth:(CGFloat)top tag:(NSInteger)tag title:(NSString*)title actions:(void(^)(NSInteger))Actions{
    
    UIView * views = [[UIView alloc] initWithFrame:CGRectMake(0, top, ScreenWidth, 40)];
    views.backgroundColor = ColorWhite;
    
    
    UILabel * lab = [myLabel labelWithframe:CGRectZero backgroundColor:appColors title:@"" font:16 Alignment:NSTextAlignmentLeft textColor:appColors];
    [views addSubview:lab];
    lab.layer.cornerRadius = 3;
    lab.layer.masksToBounds = YES;
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(views.mas_left).mas_offset(20);
        make.centerY.equalTo(views.mas_centerY);
        make.width.mas_offset(6);
        make.height.mas_offset(6);
        
    }];
    
    UILabel * label = [myLabel labelWithframe:CGRectZero backgroundColor:ColorWhite title:title font:16 Alignment:NSTextAlignmentLeft textColor:Colorblack];
    [views addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lab.mas_left).mas_offset(8);
        make.centerY.equalTo(views.mas_centerY);
    }];
    
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageview.image = UIimageName(@"goin");
    [views addSubview:imageview];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(views.mas_right).mas_offset(-30);
        make.centerY.equalTo(views.mas_centerY);
        //        make.width.mas_offset(110);
    }];
    
    
    //button 更多
    UIButton * action = [myButton buttonWithType:UIButtonTypeCustom frame:views.bounds title:@"" colors:ColorOrange andBackground:ColorClear tag:23232 andBlock:^(myButton *button) {
        Actions(button.tag);
    }];
    action.tag = tag;
    [views addSubview:action];
    
    UILabel * labeline =[[UILabel alloc] initWithFrame:CGRectMake(0, views.height-1, views.width, 1)];
    labeline.backgroundColor = ColorCellLine;
    [views addSubview:labeline];
    
    return views;
    
    
}

///返回一个进度条样式
+(UIView*)getProgressBarTop:(CGFloat)top with:(CGFloat)floats height:(CGFloat)height{
    
    UIView * views = [[UIView alloc] initWithFrame:CGRectMake(0, top, ScreenWidth, height)];
    views.backgroundColor = ColorCellLine;
    
    UILabel * labelgray = [[UILabel alloc] initWithFrame:CGRectMake(20, height-18, ScreenWidth-40, 15)];
    labelgray.backgroundColor = ColorGrayQian;
    XViewRadius(labelgray, labelgray.height/2);
    [views addSubview:labelgray];
    
    UILabel * labelred = [[UILabel alloc] initWithFrame:CGRectMake(20, height-18, (ScreenWidth-40)*floats, 15)];
    labelred.backgroundColor = ColorOrange;
    XViewRadius(labelred, labelred.height/2);
    [views addSubview:labelred];
    
    return views;
    
}
@end
