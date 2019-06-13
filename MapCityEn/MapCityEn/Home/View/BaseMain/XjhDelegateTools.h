//
//  XjhDelegateTools.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XjhDelegateTools <NSObject>


@end

@protocol XjhClickTypeDelegate <NSObject>

-(void)XjhClickTypeSelecterWithIndex:(ClickTypeEnum)clickType index:(NSInteger)index marketModel:(id)model;

@end
