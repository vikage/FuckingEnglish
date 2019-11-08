//
//  CategoryRow.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 11/7/19.
//  Copyright © 2019 fuxsociety. All rights reserved.
//

#import "CategoryRow.h"
#import "DataManager.h"
@implementation CategoryRow
- (void)bindData:(Category*)category
{
    [self.categoryNameLabel setText:category.name];

    NSString* selectedCategoryValue = [[DataManager shareInstanced] getSelectedCategoryValue];
    if ([selectedCategoryValue isEqualToString:category.value]) {
        [self.contentContainer setBackgroundColor:[UIColor lightGrayColor]];
    } else {
        [self.contentContainer setBackgroundColor:[UIColor clearColor]];
    }
}
@end
