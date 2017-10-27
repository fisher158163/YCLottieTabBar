//
//  YCTabBar.h
//  YCLottieTabBar
//
//  Created by zyc on 2017/10/26.
//  Copyright © 2017年 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCTabBar;

@protocol YCTabBarDetagate <NSObject>

@optional

-(void)tabBar:(YCTabBar *)tabBar didselectedButtonFrom:(int )from to: (int )to;

@end

@interface YCTabBar : UIView

@property(nonatomic,weak)id<YCTabBarDetagate>delegate;

-(void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
