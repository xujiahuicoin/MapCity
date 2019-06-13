

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSYBaseView : UIView
/* 标识符 */
@property (readonly, strong, nonatomic) NSString *identifier;

/**
 初始化
 
 @param frame 尺寸
 @param identifier 标识符
 */
- (instancetype)initWithFrame:(CGRect)frame identifier:(NSString *)identifier NS_REQUIRES_SUPER;

/**
 刷新列表的基类方法
 */
- (void)reloadNewData NS_REQUIRES_SUPER;

/**
 更新id
 
 @param identifier 标识符
 */
- (void)updateIdentifier:(NSString *)identifier NS_REQUIRES_SUPER;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
