//
//  ItemTwoCollectionViewCell.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "ItemTwoCollectionViewCell.h"

@implementation ItemTwoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setMarket_model:(markerModel *)market_model{
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.backgroundColor = ColorbackGround;
    _nameLabel.text = market_model.name;
    _priceLabel.text = market_model.price;
    _changeBailabel.text = market_model.priceChangeBai;
    _codeLabe.text = market_model.code;
    
    
    if ([market_model.priceChangeBai containsString:@"-"]) {
        _changeBailabel.textColor = [UIColor greenColor];
    }else if ([market_model.priceChangeBai containsString:@"+"]){
        _changeBailabel.textColor = [UIColor redColor];
    }else{
        _changeBailabel.textColor = ColorWhite;
    }
}

@end
