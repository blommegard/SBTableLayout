//
//  SBCollectionViewTableCellSeparatorView.m
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBCollectionViewTableCellSeparatorView.h"
#import "UIColor+SBCollectionViewTableLayoutColors.h"

@implementation SBCollectionViewTableCellSeparatorView

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setBackgroundColor:[UIColor sb_cellSeparatorColor]];
  }
  return self;
}

@end
