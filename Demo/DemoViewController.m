//
//  DemoViewController.m
//  Demo
//
//  Created by yx on 2017/5/31.
//  Copyright © 2017年 Jacky Yao. All rights reserved.
//

#import "DemoViewController.h"
#import "TRecomGuideView.h"
#import "Macros.h"



@interface DemoViewController () <JKCardScaleDelegate>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = zCOLOR(@"e8e8e8");
    
    TRecomGuideView *guideV = [[TRecomGuideView alloc] init];
    //    guideV.backgroundColor = [UIColor purpleColor];
    guideV.frame = CGRectMake(0, 100, zWIDTH, 299);
    guideV.delegate = self;
    
    [self.view addSubview:guideV];
}

- (void)JKCardSwitchDidSelectedAtIndexPath:(NSInteger)index {
    NSLog(@"推荐行家 选中了：%zd", index);
}

@end
