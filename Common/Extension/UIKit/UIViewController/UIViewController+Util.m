//
//  UIViewController+Util.m
//  FuckingEnglish
//
//  Created by fuxsociety on 03/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "UIViewController+Util.h"

@implementation UIViewController (Util)
// MARK: - Alert
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [self showAlertWithTitle:title message:message actionsTitle:nil actionHandler:nil];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message actionsTitle:(NSArray<NSString *> *)actionsTitle actionHandler:(void (^)(NSInteger))handler {
    if (!actionsTitle) {
        actionsTitle = @[@"OK"];
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *actionTitle in actionsTitle) {
        NSInteger index = [actionsTitle indexOfObject:actionTitle];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(index);
            }
        }];
        
        [alertController addAction:alertAction];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// MARK: - Action sheet
- (void)showActionSheetWithTitle:(NSString*)title message:(NSString*)message actionsTitle:(NSArray<NSString*>*)actionsTitle actionHandler:(void (^)(NSInteger))handler
{
    [self showActionSheetWithTitle:title message:message actionsTitle:actionsTitle destructiveIndexes:nil cancelIndex:-1 actionHandler:handler];
}

- (void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message actionsTitle:(NSArray<NSString *> *)actionsTitle destructiveIndexes:(NSArray<NSNumber *> *)destructiveIndexes cancelIndex:(NSInteger)cancelIndex actionHandler:(void (^)(NSInteger))handler
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString* actionTitle in actionsTitle) {
        NSInteger index = [actionsTitle indexOfObject:actionTitle];
        UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
        if (cancelIndex == index) {
            actionStyle = UIAlertActionStyleCancel;
        } else if ([destructiveIndexes containsObject:@(index)]) {
            actionStyle = UIAlertActionStyleDestructive;
        }

        UIAlertAction* alertAction = [UIAlertAction actionWithTitle:actionTitle
                                                              style:actionStyle
                                                            handler:^(UIAlertAction* _Nonnull action) {
                                                                if (handler) {
                                                                    handler(index);
                                                                }
                                                            }];

        [alertController addAction:alertAction];
    }

    [self presentViewController:alertController animated:YES completion:nil];
}
@end
