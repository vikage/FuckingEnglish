//
//  InterfaceController.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/6/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "InterfaceController.h"
#import "Vocabulary.h"
#import "DataManager.h"
#import "VocabularyRow.h"

@interface InterfaceController ()
@property (nonatomic, strong) NSArray<Vocabulary *> *vocabularies;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self reloadTable];
    // Configure interface objects here.
}

- (void)willActivate {
    
    
    [super willActivate];
}

-(void) reloadTable {
    self.vocabularies = [[DataManager shareInstanced] allVocabulary];
    [self.vocabularyTable setNumberOfRows:self.vocabularies.count withRowType:@"VocabularyRow"];
    for (int i = 0; i < self.vocabularies.count; i++) {
        VocabularyRow *row = [self.vocabularyTable rowControllerAtIndex:i];
        Vocabulary *vocabulary = [self.vocabularies objectAtIndex:i];
        
        NSMutableAttributedString *headerAtt = [[NSMutableAttributedString alloc] init];
        [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.word attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x8D9440)}]];
        [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@"•" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
        [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.pronunciation attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xE47A2E)}]];
        
        NSMutableAttributedString *categoryAndMeanAtt = [[NSMutableAttributedString alloc] init];
        [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.category attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xF0EAD6)}]];
        [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@"•" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
        [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.mean attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x92B558)}]];
        
        [row.wordLabel setAttributedText:headerAtt];
        [row.meanLabel setAttributedText:categoryAndMeanAtt];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



