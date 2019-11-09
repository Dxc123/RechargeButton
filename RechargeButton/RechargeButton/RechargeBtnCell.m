//
//  RechargeBtnCell.m
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import "RechargeBtnCell.h"
#import "Masonry.h"
@interface RechargeBtnCell ()

@end
@implementation RechargeBtnCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.contentView.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 6.0f;
        self.layer.masksToBounds = YES;
        
        _lable = [[UILabel alloc]init];
        [self.contentView addSubview:_lable];
        _lable.font = [UIFont systemFontOfSize:16];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.textColor = [UIColor blackColor];
        
        _selectedImg = [[UIImageView alloc] init];
       [self.contentView addSubview:_selectedImg];
        
        
        
        _sublable = [[UILabel alloc]init];
        [self.contentView addSubview:_sublable];
        _sublable.font = [UIFont systemFontOfSize:13];
        _sublable.textAlignment = NSTextAlignmentCenter;
        _sublable.textColor = [UIColor grayColor];
    }
    return self;
}

-(void)layoutSubviews{
    [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(30);
        
    }];
    [_selectedImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(0);
        make.top.mas_equalTo(self).offset(5);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    
    
    [_sublable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.lable.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
    }];
}


- (void)setLableText:(NSString *)lableText{
    _lableText = lableText;
    self.lable.text = lableText;
}
-(void)setSublableText:(NSString *)sublableText{
    _sublableText = sublableText;
    self.sublable.text = sublableText;
}
- (void)setSelected:(BOOL)selected{
    if (selected) {
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.lable.textColor = [UIColor redColor];
        self.sublable.textColor = [UIColor redColor];
    }
    else{
       self.layer.borderColor = [UIColor grayColor].CGColor;
        self.lable.textColor = [UIColor grayColor];
        self.sublable.textColor = [UIColor grayColor];
    }
}

@end
