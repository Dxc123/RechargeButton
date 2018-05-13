//
//  ViewController.m
//  RechargeButton
//
//  Created by Dxc_iOS on 2018/5/13.
//  Copyright © 2018年 代星创. All rights reserved.
//

#import "ViewController.h"
#import "RechargeView.h"
#import "RechargeBtnCell.h"
#import "Masonry.h"
@interface ViewController ()
<BtnCollectionViewDelegate>
@property (nonatomic, strong)RechargeView *rechargeView;
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
    _rechargeView = [[RechargeView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, 220)];
    [self.view addSubview:_rechargeView];
    
    _rechargeView.celltitles = @[@"60", @"300", @"680", @"1280", @"3280", @"6480",@"12480",@"25980"];
    _rechargeView.cellsubtitles = @[@"6", @"30", @"68", @"128", @"328", @"648",@"1248",@"2598"];
    _rechargeView.delegate = self;
    
    _rechargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_rechargeBtn];
    _rechargeBtn.layer.cornerRadius = 3.0;
    _rechargeBtn.clipsToBounds = YES;
    _rechargeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [_rechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _rechargeBtn.backgroundColor = [UIColor redColor];;
    [_rechargeBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    
    [_rechargeBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.view).offset(30);
    make.right.mas_equalTo(self.view).offset(-30);
    make.bottom.mas_equalTo(self.rechargeView.mas_bottom).offset(100);
    make.height.mas_equalTo(40);
        
    }];
   
    
    
}
#pragma mark - 点击事件
-(void)sureBtnClick:(UIButton *)btn{
    NSLog(@"充值");

}
#pragma mar --BtnCollectionViewDelegate
-(void)didSelectItemWith:(NSInteger)tag{
    NSLog(@"点击了%ld",(long)tag);
    
}
-(void)didDeselectItemWith:(NSInteger)tag{
    NSLog(@"取消点击了%ld",(long)tag);

}

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
