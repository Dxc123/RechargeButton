//
//  BtnCollectionView.h
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RechargeView;

@protocol BtnCollectionViewDelegate <NSObject>

-(void)didSelectItemWith:(NSInteger)index;
-(void)didDeselectItemWith:(NSInteger)index;


@end
@interface RechargeView : UIView
@property(nonatomic,strong)NSArray *celltitles;
@property(nonatomic,strong)NSArray *cellsubtitles;

@property(nonatomic,assign)id<BtnCollectionViewDelegate>delegate;

@end
