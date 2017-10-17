//
//  TRecomGuideView.m
//  kekeyouGuide
//
//  Created by yx on 2017/5/31.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "TRecomGuideView.h"
#import "TScaleFlowLayout.h"
#import "TRecomGuideCell.h"
#import "MoreColor.h"
#import "Masonry.h"
#import "Macros.h"




@interface TRecomGuideView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *backImageV;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) CGFloat dragStartX;
@property (nonatomic, assign) CGFloat dragEndX;


@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *moreBtn;

@property (nonatomic, strong) UILabel *btnTitle;
@property (nonatomic, strong) UIImageView *btnImage;

@end

static NSString *const recommendGuideCell = @"recommendGuideCell";

@implementation TRecomGuideView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = zCOLOR(@"f9f9f9");
    [self addImageView];
    [self addCollectionView];
}

- (void)addImageView {
    _backImageV = [[UIImageView alloc] init];
    _backImageV.frame = CGRectMake(0, 0, zWIDTH, 244);
    _backImageV.userInteractionEnabled = YES;
    _backImageV.backgroundColor = [UIColor grayColor];
    [self addSubview:_backImageV];
    
    UIBlurEffect* effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView* effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = _backImageV.bounds;
    effectView.alpha = 0.5f;
    effectView.userInteractionEnabled = YES;
    [_backImageV addSubview:effectView];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor clearColor];
    topView.userInteractionEnabled = YES;
    [self addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.text = @"推 / 荐 / 行 / 家";
    _titleLab.textColor = [UIColor whiteColor];
    _titleLab.font = JKSYSTEM_FONT_16;
    
    _btnTitle = [[UILabel alloc] init];
    _btnTitle.text = @"更多";
//    _btnTitle.textColor = JKWhiteColor;
    _titleLab.textColor = [UIColor whiteColor];
    _btnTitle.font = JKSYSTEM_FONT_12;
    
    _btnImage = [[UIImageView alloc] init];
    _btnImage.image = [UIImage imageNamed:@"morearrow"];
    
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [topView addSubview:_titleLab];
    [topView addSubview:_moreBtn];

    [_moreBtn addSubview:_btnImage];
    [_moreBtn addSubview:_btnTitle];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(topView.mas_bottom);
        make.centerX.equalTo(self);
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.right.mas_equalTo(topView);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [_btnImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_btnTitle);
        make.right.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    
    [_btnTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_moreBtn.mas_bottom).offset(-3);
        make.right.equalTo(_btnImage.mas_left).offset(-4);
    }];
    
}

- (void)moreBtnClick:(UIButton *)btn {
    JKLogFunc;
}

- (void)addCollectionView {
    TScaleFlowLayout *flow = [[TScaleFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(240, 201); // image + labView
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumLineSpacing = 10;
    flow.headerReferenceSize = CGSizeMake(67.5, 201);
    flow.footerReferenceSize = flow.headerReferenceSize;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 88, zWIDTH, 201) collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    _collectionView.showsHorizontalScrollIndicator = false;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[TRecomGuideCell class] forCellWithReuseIdentifier:recommendGuideCell];
    [_collectionView setUserInteractionEnabled:YES];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRecomGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendGuideCell forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark -
#pragma mark CollectionDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentIndex = indexPath.row;
    [self scrollToCenter];
}
//手指拖动开始
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _dragStartX = scrollView.contentOffset.x;
}

//手指拖动停止
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _dragEndX = scrollView.contentOffset.x;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self fixCellToCenter];
    });
}

//配置cell居中
- (void)fixCellToCenter {
    //最小滚动距离
    float dragMiniDistance = self.bounds.size.width / 20.0f;
    if (_dragStartX -  _dragEndX >= dragMiniDistance) {
        _currentIndex -= 1; // 向右
    } else if(_dragEndX -  _dragStartX >= dragMiniDistance) {
        _currentIndex += 1; // 向左
    }
    NSInteger maxIndex = [_collectionView numberOfItemsInSection:0] - 1;
    _currentIndex = _currentIndex <= 0 ? 0 : _currentIndex;
    _currentIndex = _currentIndex >= maxIndex ? maxIndex : _currentIndex;
    
    [self scrollToCenter];
}

- (void)scrollToCenter {
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if ([_delegate respondsToSelector:@selector(JKCardSwitchDidSelectedAtIndexPath:)]) {
        [_delegate JKCardSwitchDidSelectedAtIndexPath:_currentIndex];
    }
}

@end
