//
//  DataManager.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "DataManager.h"
#define kSelectedCategoryKey @"kSelectedCategoryKey"
#define kDefaultCategory @"words"
@interface DataManager()
@property (nonatomic, strong) NSArray *vocaburies;
@end
@implementation DataManager
{
    NSString* currentCategory;
}

+(instancetype) shareInstanced
{
    static dispatch_once_t onceToken;
    static DataManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[DataManager alloc] init];
    });
    
    return instance;
}

-(instancetype)init
{
    self = [super init];
    [self loadData];
    return self;
}

- (void)reloadDataFromCategory:(NSString*)category
{
    if (!category) {
        category = kDefaultCategory;
    }

    currentCategory = category;
    NSString* filePath = [[NSBundle mainBundle] pathForResource:category ofType:@"json"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray* wordsDict = [json objectForKey:@"words"];
    NSMutableArray *vocabularies = [[NSMutableArray alloc] init];
    for (NSDictionary *wordDict in wordsDict) {
        NSString *word = [wordDict objectForKey:@"word"];
        NSString *pronunciation = [wordDict objectForKey:@"pronunciation"];
        NSString *mean = [wordDict objectForKey:@"mean"];
        NSString *category = [wordDict objectForKey:@"category"];
        
        Vocabulary *obj = [[Vocabulary alloc] init];
        obj.word = word;
        obj.pronunciation = pronunciation;
        obj.mean = mean;
        obj.category = category;
        
        [vocabularies addObject:obj];
    }
    
    self.vocaburies = vocabularies;
}

- (void)reloadSelectedCategoryIfNeed
{
    NSString* selectedCategory = [self getSelectedCategoryValue];
    if (![currentCategory isEqualToString:selectedCategory]) {
        [self reloadDataFromCategory:selectedCategory];
    }
}

- (void)loadData
{
    NSString* selectedCategory = [[NSUserDefaults standardUserDefaults] objectForKey:kSelectedCategoryKey];
    [self reloadDataFromCategory:selectedCategory];
}

-(Vocabulary *)getAnyVocabulary
{
    [self reloadSelectedCategoryIfNeed];
    int randomNumber = arc4random();
    int index = randomNumber%self.vocaburies.count;
    
    return [self.vocaburies objectAtIndex:index];
}

-(NSArray<Vocabulary *> *)allVocabulary
{
    [self reloadSelectedCategoryIfNeed];
    return self.vocaburies;
}

- (NSArray<Category*>*)categories
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"json"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    NSArray* categoriesData = [json objectForKey:@"categories"];
    NSMutableArray* categories = [[NSMutableArray alloc] init];
    for (NSDictionary* categoryJson in categoriesData) {
        Category* category = [[Category alloc] initWithDictionary:categoryJson];
        [categories addObject:category];
    }

    return categories;
}

- (NSString*)getSelectedCategoryValue
{
    NSUserDefaults* userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.fuckingEnglish"];
    NSString* selected = [userDefault objectForKey:kSelectedCategoryKey];
    return selected ? selected : kDefaultCategory;
}

- (void)setSelectedCategoryValue:(NSString*)value
{
    NSUserDefaults* userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.fuckingEnglish"];
    [userDefault setObject:value forKey:kSelectedCategoryKey];
    [userDefault synchronize];
}
@end
