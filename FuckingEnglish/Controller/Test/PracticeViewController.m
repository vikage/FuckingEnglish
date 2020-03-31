//
//  PracticeViewController.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "PracticeViewController.h"
#import "AnswerFieldView.h"
@interface PracticeViewController ()<AnswerFieldViewDelegate>
@property (nonatomic, strong) Vocabulary *currentWord;
@property (nonatomic) NSInteger currentWordIndex;
@property (nonatomic) NSInteger correctCount;
@end

@implementation PracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentWordIndex = -1;
    self.nextButton.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self handleBindNextWord];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)scheduleAutoNextWord {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(handleBindNextWord) withObject:nil afterDelay:3];
}

- (void)handleBindNextWord {
    self.currentWordIndex ++;
    self.progressView.progress = (float)(self.currentWordIndex + 1)/self.vocabularies.count;
    Vocabulary *vocab = [self.vocabularies objectAtIndex:self.currentWordIndex];
    self.currentWord = vocab;
    self.meanLabel.text = vocab.mean;
    
    NSMutableArray *words = [[NSMutableArray alloc] init];
    [words addObject:vocab];
    
    while (words.count != 4)
    {
        NSInteger randomIndex = arc4random() % self.vocabularies.count;
        Vocabulary *other = [self.vocabularies objectAtIndex:randomIndex];
        
        if (![words containsObject:other])
        {
            [words addObject:other];
        }
    }
    
    words = [[words shuffle] mutableCopy];
                          
    for (NSInteger i = 0; i < 4; i++)
    {
        AnswerFieldView *field = [self.answerFields objectAtIndex:i];
        Vocabulary *word = [words objectAtIndex:i];
        [field resetUI];
        
        field.word = word;
    }
    
    self.choiceContainerView.userInteractionEnabled = YES;
    self.correctStatisticLabel.text = [NSString stringWithFormat:@"%d/%d", (int)self.correctCount, (int)self.currentWordIndex];
}

// MARK: - Action
- (IBAction)nextButtonDidTap:(id)sender {
    [self handleBindNextWord];
    self.nextButton.hidden = YES;
}

- (IBAction)closeButtonDidTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// MARK: - AnswerFieldViewDelegate
- (void)answerFieldDidSelect:(AnswerFieldView *)field {
    self.choiceContainerView.userInteractionEnabled = NO;
    UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
    if ([self.currentWord isEqual:field.word])
    {
        [field markAsCorrect];
        [generator notificationOccurred:UINotificationFeedbackTypeSuccess];
        self.correctCount ++;
    } else {
        for (AnswerFieldView *field in self.answerFields)
        {
            if ([field.word isEqual:self.currentWord])
            {
                [field markAsCorrect];
            }
        }
        
        [field markAsWrong];
        [field shake];
        [generator notificationOccurred:UINotificationFeedbackTypeError];
    }
    
    if (self.autoNextSwitch.isOn)
    {
        [self scheduleAutoNextWord];
    } else {
        self.nextButton.hidden = NO;
    }
}


@end
