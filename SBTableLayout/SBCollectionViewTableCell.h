//
//  SBCollectionViewTableCell.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SBCollectionViewTableCellSeparatorView;

/**
 The class of a table cell in the layout, handles the separator views.
 */
@interface SBCollectionViewTableCell : UICollectionViewCell

/**
 The separator view displayd at the top of top and single cells.
 */
@property (nonatomic, strong) SBCollectionViewTableCellSeparatorView *topSeparatorView;

/**
 The separator view displayd at the bottom of bottom and single cells.
 */
@property (nonatomic, strong) SBCollectionViewTableCellSeparatorView *bottomSeparatorView;

/**
 The separator view displayd at the bottom of top and middle cells.
 */
@property (nonatomic, strong) SBCollectionViewTableCellSeparatorView *middleSeparatorView;

@end
