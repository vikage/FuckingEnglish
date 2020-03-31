//
//  AnswerFieldView.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "AnswerFieldView.h"
#import "Utils.h"
@implementation AnswerFieldView

- (void)setWord:(Vocabulary *)word {
    _word = word;
    
    NSMutableAttributedString *categoryAndPronunciationAtt = [[NSMutableAttributedString alloc] init];
    [categoryAndPronunciationAtt appendAttributedString:[[NSAttributedString alloc] initWithString:word.category attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor}]];
    [categoryAndPronunciationAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@"•" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    [categoryAndPronunciationAtt appendAttributedString:[[NSAttributedString alloc] initWithString:word.pronunciation attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x92B558)}]];
    
    self.wordLabel.text = word.word;
    self.pronunciationLabel.attributedText = categoryAndPronunciationAtt;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [touches.anyObject locationInView:self];
    
    if (CGRectContainsPoint(self.bounds, location))
    {
//        [self.word.word normalSpeech];
        [self.delegate answerFieldDidSelect:self];
    }
    
    self.alpha = 1;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.alpha = 0.7;
}

- (void)markAsCorrect {
    self.backgroundColor = [UIColorFromRGB(0x88B04B) colorWithAlphaComponent:0.5];
}

- (void)markAsWrong {
    self.backgroundColor = [UIColor.redColor colorWithAlphaComponent:0.5];
}

- (void)resetUI {
    self.backgroundColor = UIColorFromRGB(0x222223);
}

- (void)shake {
    CGFloat duration = 0.3;
    CGFloat frameDuration = duration/4;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:duration * 0 relativeDuration:frameDuration animations:^{
            self.transform = CGAffineTransformMakeTranslation(-10, 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:duration * 1 relativeDuration:frameDuration animations:^{
            self.transform = CGAffineTransformMakeTranslation(10, 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:duration * 2 relativeDuration:frameDuration animations:^{
            self.transform = CGAffineTransformMakeTranslation(-5, 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:duration * 3 relativeDuration:frameDuration animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)speakButtonDidTap:(id)sender {
    [self.word.word slowSpeech];
}

@end
