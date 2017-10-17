//
//  Macros.h
//  Demo
//
//  Created by yx on 2017/5/31.
//  Copyright © 2017年 Jacky Yao. All rights reserved.
//
#import "MoreColor.h"
#import "Masonry.h"



#ifndef Macros_h
#define Macros_h

#define zWIDTH [UIScreen mainScreen].bounds.size.width//主屏宽度


/****************************** yx ******************************/

#define zCOLOR(c) [MoreColor hexStringToColor:c] //颜色转像素

#ifdef DEBUG
#define JKLog(...) NSLog(__VA_ARGS__)
#else
#define JKLog(...)
#endif

#define JKLogFunc JKLog(@"%s", __func__)

//不加粗字体
#define JKSYSTEM_FONT_(A) [UIFont systemFontOfSize:A]
#define JKSYSTEM_FONT_10 [UIFont systemFontOfSize:10]
#define JKSYSTEM_FONT_11 [UIFont systemFontOfSize:11]
#define JKSYSTEM_FONT_12 [UIFont systemFontOfSize:12]
#define JKSYSTEM_FONT_13 [UIFont systemFontOfSize:13]
#define JKSYSTEM_FONT_14 [UIFont systemFontOfSize:14]
#define JKSYSTEM_FONT_15 [UIFont systemFontOfSize:15]
#define JKSYSTEM_FONT_16 [UIFont systemFontOfSize:16]
#define JKSYSTEM_FONT_17 [UIFont systemFontOfSize:17]
#define JKSYSTEM_FONT_18 [UIFont systemFontOfSize:18]
#define JKSYSTEM_FONT_19 [UIFont systemFontOfSize:19]
#define JKSYSTEM_FONT_20 [UIFont systemFontOfSize:20]
#define JKSYSTEM_FONT_21 [UIFont systemFontOfSize:21]
#define JKSYSTEM_FONT_22 [UIFont systemFontOfSize:22]
#define JKSYSTEM_FONT_23 [UIFont systemFontOfSize:23]
#define JKSYSTEM_FONT_24 [UIFont systemFontOfSize:24]
#define JKSYSTEM_FONT_25 [UIFont systemFontOfSize:25]
#define JKSYSTEM_FONT_27 [UIFont systemFontOfSize:26]

// 价格颜色 红色
#define JKRedPriceColor zCOLOR(@"fd6864")
#define JKFCD13D        zCOLOR(@"fcd13d")   // 黄色主色调
#define JKWhiteColor    zCOLOR(@"ffffff")
#define JKLineColor     zCOLOR(@"e8e8e8")
#define JKText666       zCOLOR(@"666666")
#define JKText333       zCOLOR(@"333333")
#define JKText999       zCOLOR(@"999999")
#define JKTextB3        zCOLOR(@"b3b3b3")

// 颜色
#define JKRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JKRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
// 随机色
#define JKRandomColor JKRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))



#endif /* Macros_h */
