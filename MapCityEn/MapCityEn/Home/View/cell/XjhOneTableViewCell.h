//
//  XjhOneTableViewCell.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "markerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface XjhOneTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel * nameLabel ;
@property(nonatomic,strong) UILabel * codeLabel;
@property(nonatomic,strong) UILabel * priceLabel;
@property(nonatomic,strong) UILabel * changeBaiLabel;

@property(nonatomic,strong) markerModel * market_model ;
@end

NS_ASSUME_NONNULL_END
