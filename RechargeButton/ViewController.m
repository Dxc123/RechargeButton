//
//  ViewController.m
//  RechargeButton
//
//  Created by Dxc_iOS on 2018/5/13.
//  Copyright © 2018年 代星创. All rights reserved.
//

#import "ViewController.h"
#import "RechargeCollectionView.h"

#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong)RechargeCollectionView *rechargeView;
@property (nonatomic, strong) UIButton *rechargeBtn;//充值按钮
@property (nonatomic, strong) NSString *moneyNum;
@property (nonatomic, strong) NSString *moneyID;
@property (nonatomic, strong) NSArray *moneyNumArry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor]; ;
    
    ///选择充值数额
    _rechargeView = [[RechargeCollectionView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, 400)];
    [self.view addSubview:_rechargeView];
    
    _rechargeView.celltitles = @[@"60", @"300", @"680", @"1280", @"3280", @"6480",@"12480",@"25980"];
    _rechargeView.cellsubtitles = @[@"6", @"30", @"68", @"128", @"328", @"648",@"1248",@"2598"];
    _rechargeView.selectIndex  = @"0";
    _rechargeView.SelectBlock = ^(NSInteger index) {
        NSLog(@"点击%ld",(long)index);
    };
    _rechargeView.RechargeBlock = ^(NSInteger index) {
        NSLog(@"点击充值");
    };
    

   
    
    
}

#pragma mar --BtnCollectionViewDelegate
//-(void)didSelectItemWith:(NSInteger)tag{
//    NSLog(@"点击了%ld",(long)tag);
//
//}
//-(void)didDeselectItemWith:(NSInteger)tag{
//    NSLog(@"取消点击了%ld",(long)tag);
//
//}

#pragma mark - 懒加载
- (NSArray *)moneyNumArry {
    if (!_moneyNumArry) {
        _moneyNumArry = [NSArray array];
    }
    return _moneyNumArry;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
