//
//  SBTableLayoutViewController.m
//  SBTableLayoutDemo
//
//  Created by Simon Blommegård on 2013-11-10.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBTableLayoutViewController.h"
#import "SBCollectionViewTableCell.h"
#import "SBCollectionViewTableLayout.h"
#import "SBCollectionViewTableSupplementaryView.h"
#import "UIColor+SBCollectionViewTableLayoutColors.h"

@interface SBTableLayoutViewController () <UICollectionViewDataSource, SBCollectionViewDelegateTableLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SBCollectionViewTableLayout *layout;
@property (nonatomic, strong) NSDictionary *sectionHeadersFooters;
@end

@implementation SBTableLayoutViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setSectionHeadersFooters:@{@"Header":[SBCollectionViewTableSupplementaryView atteributedStringForKind:UICollectionElementKindSectionHeader text:@"Section Header"],
                                   @"Footer":[SBCollectionViewTableSupplementaryView atteributedStringForKind:UICollectionElementKindSectionFooter text:@"Section Footer"]}];
  
  [self.view addSubview:self.collectionView];
}

#pragma mark -

- (UICollectionView *)collectionView {
  if (!_collectionView) {
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    [_collectionView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView setBackgroundColor:[UIColor sb_tableBackgroundColor]];
    [_collectionView setAlwaysBounceVertical:YES];

    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
      [_collectionView setContentInset:UIEdgeInsetsMake(20.f, 0.f, 49.f, 0.f)];
      [_collectionView setScrollIndicatorInsets:UIEdgeInsetsMake(0.f, 0.f, 49.f, 0.f)];
    }
    
    [_collectionView registerClass:[SBCollectionViewTableCell class] forCellWithReuseIdentifier:@"Cell"];
    [_collectionView registerClass:[SBCollectionViewTableSupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [_collectionView registerClass:[SBCollectionViewTableSupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
  }
  return _collectionView;
}

- (SBCollectionViewTableLayout *)layout {
  if (!_layout) {
    _layout = [SBCollectionViewTableLayout new];
    [_layout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 44.f)];
  }
  return _layout;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return section+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  SBCollectionViewTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  
  return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    SBCollectionViewTableSupplementaryView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    [view.label setAttributedText:self.sectionHeadersFooters[@"Header"]];
    
    return view;
  } else {
    SBCollectionViewTableSupplementaryView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
    [view.label setAttributedText:self.sectionHeadersFooters[@"Footer"]];
    
    return view;
  }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  return [SBCollectionViewTableSupplementaryView sizeForWidth:CGRectGetWidth(collectionView.bounds)
                                            atteributedString:self.sectionHeadersFooters[@"Header"]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
  return [SBCollectionViewTableSupplementaryView sizeForWidth:CGRectGetWidth(collectionView.bounds)
                                            atteributedString:self.sectionHeadersFooters[@"Footer"]];
}

@end
