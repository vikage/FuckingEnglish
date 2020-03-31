//
//  UIView+RoundCorner.m
//  FuckingEnglish
//
//  Created by fuxsociety on 03/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "UIView+RoundCorner.h"

@implementation UIView (RoundCorner)
- (void)roundCorners:(UIRectCorner)coners radius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:coners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.path = path.CGPath;
    self.layer.mask = mask;
}
@end
