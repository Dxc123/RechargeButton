//
//  RechargeBtnCell.h
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RechargeBtnCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *lable;
@property (nonatomic, copy) NSString *lableText;

@property (nonatomic, strong) UILabel *sublable;
@property (nonatomic, copy) NSString *sublableText;

@property(nonatomic, strong)UIImageView *selectedImg;

@end
