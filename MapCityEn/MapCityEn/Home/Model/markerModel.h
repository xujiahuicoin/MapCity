//
//  markerModel.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface markerModel : NSObject
///代码
@property(nonatomic,copy) NSString * code;
///name
@property(nonatomic,copy) NSString * name;
///价格
@property(nonatomic,copy) NSString * price;
///涨跌幅%
@property(nonatomic,copy) NSString * priceChangeBai;
@property(nonatomic,copy) NSString * ChangeBai;
///价格变化
@property(nonatomic,copy) NSString * priceChange;
///最高价
@property(nonatomic,copy) NSString * highPrice;
///最低价
@property(nonatomic,copy) NSString * lowPrice;
///交易量
@property(nonatomic,copy) NSString * volumePrice;
///交易数量
@property(nonatomic,copy) NSString * amountNum;

///根据数组 转化成 marketModel数据
+(markerModel*)XjhChangeModelWIthApi51Array:(NSArray*)array_model;

///数据转化 double 转保留两位小数的string
+(NSString*)XjhChangeDoubleToString:(NSString*)dou;
@end


