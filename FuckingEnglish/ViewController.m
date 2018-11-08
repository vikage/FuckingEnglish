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
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *vocabularies;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

-(void) config {
    self.vocabularies = [[DataManager shareInstanced] allVocabulary];
    self.vocabularyTableView.rowHeight = UITableViewAutomaticDimension;
    self.vocabularyTableView.estimatedRowHeight = 60;
    self.vocabularyTableView.dataSource = self;
    self.vocabularyTableView.delegate = self;
    [self.vocabularyTableView reloadData];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark - UITableViewDatasource, UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vocabularies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VocabularyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VocabularyCell"];
    Vocabulary *vocabulary = [self.vocabularies objectAtIndex:indexPath.row];
    
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
@end
