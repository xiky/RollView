//
//  TRecomGuideView.h
//  kekeyouGuide
//
//  Created by yx on 2017/5/31.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKCardScaleDelegate <NSObject>

// 滚动代理方法
- (void)JKCardSwitchDidSelectedAtIndexPath:(NSInteger)index;

@end

@interface TRecomGuideView : UIView


@property (nonatomic, weak) id<JKCardScaleDelegate> delegate;


@end
