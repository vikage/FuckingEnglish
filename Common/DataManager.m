//
//  DataManager.m
//  FuckingEnglishAppleWatch Extension
//
//  Created by fuxsociety on 11/7/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "DataManager.h"
@interface DataManager()
@property (nonatomic, strong) NSArray *vocaburies;
@end
@implementation DataManager
{
    
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

-(void) loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Vocabularies" ofType:@"plist"];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *wordsDict = [data objectForKey:@"words"];
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

-(Vocabulary *)getAnyVocabulary
{
    int randomNumber = arc4random();
    int index = randomNumber%self.vocaburies.count;
    
    return [self.vocaburies objectAtIndex:index];
}

-(NSArray<Vocabulary *> *)allVocabulary
{
    return self.vocaburies;
}
@end
