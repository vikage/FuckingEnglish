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

extern NSNotificationName const SelectedCategoryDidChangeNotification;

@interface DataManager : NSObject
+ (instancetype)shareInstanced;

- (Vocabulary*)getAnyVocabulary;
- (NSArray<Vocabulary*>*)allVocabularyInSelectedCategory;
- (NSArray<Vocabulary*>*)getVocabularyInCategory:(Category *)category;
- (NSArray<Category*>*)categories;
- (void)setSelectedCategory:(Category *)category;
- (Category *)selectedCategory;
@end
