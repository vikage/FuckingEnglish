//
//  CategoryCell.h
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface CategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)bindCategory:(Category*)category;
@end

NS_ASSUME_NONNULL_END
