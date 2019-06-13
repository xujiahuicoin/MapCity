//
//  indexTableViewCell.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "markerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface indexTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelCode;
@property (weak, nonatomic) IBOutlet UILabel *labelChangeBai;

@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelChangePrice;

@property(nonatomic,strong) markerModel * market_model ;

@property (weak, nonatomic) IBOutlet UILabel *LabelRanking;

@end

NS_ASSUME_NONNULL_END
