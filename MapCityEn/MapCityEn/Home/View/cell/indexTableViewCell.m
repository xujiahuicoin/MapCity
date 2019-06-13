//
//  indexTableViewCell.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "indexTableViewCell.h"

@implementation indexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setMarket_model:(markerModel *)market_model{
    
    _labelName.text = market_model.name;
    _labelCode.text = market_model.code;
    _labelPrice.text = market_model.price;
    _labelChangeBai.text = [NSString stringWithFormat:@"%@",market_model.priceChangeBai];
    _labelChangePrice.text = market_model.priceChange;
    
    if ([market_model.priceChangeBai containsString:@"-"]) {
        [self changeColorWithType:1];
    }else if ([market_model.priceChangeBai containsString:@"+"]){
         [self changeColorWithType:2];
    }else{
         [self changeColorWithType:3];
    }
   
}
-(void)changeColorWithType:(int)type{
    //1 fu  2zhang 3 ping
    
    UIColor * color = Colorgray;
    
    if (type==1) {
        
        color = ColorGreenHui;
    }else if (type==2){
        color = CollorRedHui;
    }
    
    _labelChangePrice.textColor =color;
    _labelChangeBai.textColor = color;
//    _labelPrice.textColor = color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
