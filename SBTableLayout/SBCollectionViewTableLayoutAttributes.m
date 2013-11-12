//
//  SBCollectionViewTableLayoutAttributes.m
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBCollectionViewTableLayoutAttributes.h"

@implementation SBCollectionViewTableLayoutAttributes

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
  SBCollectionViewTableLayoutAttributes *attribute = [super copyWithZone:zone];
  attribute->_cellType = _cellType;
  attribute->_middleSeparatorInset = _middleSeparatorInset;
  attribute->_borderSeparatorWidth = _borderSeparatorWidth;
  attribute->_middleSeparatorWidth = _middleSeparatorWidth;
  return attribute;
}

@end
