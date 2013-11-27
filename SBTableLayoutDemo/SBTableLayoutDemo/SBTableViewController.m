//
//  SBTableViewController.m
//  SBTableLayoutDemo
//
//  Created by Simon Blommegård on 2013-11-10.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBTableViewController.h"

@interface SBTableViewController ()

@end

@implementation SBTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
    [self.tableView setContentInset:UIEdgeInsetsMake(0.f, 0.f, 49.f, 0.f)];
    [self.tableView setScrollIndicatorInsets:self.tableView.contentInset];
  }
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return @"Section Header";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
  return @"Section Footer";
}

@end
