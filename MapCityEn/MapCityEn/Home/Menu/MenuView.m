//
//  MenuView.m
//  MenuDemo
//


// 获得屏幕尺寸
#define kSCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height


#define CoverViewAlpha                  0.3
#define slideLine  0.3
#define CoverViewBackGround [UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0]

#import "MenuView.h"

static NSInteger left1Right0;
@interface MenuView ()
{
    CGFloat Place;
}
@property (nonatomic ,assign)CGRect         menuViewframe;
@property (nonatomic ,assign)CGRect         coverViewframe;
@property (nonatomic ,strong)UIView         *coverView;
@property (nonatomic ,strong)UIView         *leftMenuView;

@property (nonatomic ,assign)BOOL           isShowCoverView;;

@end


@implementation MenuView



+(instancetype)MenuViewWithDependencyView:(UIView *)dependencyView rightView:(UIView *)right  MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover{
    
    MenuView *menu = [[MenuView alloc]initWithDependencyView:dependencyView rightView:right  MenuView:leftmenuView isShowCoverView:isCover];
    
    return menu;
}


-(instancetype)initWithDependencyView:(UIView *)dependencyView rightView:(UIView *)right MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover{
    
    if(self = [super init]){
        self.isShowCoverView = isCover;

        [self addPanGestureAtDependencyView:dependencyView];
        self.leftMenuView = leftmenuView;
        self.menuViewframe = leftmenuView.frame;
        self.coverViewframe = CGRectMake(self.menuViewframe.size.width, self.menuViewframe.origin.y, kSCREEN_WIDTH - self.menuViewframe.size.width, self.menuViewframe.size.height);
        
        //拖动开关
        [[NSNotificationCenter defaultCenter] removeObserver:@"onOffisON"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOffisON:) name:@"onOffisON" object:nil];
        //关
        [[NSNotificationCenter defaultCenter] removeObserver:@"onOffisOFF"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOffisOFF:) name:@"onOffisOFF" object:nil];
        
        [[NSNotificationCenter defaultCenter] removeObserver:@"onOffis"];
        //coverTap 跳界面。 隐藏菜单
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coverTap) name:@"onOffis" object:nil];
        
    }
    return self;
}

-(void)setIsShowCoverView:(BOOL)isShowCoverView
{
    _isShowCoverView = isShowCoverView;

    if(self.isShowCoverView){
        self.coverView.backgroundColor = CoverViewBackGround;
    }else{
        self.coverView.backgroundColor = [UIColor clearColor];
    }

}

-(void)addPanGestureAtDependencyView:(UIView *)dependencyView{
    
//    // 屏幕边缘pan手势(优先级高于其他手势)
//    UIScreenEdgePanGestureRecognizer *leftEdgeGesture = \
//    [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
//                                                      action:@selector(handleLeftEdgeGesture:)];
//    leftEdgeGesture.edges                             = UIRectEdgeLeft;// 屏幕左侧边缘响应
//    [dependencyView addGestureRecognizer:leftEdgeGesture]; //
    
}

//-(void)initView{

//    if(self.isShowCoverView){
//        self.coverView.backgroundColor = CoverViewBackGround;
//    }else{
//        self.coverView.backgroundColor = [UIColor clearColor];
//    }
//    
//    [self setBackgroundColor:[UIColor clearColor]];
//    [self.leftMenuView setBackgroundColor:MenuViewBackgroundColor];
//}


-(void)show{
    
    left1Right0=1;
    
    
    [[UIViewPopAlert xjh_getCurrentViewController].view addSubview:self.coverView];
    [[UIViewPopAlert xjh_getCurrentViewController].view addSubview:self.leftMenuView];
    
    self.leftMenuView.frame = CGRectMake(-self.menuViewframe.size.width, self.menuViewframe.origin.y, self.menuViewframe.size.width, self.menuViewframe.size.height);
    self.coverView.frame = CGRectMake(0, 0, kSCREEN_WIDTH, self.menuViewframe.size.height);
 
    [UIView animateWithDuration:0.3 animations:^{
        
        self.leftMenuView.frame = self.menuViewframe;
        self.coverViewframe = CGRectMake(self.menuViewframe.size.width, self.menuViewframe.origin.y, kSCREEN_WIDTH - self.menuViewframe.size.width, self.menuViewframe.size.height);
        self.coverView.frame    = self.coverViewframe;
        self.coverView.alpha = CoverViewAlpha;
    }];
    
    
}



-(void)hidenWithoutAnimation{
    
    [self removeCoverAndMenuView];
}

