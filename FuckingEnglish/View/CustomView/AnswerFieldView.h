//
//  AnswerFieldView.h
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AnswerFieldViewDelegate;

@interface AnswerFieldView : UIView
@property (weak, nonatomic) IBOutlet id<AnswerFieldViewDelegate> delegate;
@property (nonatomic, weak) IBOutlet UILabel *wordLabel;
@property (nonatomic, weak) IBOutlet UILabel *pronunciationLabel;
@property (nonatomic, strong) Vocabulary *word;

- (void)markAsCorrect;
- (void)markAsWrong;
- (void)resetUI;
- (void)shake;
- (IBAction)speakButtonDidTap:(id)sender;
@end

@protocol AnswerFieldViewDelegate <NSObject>

- (void)answerFieldDidSelect:(AnswerFieldView *)field;

@end

NS_ASSUME_NONNULL_END
