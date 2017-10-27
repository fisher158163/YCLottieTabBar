//
//  YCTabBarController.m
//  YCLottieTabBar
//
//  Created by zyc on 2017/10/27.
//  Copyright © 2017年 YC. All rights reserved.
//

#import "YCTabBarController.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewControllerFour.h"

#import "YCTabBar.h"
@interface YCTabBarController ()<YCTabBarDetagate>

@property(nonatomic,weak)YCTabBar *customTabBar;

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBar];
    [self setUPChildrenVC];
    
}

///自定义tabBar
-(void)setupTabBar{
    YCTabBar *customTabBar=[[YCTabBar alloc]init];
    
    customTabBar.frame=self.tabBar.bounds;
    
    self.customTabBar=customTabBar;
    
    customTabBar.delegate=self;
    
    [self.tabBar addSubview:customTabBar];
    
}

//监听按的改变
-(void)tabBar:(YCTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    self.selectedIndex=to;
}

///移除自带的tabBar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for(UIView *child in self.tabBar.subviews){
        if([child isKindOfClass:[UIControl class]]){
            [child removeFromSuperview];
        }
    }
}

- (void)setUPChildrenVC{
    
    [self set1ChildVCWithVC:[ViewControllerOne class] title:@"首页" image:@""];
    [self set1ChildVCWithVC:[ViewControllerTwo class] title:@"动态" image:@""];
    [self set1ChildVCWithVC:[ViewControllerThree class] title:@"购物车" image:@""];
    [self set1ChildVCWithVC:[ViewControllerFour class] title:@"我的" image:@""];
    
    
}
- (void)set1ChildVCWithVC:(Class)vcClass title:(NSString *)title image:(NSString *)image{
    
    UIViewController *VC = [[vcClass alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.title = title;
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButtonWithItem:VC.tabBarItem];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
