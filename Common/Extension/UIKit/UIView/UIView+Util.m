//
//  UIView+Util.m
//  FuckingEnglish
//
//  Created by fuxsociety on 03/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)
@dynamic cornerRadius;
@dynamic borderColor;

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)fillSuperViewConstraint {
    [self fillSuperViewConstraintWithContentInset:UIEdgeInsetsZero];
}

- (void)fillSuperViewConstraintWithContentInset:(UIEdgeInsets)contentInset {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:contentInset.top],
        [self.leadingAnchor constraintEqualToAnchor:self.superview.leadingAnchor constant:contentInset.left],
        [self.trailingAnchor constraintEqualToAnchor:self.superview.trailingAnchor constant:-contentInset.right],
        [self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor constant:-contentInset.bottom],
    ]];
}

- (void)pinWithView:(UIView*)view
{
    self.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [self.topAnchor constraintEqualToAnchor:view.topAnchor],
        [self.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
        [self.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
        [self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
    ]];
}

+(instancetype)loadViewFromNib
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIView *contentView = (UIView*)[[bundle loadNibNamed:NSStringFromClass([self class]) owner:self options:@{}] firstObject];
    return contentView;
}
@end
