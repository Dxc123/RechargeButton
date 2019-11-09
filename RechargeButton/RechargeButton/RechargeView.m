//
//  BtnCollectionView.m
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import "RechargeView.h"
#import "RechargeBtnCell.h"

#define  HDScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  HDScreenHeight [UIScreen mainScreen].bounds.size.height
#define IMAGE(imageName) [UIImage imageNamed:imageName]

@interface RechargeView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *contentview;
@property (nonatomic, assign) NSInteger selectedIndex;
@end
@implementation RechargeView
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds=YES;
        _celltitles = [NSArray array];
        [self setupcontent];
        
    }
    return self;
}
-(void)setupcontent
{
    self.selectedIndex = MAXFLOAT;
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, HDScreenWidth, self.frame.size.height) collectionViewLayout:flowlayout];
    collectionView.backgroundColor = [UIColor colorWithRed:235 green:235 blue:241 alpha:1];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    _contentview = collectionView;
    [collectionView registerClass:[RechargeBtnCell class] forCellWithReuseIdentifier:@"RechargeBtnCell"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    
    
    
}


#pragma mark --UICollectionViewDataSource UICollectionViewDelegate
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _celltitles.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RechargeBtnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RechargeBtnCell" forIndexPath:indexPath];

    cell.lableText = [NSString stringWithFormat:@"%@金币",_celltitles[indexPath.row]];
    cell.sublableText = [NSString stringWithFormat:@"￥%@",_cellsubtitles[indexPath.row]];
    
    //    默认选中第一个
    if (StrIsEmpty(self.selectIndex)) {
         [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];

        
    }else{
         [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:[self.selectIndex integerValue] inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
       
    }
   
    return cell;
    
}

//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 60);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
   return UIEdgeInsetsMake(10, 20, 10, 20);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    RechargeBtnCell *cell = (RechargeBtnCell *)[collectionView cellForItemAtIndexPath:indexPath];
     cell.selectedImg.image = IMAGE(@"sign_singed");;
    [_delegate didSelectItemWith:indexPath.row];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    RechargeBtnCell *cell = (RechargeBtnCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selectedImg.image = IMAGE(@"");;
    [_delegate didDeselectItemWith:indexPath.row];
}
-(void)setCelltitles:(NSArray *)celltitles{
    _celltitles = celltitles;
    if (_celltitles.count != 0 ) {
         [_contentview reloadData];
    }
}
-(void)setCellsubtitles:(NSArray *)cellsubtitles{
    _cellsubtitles = cellsubtitles;
    if (_cellsubtitles.count != 0 ) {
        [_contentview reloadData];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
