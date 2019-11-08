//
//  DataManager.h
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "Category.h"
#import "Utils.h"
#import "Vocabulary.h"
#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+ (instancetype)shareInstanced;

- (Vocabulary*)getAnyVocabulary;
- (NSArray<Vocabulary*>*)allVocabulary;
- (NSArray<Category*>*)categories;
- (NSString*)getSelectedCategoryValue;
- (void)setSelectedCategoryValue:(NSString*)value;
@end
