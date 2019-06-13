

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIMainConstructor : NSObject

+ (instancetype)sharedUIConstructor;
/**
 *  构建APP的UI层次结构
 *
 *  @return UITabBarController
 */
- (UITabBarController *)constructUI;

@end
