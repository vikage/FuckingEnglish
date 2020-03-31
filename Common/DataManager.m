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
NSNotificationName const SelectedCategoryDidChangeNotification = @"SelectedCategoryDidChangeNotification";

@interface DataManager()
@property (nonatomic, strong) NSArray *vocaburies;
@end
@implementation DataManager
{
    NSString* currentCategory;
    Category* _selectedCategory;
}

+(instancetype) shareInstanced
{
    static dispatch_once_t onceToken;
    static DataManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[DataManager alloc] init];
        [instance loadData];
    });
    
    return instance;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

- (void)reloadDataFromCategory:(Category*)category
{
    self.vocaburies = [self getVocabularyInCategory:category];
}

- (void)reloadSelectedCategoryIfNeed
{
    Category *selectedCategory = [DataManager.shareInstanced selectedCategory];
    if (![currentCategory isEqualToString:selectedCategory.value]) {
        [self reloadDataFromCategory:selectedCategory];
    }
}

- (void)loadData
{
    Category *selectedCategory = [self selectedCategory];
    [self reloadDataFromCategory:selectedCategory];
}

-(Vocabulary *)getAnyVocabulary
{
    [self reloadSelectedCategoryIfNeed];
    int randomNumber = arc4random();
    int index = randomNumber%self.vocaburies.count;
    
    return [self.vocaburies objectAtIndex:index];
}

-(NSArray<Vocabulary *> *)allVocabularyInSelectedCategory
{
    [self reloadSelectedCategoryIfNeed];
    return self.vocaburies;
}

- (NSArray<Vocabulary *> *)getVocabularyInCategory:(Category *)category {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:category.value ofType:@"json"];
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
    
    return vocabularies;
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

- (void)setSelectedCategory:(Category *)category
{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:category.value forKey:kSelectedCategoryKey];
    [userDefault synchronize];
    
    _selectedCategory = category;
    
    [NSNotificationCenter.defaultCenter postNotificationName:SelectedCategoryDidChangeNotification object:nil];
}

- (Category *)selectedCategory {
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    NSString* selectedCategoryValue = [userDefault objectForKey:kSelectedCategoryKey];
    
    if (!selectedCategoryValue)
    {
        selectedCategoryValue = kDefaultCategory;
    }

    for (Category *category in self.categories)
    {
        if ([category.value isEqualToString:selectedCategoryValue])
        {
            return category;
        }
    }
    
    return nil;
}
@end
