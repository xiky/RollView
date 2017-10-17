//
//  TRecomGuideCell.m
//  kekeyouGuide
//
//  Created by yx on 2017/5/31.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "TRecomGuideCell.h"
#import "Macros.h"
#import "Masonry.h"



@interface TRecomGuideCell ()

@property (nonatomic, strong) UIImageView *backImageV;
@property (nonatomic, strong) UIImageView *headImageV;
@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UIView *bottomV;
@property (nonatomic, strong) UILabel *infoLab;

@end

@implementation TRecomGuideCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self setLayout];
    }
    return self;
}

- (void)setupUI {
    _backImageV = [[UIImageView alloc] init];
    _backImageV.backgroundColor = JKRandomColor;
    
    _headImageV = [[UIImageView alloc] init];
    _headImageV.backgroundColor = JKRandomColor;
    _headImageV.layer.cornerRadius = 30;
    _headImageV.layer.masksToBounds = YES;
    
    _nameLab = [[UILabel alloc] init];
    _nameLab.text = @"Mr_sun";
    _nameLab.textColor = JKWhiteColor;
    _nameLab.font = JKSYSTEM_FONT_14;
    
    _bottomV = [[UIView alloc] init];
    _bottomV.backgroundColor = JKWhiteColor;
    
    _infoLab = [[UILabel alloc] init];
    _infoLab.text = @"如果你无法简洁的表达你的想法，那只说明你还不够了解它。";
    _infoLab.numberOfLines = 2;
    _infoLab.textColor = JKText666;
    _infoLab.font = JKSYSTEM_FONT_12;
}

- (void)setLayout {
    [self.contentView addSubview:_backImageV];
    [self.contentView addSubview:_bottomV];
    [_backImageV addSubview:_headImageV];
    [_backImageV addSubview:_nameLab];
    [_bottomV addSubview:_infoLab];
    
    
    [_backImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(156);
    }];
    
    [_headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.center.equalTo(_backImageV);
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImageV.mas_bottom).offset(5);
        make.centerX.equalTo(_headImageV);
    }];
    
    [_bottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backImageV.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(45);
    }];
    
    [_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(7.5);
        make.right.mas_lessThanOrEqualTo(-15);
    }];
    
}

@end
