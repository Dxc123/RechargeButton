//
//  RechargeCollectionView.m
//  HaiDiProject
//
//  Created by Dxc_iOS on 2018/4/13.
//  Copyright © 2018年 XinMiao. All rights reserved.
//

#import "RechargeCollectionView.h"
#import "Masonry.h"
#define  HDScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  HDScreenHeight [UIScreen mainScreen].bounds.size.height
#define IMAGE(imageName) [UIImage imageNamed:imageName]

@interface RechargeCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger selectedIndex;
@end
@implementation RechargeCollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds=YES;
        _celltitles = [NSArray array];
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI
{
    
    [self addSubview:self.collectionView];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
         UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, HDScreenWidth, self.frame.size.height) collectionViewLayout:flowlayout];
        _collectionView.backgroundColor = [UIColor colorWithRed:235 green:235 blue:241 alpha:1];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[RechargeBtnCell class] forCellWithReuseIdentifier:@"RechargeBtnCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
        
        [_collectionView registerClass:[RechargeHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RechargeHeadReusableView"];
        [_collectionView registerClass:[RechargeFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"RechargeFooterReusableView"];
    }
    return _collectionView;
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

//设置每个 Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(HDScreenWidth/2-100, 70);//3列
}
//设置collectionView的四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
   return UIEdgeInsetsMake(10, 20, 10, 20);
}
//设置最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
//设置最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    RechargeBtnCell *cell = (RechargeBtnCell *)[collectionView cellForItemAtIndexPath:indexPath];
     cell.imgStr = @"sign_singed";
    if ([_delegate respondsToSelector:@selector(didSelectItemWith:)]) {
         [_delegate didSelectItemWith:indexPath.row];
    }

    if (self.SelectBlock) {
        self.SelectBlock(indexPath.row);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    RechargeBtnCell *cell = (RechargeBtnCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.imgStr = @"";
   
    if ([_delegate respondsToSelector:@selector(didDeselectItemWith:)]) {
         [_delegate didDeselectItemWith:indexPath.row];
    }
    
}

//设置段头的尺寸

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(HDScreenWidth, 30);
}

//设置段尾的尺寸

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(HDScreenWidth, 60);
}
//自定义表头或表尾

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     UICollectionReusableView *reuseablebiew = nil;
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {//这是头视图
        RechargeHeadReusableView *headeview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RechargeHeadReusableView" forIndexPath:indexPath];
        headeview.titleLabText = @"选择充值额度";
        reuseablebiew = headeview;
    }else{//这是尾视图
        RechargeFooterReusableView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"RechargeFooterReusableView" forIndexPath:indexPath];
        footview.confirmBlock = ^{
            NSLog(@"点击");
            if (self.RechargeBlock) {
                self.RechargeBlock(0);
            }
        };
      reuseablebiew = footview;
    }

    return reuseablebiew;

}
//赋值
-(void)setCelltitles:(NSArray *)celltitles{
    _celltitles = celltitles;
    if (_celltitles.count != 0 ) {
        [self.collectionView reloadData];
    }
}
-(void)setCellsubtitles:(NSArray *)cellsubtitles{
    _cellsubtitles = cellsubtitles;
    if (_cellsubtitles.count != 0 ) {
        [self.collectionView reloadData];
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


#pragma mark --自定义UICollectionViewCell

@interface RechargeBtnCell ()
@property (nonatomic, strong) UILabel *lable;
@property (nonatomic, strong) UILabel *sublable;
@property(nonatomic, strong)UIImageView *selectedImg;
@end
@implementation RechargeBtnCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 6.0f;
        self.layer.masksToBounds = YES;
        
        _lable = [[UILabel alloc]init];
        [self.contentView addSubview:_lable];
        _lable.font = [UIFont systemFontOfSize:16];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.textColor = [UIColor blackColor];
        [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
               make.left.right.mas_equalTo(self);
               make.top.mas_equalTo(self);
               make.height.mas_equalTo(30);
               
           }];
        
        _selectedImg = [[UIImageView alloc] init];
       [self.contentView addSubview:_selectedImg];
        [_selectedImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(0);
            make.top.mas_equalTo(self).offset(5);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        
        _sublable = [[UILabel alloc]init];
        [self.contentView addSubview:_sublable];
        _sublable.font = [UIFont systemFontOfSize:13];
        _sublable.textAlignment = NSTextAlignmentCenter;
        _sublable.textColor = [UIColor grayColor];
        
        [_sublable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.lable.mas_bottom).offset(0);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}
//赋值
- (void)setLableText:(NSString *)lableText{
    _lableText = lableText;
    self.lable.text = lableText;
}
-(void)setSublableText:(NSString *)sublableText{
    _sublableText = sublableText;
    self.sublable.text = sublableText;
}
-(void)setImgStr:(NSString *)imgStr{
    _imgStr = imgStr;
    self.selectedImg.image = [UIImage imageNamed:imgStr];
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


#pragma mark --自定义头视图
@interface RechargeHeadReusableView ()
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation RechargeHeadReusableView

-(instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];
    [self createUI];
  }
  return self;
}

-(void)createUI{
   [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(self.mas_left).offset(20);
     make.centerY.mas_equalTo(self.mas_centerY);
     make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.textColor = [UIColor redColor];
        _titleLab.text = @"请选择充值金额";
    }
    return _titleLab;
}
-(void)setTitleLabText:(NSString *)titleLabText{
    _titleLabText = titleLabText;
    self.titleLab.text = titleLabText;
}

@end


#pragma mark --自定义头视图
@interface RechargeFooterReusableView ()
@end

@implementation RechargeFooterReusableView

-(id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];
    [self createUI];
    self.backgroundColor = [UIColor whiteColor];
  }
  return self;
}
-(void)createUI{
    [self addSubview:self.confirmBtn];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.height.mas_equalTo(40);
    }];
}
-(void)confirmBtnClick:(UIButton *)sender{
    if (self.confirmBlock) {
        self.confirmBlock();
    }
}
-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         _confirmBtn.layer.cornerRadius = 16.f;
        _confirmBtn.clipsToBounds = YES;
        _confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.backgroundColor = [UIColor redColor];;
        [_confirmBtn setTitle:@"立即充值" forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}



@end
