//
//  markerModel.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "markerModel.h"

@implementation markerModel

/*
  code;
  name;
  price;
  priceChangeBai
  priceChange;
  highPrice;
  lowPrice;
  volumePrice;
  amountNum;
 
 */

///根据数组 转化成 marketModel数据
+(markerModel*)XjhChangeModelWIthApi51Array:(NSArray*)array_model{
    
    markerModel * model = [[markerModel alloc] init];
    if (array_model.count<4) {
        return model;
    }
    
    model.code = array_model[0];
    model.name = array_model[1];
    
    model.price = [self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model[2]]];
    
    NSString * chagnebai = [self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model[3]]];;
    model.priceChangeBai = [NSString stringWithFormat:@"%@%%",chagnebai];
    model.ChangeBai = chagnebai;
    model.priceChange =[self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model.count>4?array_model[4]:@""]];
    
    model.highPrice =[self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model.count>5?array_model[5]:@""]];
    
    model.lowPrice = [self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model.count>6?array_model[6]:@""]];
    
    model.volumePrice = [self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model.count>7?array_model[7]:@""]];
    
    model.amountNum = [self XjhChangeDoubleToString:[NSString stringWithFormat:@"%@",array_model.count>8?array_model[8]:@""]];
    
    
    return model;
}

///数据转化 double 转保留两位小数的string
+(NSString*)XjhChangeDoubleToString:(NSString*)dou{
  
    double doul = [dou doubleValue];
    if (doul>0) {
        return [NSString stringWithFormat:@"%0.2f",doul];
    }
    return @"";
    
}
@end
