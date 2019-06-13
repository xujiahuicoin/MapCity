//
//  ItemOneCollectionViewCell.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "ItemOneCollectionViewCell.h"

@implementation ItemOneCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setArray:(NSArray *)array{
    
    _backImageV.image = UIimageName(array[0]);
    _labelTitle.text = array[1];
    
}
@end
