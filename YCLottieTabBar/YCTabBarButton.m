//
//  YCTabBarButton.m
//  YCLottieTabBar
//
//  Created by zyc on 2017/10/26.
//  Copyright © 2017年 YC. All rights reserved.
//

#import "YCTabBarButton.h"
#define IWTabBarButtonImageRatio 0.6
@implementation YCTabBarButton

//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height*IWTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
//设置item
-(void)setItem:(UITabBarItem *)item{
    _item = item;
    //设置 文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
}


-(id)initWithFrame:(CGRect)frame{
    
    if(self=[super initWithFrame:frame]){
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0/255.0 green:80/255.0 blue:182/255.0 alpha:1] forState:UIControlStateSelected];
        
    }//选中状态
    return self;
}



@end
