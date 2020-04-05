//
//  RechargeCollectionView.h
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
@class RechargeCollectionView;

@protocol BtnCollectionViewDelegate <NSObject>

-(void)didSelectItemWith:(NSInteger)index;
-(void)didDeselectItemWith:(NSInteger)index;


@end
@interface RechargeCollectionView : UIView
@property(nonatomic,strong)NSArray *celltitles;
@property(nonatomic,strong)NSArray *cellsubtitles;
/**
选中的index(默认选中第一个)
*/
@property(nonatomic,assign)NSString *selectIndex;
@property(nonatomic,assign)id<BtnCollectionViewDelegate>delegate;
@property(nonatomic,copy)void(^SelectBlock)(NSInteger index);
@property(nonatomic,copy)void(^RechargeBlock)(NSInteger index);
@end

#pragma mark --自定义UICollectionViewCell
@interface RechargeBtnCell : UICollectionViewCell

@property (nonatomic, copy) NSString *lableText;

@property (nonatomic, copy) NSString *sublableText;

@property (nonatomic, copy) NSString *imgStr;


@end

#pragma mark --自定义头视图

@interface RechargeHeadReusableView : UICollectionReusableView

@property (nonatomic, copy) NSString *titleLabText;

@end

#pragma mark --自定义尾视图
@interface RechargeFooterReusableView : UICollectionReusableView

@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, copy) void(^confirmBlock)(void);

@end
