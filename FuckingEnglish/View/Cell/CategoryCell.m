//
//  CategoryCell.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "CategoryCell.h"
#import "Utils.h"
#import "DataManager.h"
@implementation CategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.containerView.layer.cornerRadius = 10;
    self.containerView.layer.masksToBounds = YES;
    self.containerView.backgroundColor = UIColorFromRGB(0x222223);
    self.categoryNameLabel.textColor = UIColor.whiteColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindCategory:(Category *)category {
    self.categoryNameLabel.text = category.name;
    
    if ([DataManager.shareInstanced.selectedCategory isEqual:category])
    {
        self.containerView.backgroundColor = UIColor.lightGrayColor;
    } else {
        self.containerView.backgroundColor = UIColorFromRGB(0x222223);
    }
}

@end
