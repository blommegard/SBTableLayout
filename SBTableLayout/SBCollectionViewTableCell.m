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
    _middleSeparatorView = [SBCollectionViewTableCellSeparatorView new];
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
  
  CGRect topFrame = CGRectMake(0.f,
                               0.f,
                               CGRectGetWidth(self.bounds),
                               layoutAttributes.borderSeparatorWidth);
  CGRect bottomFrame = CGRectMake(0.f,
                                  CGRectGetHeight(self.bounds)-layoutAttributes.borderSeparatorWidth,
                                  CGRectGetWidth(self.bounds),
                                  layoutAttributes.borderSeparatorWidth);
  CGRect middleFrame = CGRectMake(layoutAttributes.middleSeparatorInset.left,
                                  CGRectGetHeight(self.bounds)-layoutAttributes.middleSeparatorWidth,
                                  CGRectGetWidth(self.bounds)-layoutAttributes.middleSeparatorInset.left+layoutAttributes.middleSeparatorInset.right,
                                  layoutAttributes.middleSeparatorWidth);
  
  [self.topSeparatorView setFrame:topFrame];
  [self.bottomSeparatorView setFrame:bottomFrame];
  [self.middleSeparatorView setFrame:middleFrame];
  
  if ((type == SBCollectionViewTableCellTypeTop || type == SBCollectionViewTableCellTypeSingle))
    [self addSubview:self.topSeparatorView];
  else if (self.topSeparatorView.superview)
    [self.topSeparatorView removeFromSuperview];

  if ((type == SBCollectionViewTableCellTypeBottom || type == SBCollectionViewTableCellTypeSingle))
    [self addSubview:self.bottomSeparatorView];
  else if (self.bottomSeparatorView.superview)
    [self.bottomSeparatorView removeFromSuperview];
  
  if ((type == SBCollectionViewTableCellTypeMiddle || type == SBCollectionViewTableCellTypeTop))
    [self addSubview:self.middleSeparatorView];
  else if (self.middleSeparatorView.superview)
    [self.middleSeparatorView removeFromSuperview];
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
  
  [self.bottomSeparatorView.superview?self.bottomSeparatorView:self.middleSeparatorView setHidden:selected];
  [cell.bottomSeparatorView.superview?cell.bottomSeparatorView:cell.middleSeparatorView setHidden:selected];
}

@end
