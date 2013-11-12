//
//  SBCollectionViewTableLayoutAttributes.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SBCollectionViewTableCellType) {
  SBCollectionViewTableCellTypeTop,
  SBCollectionViewTableCellTypeMiddle,
  SBCollectionViewTableCellTypeBottom,
  SBCollectionViewTableCellTypeSingle
};

/**
 The custom layout attributes class for storing information about the separators.
 This class i populated by the layout class.
 */
@interface SBCollectionViewTableLayoutAttributes : UICollectionViewLayoutAttributes

/**
 Type of the cell, top, middle, bottom or single.
 */
@property (nonatomic) SBCollectionViewTableCellType cellType;

/**
 Inset of the middle separator, only the left and right values are respected. Defaults to L=15.f, R=0.f
 */
@property (nonatomic) UIEdgeInsets middleSeparatorInset;

/**
 The border thickness of the separators at the top and bottom of a secion. Defaults to 1.f/scale
 */
@property (nonatomic) CGFloat borderSeparatorWidth;

/**
 The border thickness of the middle separators. Defaults to 1.f/scale
 */
@property (nonatomic) CGFloat middleSeparatorWidth;

@end
