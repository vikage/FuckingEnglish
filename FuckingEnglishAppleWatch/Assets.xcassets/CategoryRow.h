//
//  CategoryRow.h
//  FuckingEnglish
//
//  Created by Thanh Vu on 11/7/19.
//  Copyright © 2019 fuxsociety. All rights reserved.
//

#import "Category.h"
#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CategoryRow : NSObject
@property (nonatomic, strong) IBOutlet WKInterfaceLabel* categoryNameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup* contentContainer;

- (void)bindData:(Category*)category;
@end

NS_ASSUME_NONNULL_END
