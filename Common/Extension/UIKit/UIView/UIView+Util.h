//
//  UIView+Util.h
//  FuckingEnglish
//
//  Created by fuxsociety on 03/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Util)
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor* borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

- (void)fillSuperViewConstraint;
- (void)fillSuperViewConstraintWithContentInset:(UIEdgeInsets)contentInset;
- (void)pinWithView:(UIView*)view;

+ (instancetype)loadViewFromNib;
@end

NS_ASSUME_NONNULL_END