-(void)hidenWithAnimation{
    
    [self coverTap];
    
}


#pragma mark - 屏幕左侧菜单
-(UIView *)leftMenuView{
    
    if(_leftMenuView == nil){
        
        UIView *LeftView = [[UIView alloc]initWithFrame:self.menuViewframe];
        _leftMenuView    = LeftView;
        
    }
    return _leftMenuView;
}

#pragma mark - 遮盖
-(UIView *)coverView {
    
    if (_coverView == nil) {
        
        UIView *Cover = [[UIView alloc]initWithFrame:self.coverViewframe];
        Cover.backgroundColor                     = CoverViewBackGround;
        Cover.alpha                               = 0;
        UITapGestureRecognizer *Click             = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(coverTap)];
        [Cover addGestureRecognizer:Click];
        
        UIGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(handleftPan:)];
        
        [Cover addGestureRecognizer:panGestureRecognizer];
        [Click requireGestureRecognizerToFail:panGestureRecognizer];
        
        _coverView = Cover;
    }
    return _coverView;
}

#pragma mark - coverView滑隐藏
-(void)handleftPan:(UIPanGestureRecognizer*)recognizer{
   
    CGPoint translation = [recognizer translationInView:recognizer.view];
    static CGFloat BeganX;
    
    if(UIGestureRecognizerStateBegan == recognizer.state){
        BeganX = translation.x;
    }
    
    Place = (-translation.x) - (-BeganX);
    
    if(UIGestureRecognizerStateBegan == recognizer.state ||
       UIGestureRecognizerStateChanged == recognizer.state){

//        CGFloat x           = 0 ;
//        CGFloat y           = self.menuViewframe.origin.y;
        CGFloat w           = self.menuViewframe.size.width;
        CGFloat h           = self.menuViewframe.size.height;

        if(Place <= self.leftMenuView.frame.size.width &&  Place >0){
            //左滑的动效果
//            x  = 0 - Place;

            if (left1Right0) {
                self.leftMenuView.frame = CGRectMake(-Place, 0,self.leftMenuView.frame.size.width, h);
                self.coverView.frame = CGRectMake(w-Place, 0,w+Place, h);
                
                self.coverView.alpha    = CoverViewAlpha*((w - Place) / w);
                NSLog(@"111111");
 
            }
          
        }else if(Place >0){

//             x  = - self.menuViewframe.size.width;

             NSLog(@"22222");
        }else{
            
            //右滑的动效果
            
//            x = Place;
            
//            if (!left1Right0) {
//                self.rightMenuView.frame =CGRectMake(IPHONEWIDTH(268)-Place, self.menuViewframe.origin.y, IPHONEWIDTH(RightMenuWidth), self.menuViewframe.size.height);
//
//                self.coverView.frame    = CGRectMake(0, 0,w-Place, h);;
//                self.coverView.alpha    = CoverViewAlpha*((w + Place) / w);
//                 NSLog(@"333333");
//            }
            
        }



        
    }else{
       
        //  zuo结束
        if (left1Right0==1) {
            if(Place > self.menuViewframe.size.width*slideLine   ){
                // 收起设置
                [self closeMenuView];
                
                
            }else{
                // 展开设置
                [self openMenuView];
            }
        }
       
        
        //右结束
        if (left1Right0==0) {
            if(-Place > self.menuViewframe.size.width*slideLine   ){
                // 收起设置
                [self closeMenuView];
                
            }else{
                // 展开设置
                [self openMenuView];
            }
        }
        
    }
    
}


-(void)openMenuView{
    
    [UIView animateWithDuration:0.3 animations:^{
        CGFloat x           = 0;
        CGFloat y           = self.menuViewframe.origin.y;
        CGFloat w           = self.menuViewframe.size.width;
        CGFloat h           = self.menuViewframe.size.height;
        self.leftMenuView.frame = CGRectMake(x, y, w, h);
//        self.rightMenuView.frame =CGRectMake(IPHONEWIDTH(268), y, IPHONEWIDTH(RightMenuWidth), h);
        self.coverView.frame    = self.coverViewframe;
        self.coverView.alpha    = CoverViewAlpha;
    }];
}

