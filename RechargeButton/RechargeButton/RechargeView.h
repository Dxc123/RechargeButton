//
//  BtnCollectionView.h
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import <UIKit/UIKit.h>
//字符串是否为空
#define StrIsEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define ArrIsEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))
@class RechargeView;

@protocol BtnCollectionViewDelegate <NSObject>

-(void)didSelectItemWith:(NSInteger)index;
-(void)didDeselectItemWith:(NSInteger)index;


@end
@interface RechargeView : UIView
@property(nonatomic,strong)NSArray *celltitles;
@property(nonatomic,strong)NSArray *cellsubtitles;
/**
选中的index(默认选中第一个)
*/
@property(nonatomic,assign)NSString *selectIndex;
@property(nonatomic,assign)id<BtnCollectionViewDelegate>delegate;

@end
