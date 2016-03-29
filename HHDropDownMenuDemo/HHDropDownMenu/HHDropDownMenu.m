//
//  HHDropDownMenu.m
//  HHDropDownMenuDemo
//
//  Created by 韩继宏 on 16/3/29.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "HHDropDownMenu.h"
#import "UIView+Extension.h"

@interface HHDropDownMenu ()

/*!
 *  @author 韩继宏, 16-03-29 15:03:08
 *
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, weak) UIImageView *containerView;

@end

@implementation HHDropDownMenu

- (UIImageView *)containerView {
    if (!_containerView) {
        // 添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        // 清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)menu {
    return [[self alloc] init];
}

- (void)setContent:(UIView *)content {
    _content = content;
    
    // 调整内容的位置
    content.x = 10;
    content.y = 15;
    
    // 设置灰色高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    // 设置灰色宽度
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:content];
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    _contentViewController = contentViewController;
    
    self.content = contentViewController.view;
}

- (void)showFrom:(UIView *)from {
    // 获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    // 添加自已到窗口上
    [window addSubview:self];
    
    // 设置尺寸
    self.frame = window.frame;
    
    // 调整灰色图片位置
    // 将rect(from)由rect(from)所在视图转换到目标视图view中，返回在目标视图view中的rect
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    // 通知代理，下拉菜单已经显示
    if ([self.delegate respondsToSelector:@selector(HHDropDownMenuDidShow:)]) {
        [self.delegate HHDropDownMenuDidShow:self];
    }
}

- (void)dismiss {
    [self removeFromSuperview];
    
    // 通知代理，下拉菜单已经销毁
    if ([self.delegate respondsToSelector:@selector(HHDropDownMenuDidDismiss:)]) {
        [self.delegate HHDropDownMenuDidDismiss:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

@end
