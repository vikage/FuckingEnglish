//
//  ViewController.m
//  FuckingEnglish
//
//  Created by fuxsociety on 11/6/18.
//  Copyright © 2018 fuxsociety. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "VocabularyCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (nonatomic, strong) NSArray *vocabularies;
@property (nonatomic, strong) NSDictionary *vocabularyDataDict;
@property (nonatomic, strong) NSDictionary *vocabularySearchData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

-(void) config {
    self.vocabularies = [[[DataManager shareInstanced] allVocabulary] sortedArrayUsingComparator:^NSComparisonResult(Vocabulary *  _Nonnull obj1, Vocabulary *  _Nonnull obj2) {
        return [obj1.word compare:obj2.word];
    }];
    
    self.vocabularyDataDict = [self buildDataWithSource:self.vocabularies];
    
    self.vocabularyTableView.rowHeight = UITableViewAutomaticDimension;
    self.vocabularyTableView.estimatedRowHeight = 60;
    self.vocabularyTableView.dataSource = self;
    self.vocabularyTableView.delegate = self;
    self.vocabularyTableView.sectionIndexColor = [UIColor whiteColor];
    [self.vocabularyTableView reloadData];
    
    self.searchBar.delegate = self;
    self.searchBar.autocapitalizationType = UITextAutocorrectionTypeNo;
}

-(NSDictionary *) buildDataWithSource:(NSArray *)vocabularies {
    NSMutableDictionary * resultDict = [[NSMutableDictionary alloc] init];
    for (Vocabulary *vocabulary in vocabularies) {
        NSString *firstCharacterString = [vocabulary.word substringToIndex:1];
        
        NSMutableArray *vocabulariesInSection = [resultDict objectForKey:firstCharacterString];
        if (!vocabulariesInSection) {
            vocabulariesInSection = [[NSMutableArray alloc] init];
        }
        
        [vocabulariesInSection addObject:vocabulary];
        
        [resultDict setObject:vocabulariesInSection forKey:firstCharacterString];
    }
    
    return resultDict;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark - UITableViewDatasource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.allKeys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionTitles = [self getSessionIndexTitle];
    NSString *sectionTitle = [sectionTitles objectAtIndex:section];
    NSArray *vocabulariesInSection = [self.dataSource objectForKey:sectionTitle];
    
    return vocabulariesInSection.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionTitles = [self getSessionIndexTitle];
    NSString *sectionTitle = [sectionTitles objectAtIndex:indexPath.section];
    NSArray *vocabulariesInSection = [self.dataSource objectForKey:sectionTitle];
    
    VocabularyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VocabularyCell"];
    Vocabulary *vocabulary = [vocabulariesInSection objectAtIndex:indexPath.row];
    
    NSMutableAttributedString *headerAtt = [[NSMutableAttributedString alloc] init];
    [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.word attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x8D9440)}]];
    [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@"•" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    [headerAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.pronunciation attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xE47A2E)}]];
    
    NSMutableAttributedString *categoryAndMeanAtt = [[NSMutableAttributedString alloc] init];
    [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.category attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xF0EAD6)}]];
    [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@"•" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    [categoryAndMeanAtt appendAttributedString:[[NSAttributedString alloc] initWithString:vocabulary.mean attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x92B558)}]];
    
    cell.wordLabel.attributedText = headerAtt;
    cell.meanLabel.attributedText = categoryAndMeanAtt;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self getSessionIndexTitle];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSArray *titles = [self getSessionIndexTitle];
    
    return [titles indexOfObject:title];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - Search bar
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSMutableArray *searchedData = [[NSMutableArray alloc] init];
    for (Vocabulary *vocabulary in self.vocabularies) {
        if ([vocabulary.word.lowercaseString containsString:searchText.lowercaseString]) {
            [searchedData addObject:vocabulary];
        }
    }
    
    self.vocabularySearchData = [self buildDataWithSource:searchedData];
    [self.vocabularyTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
}

#pragma mark - Data provider
-(NSDictionary *) dataSource {
    if (self.searchBar.text.length != 0) {
        return self.vocabularySearchData;
    }
    
    return self.vocabularyDataDict;
}

-(NSArray *) getSessionIndexTitle {
    NSArray *titles = [self.dataSource allKeys];
    
    return [titles sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
}
@end
