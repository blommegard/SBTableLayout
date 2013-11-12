//
//  SBCollectionViewTableCell.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBCollectionViewTableCell.h"
#import "SBCollectionViewTableLayoutAttributes.h"
#import "SBCollectionViewTableCellSeparatorView.h"
#import "UIColor+SBCollectionViewTableLayoutColors.h"

@implementation SBCollectionViewTableCell

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    [backgroundView setBackgroundColor:[UIColor sb_cellBackgroundColor]];
    [self setBackgroundView:backgroundView];
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    [selectedBackgroundView setBackgroundColor:[UIColor sb_cellSelectedBacgroundColor]];
    [self setSelectedBackgroundView:selectedBackgroundView];
    
    _topSeparatorView = [SBCollectionViewTableCellSeparatorView new];
    _bottomSeparatorView = [SBCollectionViewTableCellSeparatorView new];
    [self.contentView addSubview:_bottomSeparatorView];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  [self bringSubviewToFront:self.topSeparatorView];
  [self bringSubviewToFront:self.bottomSeparatorView];
}

- (void)applyLayoutAttributes:(SBCollectionViewTableLayoutAttributes *)layoutAttributes {
  [super applyLayoutAttributes:layoutAttributes];
  
  SBCollectionViewTableCellType type = layoutAttributes.cellType;
  
  CGRect topFrame = CGRectMake(0.f, 0.f, CGRectGetWidth(self.bounds), layoutAttributes.borderSeparatorWidth);
  
  BOOL border = (type == SBCollectionViewTableCellTypeSingle || type == SBCollectionViewTableCellTypeBottom);
  CGRect bottomFrame = CGRectMake(border?0.f:layoutAttributes.middleSeparatorInset.left,
                                  CGRectGetHeight(self.bounds)-(border?layoutAttributes.borderSeparatorWidth:layoutAttributes.middleSeparatorWidth),
                                  CGRectGetWidth(self.bounds)-(border?0.f:(layoutAttributes.middleSeparatorInset.left+layoutAttributes.middleSeparatorInset.right)),
                                  border?layoutAttributes.borderSeparatorWidth:layoutAttributes.middleSeparatorWidth);
  
  [self.topSeparatorView setFrame:topFrame];
  [self.bottomSeparatorView setFrame:bottomFrame];
  
  if ((type == SBCollectionViewTableCellTypeTop || type == SBCollectionViewTableCellTypeSingle) && !self.topSeparatorView.superview)
    [self.contentView addSubview:self.topSeparatorView];
  else if (self.topSeparatorView.superview)
    [self.topSeparatorView removeFromSuperview];
}

- (void)setHighlighted:(BOOL)highlighted {
  [super setHighlighted:highlighted];

  [self adjustSeparatorViewsToSelectionAndHighlight:highlighted];
}

- (void)setSelected:(BOOL)selected {
  [super setSelected:selected];
  
  [self adjustSeparatorViewsToSelectionAndHighlight:selected];
}

#pragma mark - Private

// TODO: We should have a better way of doing this. =/
- (void)adjustSeparatorViewsToSelectionAndHighlight:(BOOL)selected {
  UICollectionView *collectionView = (UICollectionView *)self.superview;
  NSIndexPath *selfIndexPath = [collectionView indexPathForCell:self];
  SBCollectionViewTableCell *cell = (SBCollectionViewTableCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:selfIndexPath.item-1 inSection:selfIndexPath.section]];
  
  [self.bottomSeparatorView setHidden:selected];
  [cell.bottomSeparatorView setHidden:selected];
}

@end
