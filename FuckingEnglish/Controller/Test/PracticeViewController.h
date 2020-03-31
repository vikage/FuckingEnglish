//
//  PracticeViewController.h
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"
#import "AnswerFieldView.h"
NS_ASSUME_NONNULL_BEGIN

@interface PracticeViewController : UIViewController
@property (nonatomic, strong) NSArray<Vocabulary*> *vocabularies;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *meanLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctStatisticLabel;
@property (strong, nonatomic) IBOutletCollection(AnswerFieldView) NSArray *answerFields;
@property (weak, nonatomic) IBOutlet UIView *choiceContainerView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UISwitch *autoNextSwitch;

- (IBAction)closeButtonDidTap:(id)sender;
- (IBAction)nextButtonDidTap:(id)sender;

@end

NS_ASSUME_NONNULL_END
