//
//  ViewController.m
//  HHDropDownMenuDemo
//
//  Created by 韩继宏 on 16/3/29.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "ViewController.h"
#import "HHTitleButton.h"
#import "HHDropDownMenu.h"
#import "HHTitleMenuViewController.h"
#import "UIView+Extension.h"

@interface ViewController () <HHDropDownMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题按钮
    HHTitleButton *titleBtn = [[HHTitleButton alloc] init];
    [titleBtn setTitle:@"下拉菜单" forState:UIControlStateNormal];
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
}

/*!
 *  @author 韩继宏, 16-03-29 15:03:53
 *
 *  标题按钮点击
 *
 *  @param titleButton 当前下拉菜单按钮
 */
- (void)titleBtnClick:(UIButton *)titleButton {
    // 1.创建下拉菜单
    HHDropDownMenu *menu = [HHDropDownMenu menu];
    menu.delegate = self;
    
    // 2.设置内容(这里是创建了一个控制器)
    HHTitleMenuViewController *menuViewController = [[HHTitleMenuViewController alloc] init];
    menuViewController.view.height = 150;
    menuViewController.view.width = 150;
    menu.contentViewController = menuViewController;
    
    // 3.显示
    [menu showFrom:titleButton];
}

#pragma mark - HHDropDownMenuDelegate
- (void)HHDropDownMenuDidShow:(HHDropDownMenu *)menu {
    // 让箭头向下
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
}

- (void)HHDropDownMenuDidDismiss:(HHDropDownMenu *)menu {
    // 让箭头向上
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
}

@end
