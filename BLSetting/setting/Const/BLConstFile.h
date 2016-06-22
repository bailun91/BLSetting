//
//  BLConstFile.h
//  BLSetting
//
//  Created by 蔡瑶 on 16/4/27.
//  Copyright © 2016年 bailun91. All rights reserved.
//

#ifndef BLConstFile_h
#define BLConstFile_h

// 屏的大小
#define MainScreen [UIScreen mainScreen].bounds
#define MainScreenW  MainScreen.size.width
#define MainScreenH  MainScreen.size.height

//View的尺寸简写
#import "UIView+Frame.h"

// 颜色
#define BLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define BlColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define BLRandomColor BLColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


//功能图片到左边界的距离
#define FuncImgToLeftGap 10

//功能名称字体
#define FuncLabelFont 14

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define FuncLabelToFuncImgGap 10

//指示箭头或开关到右边界的距离
#define IndicatorToRightGap 15

//详情文字字体
#define DetailLabelFont 12

//详情到指示箭头或开关的距离
#define DetailViewToIndicatorGap 13


#endif /* BLConstFile_h */
