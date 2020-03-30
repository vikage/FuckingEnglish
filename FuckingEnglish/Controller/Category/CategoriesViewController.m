//
//  CategoriesViewController.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/30/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "CategoriesViewController.h"
#import "Category.h"
#import "DataManager.h"
#import "CategoryCell.h"

@interface CategoriesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<Category*>* categories;
@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

- (void)config {
    self.title = @"Select category";
    self.categories = [[DataManager shareInstanced] categories];
    [self configTableView];
}

- (void)configTableView {
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellReuseIdentifier:@"CategoryCell"];
    self.categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.categoryTableView.dataSource = self;
    self.categoryTableView.delegate = self;
    
    UIBarButtonItem *closeBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeBarButtonItemDidTap:)];
    closeBarButtonItem.tintColor = UIColor.whiteColor;
    self.navigationItem.rightBarButtonItem = closeBarButtonItem;
}

- (void)closeBarButtonItemDidTap:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// MARK: - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
    Category *category = [self.categories objectAtIndex:indexPath.row];
    [cell bindCategory:category];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Category *category = [self.categories objectAtIndex:indexPath.row];
    [DataManager.shareInstanced setSelectedCategory:category];
    [tableView reloadData];
}
@end
