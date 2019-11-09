# RechargeButton
内购充值选择按钮
 ///使用：
    _rechargeView = [[RechargeView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, 220)];
    
    _rechargeView.celltitles = @[@"60", @"300", @"680", @"1280", @"3280", @"6480",@"12480",@"25980"];
    _rechargeView.cellsubtitles = @[@"6", @"30", @"68", @"128", @"328", @"648",@"1248",@"2598"];
    _rechargeView.delegate = self;
    _rechargeView.selectIndex  = @"0";
    [self.view addSubview:_rechargeView];
