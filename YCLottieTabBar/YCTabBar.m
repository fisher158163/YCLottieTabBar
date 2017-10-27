//
//  YCTabBar.m
//  YCLottieTabBar
//
//  Created by zyc on 2017/10/26.
//  Copyright © 2017年 YC. All rights reserved.
//

#import "YCTabBar.h"
#import "YCTabBarButton.h"
#import <Lottie/Lottie.h>

@interface YCTabBar()

@property(nonatomic,strong)NSMutableArray *tabBarButtons;
@property(nonatomic,weak)YCTabBarButton *selectedButton;
@property(nonatomic,strong)NSMutableArray *viewsArr;
@property(nonatomic,weak)LOTAnimationView *selectedview;

@end

@implementation YCTabBar

-(NSMutableArray *)tabBarButtons{
    if(_tabBarButtons == nil){
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
-(NSMutableArray *)viewsArr{
    if (_viewsArr == nil) {
        _viewsArr = [NSMutableArray array];
    }
    return _viewsArr;
}


-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    
    //1、创建按钮 创建LOTAnimationView
    
    NSString *jsonStr;
    NSInteger TagNum;
    if ([item.title isEqualToString:@"首页"]){
        TagNum = 100;
        jsonStr = @"data01.json";
    }else if ([item.title isEqualToString:@"动态"]){
        TagNum = 101;
        jsonStr = @"data02.json";
    }else if ([item.title isEqualToString:@"购物车"]){
        TagNum = 102;
        jsonStr = @"data03.json";
    }else{
        TagNum = 103;
        jsonStr = @"data04.json";
    }
    LOTAnimationView *aniView = [LOTAnimationView animationNamed:jsonStr];
    aniView.tag = TagNum;
    
    if (aniView.tag == 100) {
        _selectedview = aniView;
    }
    
    [self addSubview:aniView];
    
    
    YCTabBarButton *button=[[YCTabBarButton alloc]init];
    [self addSubview:button];
    
    //添加按钮到数组中
    [self.viewsArr addObject:aniView];
    [self.tabBarButtons addObject:button];
    
    //2、设置数据
    button.item=item;
    
    //3、监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4、默认选中第零个
    if(self.tabBarButtons.count==1){
        
        [_selectedview play];
        [self buttonClick:button];
    }
    
    
}

//监听按钮点击
-(void)buttonClick:(YCTabBarButton *)button{
    //通知代理
    if([self.delegate respondsToSelector:@selector(tabBar:didselectedButtonFrom:to:)]){
        [self.delegate tabBar:self didselectedButtonFrom:(int )self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
    
    [self.selectedview stop];
    
    for (LOTAnimationView *kview in _viewsArr) {
        if (kview.tag == 100 +button.tag) {
            self.selectedview = kview;
        }
    }
    [self.selectedview play];
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width/(self.tabBarButtons.count);
    
    CGFloat buttonH = self.frame.size.height - 3;
    
    CGFloat buttonY = 3;
    
    for(int index = 0;index<self.tabBarButtons.count;index++){
        
        CGFloat buttonX = index*buttonW;
    
        LOTAnimationView *lotview = self.viewsArr[index];
        
        lotview.frame = CGRectMake(buttonX +(buttonW -40)/2.f, buttonY, 40, 25);
        
        YCTabBarButton *button = self.tabBarButtons[index];
        
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        button.tag=index;
    }

}



@end