-(void)closeMenuView{
    CGFloat x           = -self.menuViewframe.size.width;
    CGFloat y           = self.menuViewframe.origin.y;
    CGFloat w           = self.menuViewframe.size.width;
    CGFloat h           = self.menuViewframe.size.height;

    
    [UIView animateWithDuration:0.2 animations:^{
        
       self.leftMenuView.frame = CGRectMake(x, y, w, h);//self.LeftViewFrame;
        self.coverView.frame    = CGRectMake(0, 0,kSCREEN_WIDTH, self.menuViewframe.size.height);
//        self.rightMenuView.frame = CGRectMake(-x*1.8, y, IPHONEWIDTH(RightMenuWidth), h);
        self.coverView.alpha    = 0;
    } completion:^(BOOL finished) {
        [self removeCoverAndMenuView];
    }];
}



#pragma mark - 点击遮盖移除
-(void)coverTap{


    [UIView animateWithDuration:0.3 animations:^{
        
        CGFloat x           = -self.menuViewframe.size.width;
        CGFloat y           = self.menuViewframe.origin.y;
        CGFloat w           = self.menuViewframe.size.width;
        CGFloat h           = self.menuViewframe.size.height;
        
        self.leftMenuView.frame = CGRectMake(x, y, w, h);//self.LeftViewFrame;
        self.coverView.frame    = CGRectMake(0, 0,kSCREEN_WIDTH, self.menuViewframe.size.height);
//        self.rightMenuView.frame = CGRectMake(-x*1.8, y, IPHONEWIDTH(RightMenuWidth), h);
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeCoverAndMenuView];
    }];
    
}





#pragma mark - 移除菜单和遮盖
-(void)removeCoverAndMenuView{
    
    self.leftMenuView.frame = CGRectMake(-self.leftMenuView.frame.size.width, 0, self.leftMenuView.frame.size.width, kSCREEN_HEIGHT);
    
//    self.rightMenuView.frame = CGRectMake(self.rightMenuView.frame.size.width, 0, IPHONEWIDTH(RightMenuWidth), kSCREEN_HEIGHT);
    
    
    
    self.coverView.frame    = CGRectMake(0, 0,kSCREEN_WIDTH, kSCREEN_HEIGHT);
    self.coverView.alpha    = 0.0;
    
    
    [self.coverView removeFromSuperview];
    [self.leftMenuView removeFromSuperview];
    
}
#pragma mark 接收通知方法
-(void)onOffisON:(NSNotification*)notification{
    
    CGFloat Place = [notification.object floatValue];
    [self MethodTocalulate:Place];
    
}

//滑动结束通知
-(void)onOffisOFF:(NSNotification*)notification{
    CGFloat Place = [notification.object floatValue];
    [self ENDMethodTocalulate:Place];
}
-(void)MethodTocalulate:(CGFloat)Place{
//    CGFloat x           = 0 ;
//    CGFloat y           = self.menuViewframe.origin.y;
    CGFloat w           = self.menuViewframe.size.width;
    CGFloat h           = self.menuViewframe.size.height;
    
    if(Place <= self.leftMenuView.frame.size.width &&  Place >0){
        //左滑的动效果
//        x  = 0 - Place;
        
        if (left1Right0) {
            self.leftMenuView.frame = CGRectMake(-Place, 0,self.leftMenuView.frame.size.width, h);
            self.coverView.frame = CGRectMake(w-Place, 0,w+Place, h);
            
            self.coverView.alpha    = CoverViewAlpha*((w - Place) / w);
            NSLog(@"111111");
            
        }
        
    }else if(Place >0){
        
//        x  = - self.menuViewframe.size.width;
        
        NSLog(@"22222");
    }else{
        
        //右滑的动效果
        
//        x = Place;
        
        if (!left1Right0) {
//            self.rightMenuView.frame =CGRectMake(IPHONEWIDTH(268)-Place, self.menuViewframe.origin.y, IPHONEWIDTH(RightMenuWidth), self.menuViewframe.size.height);
            
            self.coverView.frame    = CGRectMake(0, 0,w-Place, h);;
            self.coverView.alpha    = CoverViewAlpha*((w + Place) / w);
            NSLog(@"333333");
        }
        
    }

}


-(void)ENDMethodTocalulate:(CGFloat)Place{
    
    //  zuo结束
    if (left1Right0==1) {
        if(Place > self.menuViewframe.size.width*slideLine  ){
            // 收起设置
            [self closeMenuView];
            
            
        }else{
            // 展开设置
            [self openMenuView];
        }
    }
    
    
    //右结束
    if (left1Right0==0) {
        if(-Place > self.menuViewframe.size.width*slideLine   ){
            // 收起设置
            [self closeMenuView];
            
        }else{
            // 展开设置
            [self openMenuView];
        }
    }
}
@end
