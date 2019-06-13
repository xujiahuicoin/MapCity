
#import "UIMainConstructor.h"
#import "HomeViewController.h"

static const NSArray *imageNames;
static const NSArray *selectedImageNames;
static UIMainConstructor *constructor;

@interface UIMainConstructor ()<UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBarController;

//@property (nonatomic, assign) BOOL isShowBar;
@end

@implementation UIMainConstructor


+ (instancetype)sharedUIConstructor {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        constructor = [[UIMainConstructor alloc] init];
        
        
    });
    return constructor;
}


- (instancetype)init
{
    if (self = [super init])
    {
        if (!imageNames) {
            
            imageNames = @[@"tab_5",
                           @"tab_6",
                           @"tab_7",
                           @"tab_8"
                           ];
        }
        
        if (!selectedImageNames) {
            selectedImageNames = @[@"tab_1",
                                   @"tab_2",
                                   @"tab_3",
                                   @"tab_4"
                                   ];
        }
        
        
      
    }
    return self;
}


- (UITabBarController *)constructUI
{
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    [self setupViewControllers];
 
    return self.tabBarController;
}

//设置UI层次结构
- (void)setupViewControllers
{
    // 主页
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    homeVc.title = @"首页";
    homeVc.hidesBottomBarWhenPushed = NO;
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVc];

   
    //tabbar
    self.tabBarController.viewControllers = @[
                                              homeNC,
                                             
                                             ];

    
    [self.tabBarController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        UIImage *image = [UIImage imageNamed:imageNames[idx]];
        UIImage *imageSelected = [UIImage imageNamed:selectedImageNames[idx]];
        item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
    
    self.tabBarController.tabBar.backgroundColor = HexColor(0xFFFFFF);
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexColor(0x666666),
                                                        NSFontAttributeName:[UIFont systemFontOfSize:13]
                                                        } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexColor(0x000000)} forState:UIControlStateSelected];
    [UITabBarItem appearance].titlePositionAdjustment = UIOffsetMake(0, -2.0f);
}

@end
