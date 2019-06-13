//
//  ItemTwoCollectionViewCell.h
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "markerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ItemTwoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeBailabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabe;

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property(nonatomic,strong) markerModel * market_model ;
@end

NS_ASSUME_NONNULL_END
