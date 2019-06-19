//
//  XjhTableView.m
//  FuturesPassTwo
//
//  Created by mac on 2019/6/4.
//  Copyright © 2019 FuturesPassTwo. All rights reserved.
//

#import "XjhTableView.h"

@interface XjhTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy) NSArray * DataMArray ;
@property(nonatomic,assign)ClickTypeEnum types;
@property(nonatomic,assign)CGFloat heightCell;
@property(nonatomic,strong) MJRefreshNormalHeader * header ;
@end

@implementation XjhTableView

-(instancetype)initWithCustomFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
        self.DataMArray = [NSMutableArray array];
        self.heightCell = 0.01;
        self.delegate = self;
        self.dataSource = self;
         _header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadUpdateData)];
        self.mj_header = _header;
        [self registerNib:[UINib nibWithNibName:@"indexTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellx"];
    }
    
    return self;
}

-(void)reloadUpdateData{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:[NSString stringWithFormat:@"%@%lu",fixString,(unsigned long)_types] object:nil];
}

-(void)UpDateTalbeViewWithType:(ClickTypeEnum)clickType array:(NSArray *)array{
    _types = clickType;
    _DataMArray = [NSArray arrayWithArray:array];
    [self.mj_header endRefreshing];
    
     _heightCell = 70;
    [self reloadData];
}

//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (_types == ClickTypeHomeMarket) {
//        indexTableViewCell * cellx = [tableView dequeueReusableCellWithIdentifier:@"cellx"];
//        if (!cellx) {
//            cellx = [[indexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
//        }
//        
//        cellx.market_model = _DataMArray[indexPath.row];
//        return cellx;
//    }
//    XjhOneTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
//    
//    if (!cell1) {
//        cell1 = [[XjhOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
//        
//    }
//    cell1.market_model = _DataMArray[indexPath.row];
//    
//    return cell1;
//    
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    if (_types == ClickTypeHomeIndexMore) {
    
        [self.xjhDelegate XjhClickTypeSelecterWithIndex:_types index:indexPath.row marketModel:_DataMArray[indexPath.row]];
        
//    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _heightCell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [UIView new];
    view.backgroundColor = ColorbackGround;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _DataMArray.count;
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return  1;
}

@end
