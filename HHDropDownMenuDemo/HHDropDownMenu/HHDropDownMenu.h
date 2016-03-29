//
//  HHDropDownMenu.h
//  HHDropDownMenuDemo
//
//  Created by 韩继宏 on 16/3/29.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHDropDownMenu;

@protocol HHDropDownMenuDelegate <NSObject>

@optional
- (void)HHDropDownMenuDidShow:(HHDropDownMenu *)menu;
- (void)HHDropDownMenuDidDismiss:(HHDropDownMenu *)menu;

@end

@interface HHDropDownMenu : UIView

@property (nonatomic, weak) id<HHDropDownMenuDelegate>delegate;

/*!
 *  @author 韩继宏, 16-03-29 14:03:26
 *
 *  自定义下拉菜单
 *
 *  @return 创建一个下拉菜单
 */
+ (instancetype)menu;

/*!
 *  @author 韩继宏, 16-03-29 15:03:29
 *
 *  显示
 *
 *  @param from 具体从哪里开始显示位置
 */
- (void)showFrom:(UIView *)from;

/*!
 *  @author 韩继宏, 16-03-29 15:03:53
 *
 *  销毁
 */
- (void)dismiss;

/*!
 *  @author 韩继宏, 16-03-29 15:03:51
 *
 *  内容
 */
@property (nonatomic, strong) UIView *content;

/*!
 *  @author 韩继宏, 16-03-29 15:03:08
 *
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentViewController;

@end
