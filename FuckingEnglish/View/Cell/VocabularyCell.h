//
//  VocabularyCell.h
//  FuckingEnglish
//
//  Created by fuxsociety on 11/8/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VocabularyCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UILabel *wordLabel;
@property (nonatomic, weak) IBOutlet UILabel *meanLabel;
@end

NS_ASSUME_NONNULL_END
