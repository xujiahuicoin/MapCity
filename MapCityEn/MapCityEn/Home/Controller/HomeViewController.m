//
//  HomeViewController.m
//  BaseProject
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019 xujiahui. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuView.h"
#import "LeftView.h"
@interface HomeViewController ()
@property(nonatomic,strong)MenuView * menuview;
@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitleSting = StrHome;
    self.isHiddenShadow = YES;
    
    [self setUIview];
}
-(void)setUIview{
    
    //左滑菜单
   LeftView * leftview = [[LeftView alloc]initWithFrame:CGRectMake(0, 0, IPHONEWIDTH(LeftMenuWidth),ScreenHeight)];
//    leftview.delegate = self;
     self.menuview = [[MenuView alloc]initWithDependencyView:self.view  rightView:nil MenuView:leftview isShowCoverView:YES];
    
    //左上角按钮
    self.isHiddenBackButton = NO;
    [self.backButton setImage:UIimageName(@"menu") forState:UIControlStateNormal];
    
}
//
-(void)clickBackButton{
    
    [self.menuview show];
    
}
@end
