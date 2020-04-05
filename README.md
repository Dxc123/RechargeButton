# RechargeButton
内购充值选择按钮
 ///使用：
 
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
    
