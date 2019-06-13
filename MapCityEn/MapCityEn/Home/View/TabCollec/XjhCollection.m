//
//  XjhCollection.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XjhCollection.h"
#import "ItemTwoCollectionViewCell.h"
#import "ItemOneCollectionViewCell.h"
@interface XjhCollection ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,copy) NSArray * dataMArray ;
@property(nonatomic,assign)ClickTypeEnum types;
@end

@implementation XjhCollection

-(instancetype)initWithViewFrame:(CGRect)frame scrollDirectionVerTical:(BOOL)Vertical
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if (self == [super initWithFrame:frame collectionViewLayout:layout]) {
        
        if (Vertical) {
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
        [self configUi];
    }
    return self;
}
-(void)configUi
{
    self.delegate = self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = ColorWhite;

    //注册
    [self registerNib:[UINib nibWithNibName:@"ItemOneCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"item1"];
    
    [self registerNib:[UINib nibWithNibName:@"ItemTwoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"item2"];
    
}


-(void)UpDateCollectionViewWithType:(ClickTypeEnum)clickType array:(NSArray *)array{
  
    _types = clickType;
    
    self.dataMArray = [NSArray arrayWithArray:array];
    
    [self reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataMArray.count;
}
//-(NSInteger)numberOfItemsInSection:(NSInteger)section{
//    return _dataMArray.count>0? 1 : 0;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (_types==ClickTypeHomeIndex) {
//        ItemTwoCollectionViewCell * item2 =[collectionView dequeueReusableCellWithReuseIdentifier:@"item2" forIndexPath:indexPath];
//        item2.market_model = _dataMArray[indexPath.row];
//        return item2;
//    }
//
//
//    ItemOneCollectionViewCell * item1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"item1" forIndexPath:indexPath];
//
//
//    return item1;
//}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
  
    
    return CGSizeMake(100, 80);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self.xjhDelegate XjhClickTypeSelecterWithIndex:_types index:indexPath.row marketModel:_dataMArray[indexPath.row]];
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return  UIEdgeInsetsMake(3, 3, 1, 1);
}


@end
