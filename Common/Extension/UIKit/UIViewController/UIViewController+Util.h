//
//  UIViewController+Util.h
//  FuckingEnglish
//
//  Created by fuxsociety on 03/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Util)
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message actionsTitle:(nullable NSArray<NSString *>*)actionsTitle actionHandler:(nullable void (^)(NSInteger actionIndex))handler;

- (void)showActionSheetWithTitle:(NSString*__nullable)title message:(NSString*__nullable)message actionsTitle:(nullable NSArray<NSString*>*)actionsTitle actionHandler:(nullable void (^)(NSInteger actionIndex))handler;
- (void)showActionSheetWithTitle:(NSString* __nullable)title message:(NSString*__nullable)message actionsTitle:(nullable NSArray<NSString*>*)actionsTitle destructiveIndexes:(nullable NSArray<NSNumber*>*)destructiveIndexes cancelIndex:(NSInteger)cancelIndex actionHandler:(nullable void (^)(NSInteger actionIndex))handler;
@end

NS_ASSUME_NONNULL_END
