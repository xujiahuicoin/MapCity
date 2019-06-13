
#import "XSYBaseView.h"

@interface XSYBaseView()

/* 标识符 */
@property (readwrite, strong, nonatomic) NSString *identifier;
@end
@implementation XSYBaseView

- (instancetype)initWithFrame:(CGRect)frame identifier:(NSString *)identifier  {
    if (self = [super initWithFrame:frame]) {
        
        self.identifier = STRINGNOTNIL(identifier);
    }
    return self;
}

/**
 更新id
 
 @param identifier 标识符
 */
- (void)updateIdentifier:(NSString *)identifier {
    
    if (!isStrEmpty(identifier)) {
        self.identifier = identifier;
    }
}

- (void)reloadNewData {
    
}



@end
