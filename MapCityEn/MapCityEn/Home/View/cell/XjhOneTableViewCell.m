//
//  XjhOneTableViewCell.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XjhOneTableViewCell.h"

@implementation XjhOneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
        
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.codeLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.changeBaiLabel];
        [self setSizeUi];
    }
    
    return self;
}

- (void)setMarket_model:(markerModel *)market_model{
    
    _nameLabel.text = market_model.name;
    _codeLabel.text = market_model.code;
    _priceLabel.text = market_model.price;
    _changeBaiLabel.text = market_model.priceChangeBai;
    _changeBaiLabel.layer.cornerRadius = 8;
    _changeBaiLabel.layer.masksToBounds = YES;
    
    
    if ([market_model.priceChangeBai containsString:@"-"]) {
        _changeBaiLabel.backgroundColor = ColorGreenHui;
    }else if ([market_model.priceChangeBai containsString:@"+"]){
        _changeBaiLabel.backgroundColor = CollorRedHui;
    }else{
        _changeBaiLabel.backgroundColor = ColorLightGray;
    }
    
}

-(void)setSizeUi{
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.top.equalTo(self.mas_top).mas_offset(10);
    }];
    
    [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.bottom.equalTo(self.mas_bottom).mas_offset(-10);
    }];
    
  
    
    [_changeBaiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).mas_offset(-15);
        make.width.mas_offset(60);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        
    }];
    
}

-(UILabel*)nameLabel{
    
    if (!_nameLabel) {
        _nameLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorWhite title:@"" font:13 Alignment:NSTextAlignmentLeft textColor:Colorblack];
    }
    return _nameLabel;
    
}

-(UILabel*)codeLabel{
    if (!_codeLabel) {
        _codeLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorWhite title:@"" font:12 Alignment:NSTextAlignmentLeft textColor:Colorgray];
    }
    return _codeLabel;
}

-(UILabel*)priceLabel{
    
    if (!_priceLabel) {
        
        _priceLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorWhite title:@"" font:14 Alignment:NSTextAlignmentCenter textColor:appColors ];
    }
    return _priceLabel;
}

-(UILabel*)changeBaiLabel{
    
    if (!_changeBaiLabel) {
        _changeBaiLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorLightGray title:@"" font:13 Alignment:NSTextAlignmentCenter textColor:ColorWhite];
    }
    
    return _changeBaiLabel;
}

@end
