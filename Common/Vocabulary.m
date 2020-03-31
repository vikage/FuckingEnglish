//
//  Vocabulary.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "Vocabulary.h"

@implementation Vocabulary
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.word, self.mean];
}
@end
