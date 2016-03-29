//
//  HHTitleButton.m
//  HHDropDownMenuDemo
//
//  Created by 韩继宏 on 16/3/29.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "HHTitleButton.h"
#import "UIView+Extension.h"

@implementation HHTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
        [self imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 计算titleLabel的frame
    self.titleLabel.x = self.imageView.x;
    
    // 计算imageView的frame
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
