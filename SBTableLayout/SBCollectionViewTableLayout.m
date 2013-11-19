//
//  SBCollectionViewTableLayout.m
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBCollectionViewTableLayout.h"
#import "SBCollectionViewTableLayoutAttributes.h"

@interface SBCollectionViewTableLayout ()
@property (nonatomic) UIEdgeInsets *middleSeparatorInsets;
@property (nonatomic) CGFloat *borderSeparatorWidths;
@property (nonatomic) CGFloat *middleSeparatorWidths;
@end

@implementation SBCollectionViewTableLayout

+ (Class)layoutAttributesClass {
  return [SBCollectionViewTableLayoutAttributes class];
}

- (id)init {
  if (self = [super init]) {
    CGFloat scale = [UIScreen mainScreen].scale;
    
    _middleSeparatorInset = UIEdgeInsetsMake(0.f, 15.f, 0.f, 0.f);
    _borderSeparatorWidth = 1.f/scale;
    _middleSeparatorWidth = 1.f/scale;
    
    [self setMinimumLineSpacing:0.f];
    [self setMinimumInteritemSpacing:0.f];
  }
  
  return self;
}

- (void)dealloc {
  if (_middleSeparatorInsets) free(_middleSeparatorInsets);
  if (_borderSeparatorWidths) free(_borderSeparatorWidths);
  if (_middleSeparatorWidths) free(_middleSeparatorWidths);
}

- (void)prepareLayout {
  [super prepareLayout];
  
  id <SBCollectionViewDelegateTableLayout> delegate = (id <SBCollectionViewDelegateTableLayout>)self.collectionView.delegate;
  BOOL inset = [delegate respondsToSelector:@selector(collectionView:layout:middleSeparatorInsetForSectionAntIndex:)];
  BOOL borderWidth = [delegate respondsToSelector:@selector(collectionView:layout:borderSeparatorWidthForSectionAntIndex:)];
  BOOL middleWidth = [delegate respondsToSelector:@selector(collectionView:layout:middleSeparatorWidthForSectionAntIndex:)];
  
  
  if (inset || borderWidth || middleWidth) {
    NSInteger sections = [self.collectionView numberOfSections];
    
    // TODO: realloc
    if (_middleSeparatorInsets) free(_middleSeparatorInsets);
    if (inset) _middleSeparatorInsets = malloc(sizeof(UIEdgeInsets)*sections);
    
    if (_borderSeparatorWidths) free(_borderSeparatorWidths);
    if (borderWidth) _borderSeparatorWidths = malloc(sizeof(CGFloat)*sections);
    
    if (_middleSeparatorWidths) free(_middleSeparatorWidths);
    if (middleWidth) _middleSeparatorWidths = malloc(sizeof(CGFloat)*sections);
    
                                               
    for (NSInteger section = 0; section < sections; section++) {
      if (inset)
        _middleSeparatorInsets[section] = [delegate collectionView:self.collectionView
                                                            layout:self
                            middleSeparatorInsetForSectionAntIndex:section];
      
      if (borderWidth)
        _borderSeparatorWidths[section] = [delegate collectionView:self.collectionView
                                                            layout:self
                            borderSeparatorWidthForSectionAntIndex:section];
      
      if (middleWidth)
        _middleSeparatorWidths[section] = [delegate collectionView:self.collectionView
                                                            layout:self
                            middleSeparatorWidthForSectionAntIndex:section];
    }
  }
  
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
  NSArray *allAttributes = [super layoutAttributesForElementsInRect:rect];
  NSMutableArray *array = [NSMutableArray arrayWithArray:allAttributes];
  
  for (SBCollectionViewTableLayoutAttributes *attributes in allAttributes)
    if (attributes.representedElementCategory == UICollectionElementCategoryCell) {
      NSIndexPath *indexPath = attributes.indexPath;
      NSInteger rows = [self.collectionView numberOfItemsInSection:indexPath.section];
      
      if (indexPath.row == 0)
        [attributes setCellType:(rows == 1)?SBCollectionViewTableCellTypeSingle:SBCollectionViewTableCellTypeTop];
      else if (indexPath.row == (rows-1))
        [attributes setCellType:SBCollectionViewTableCellTypeBottom];
      else
        [attributes setCellType:SBCollectionViewTableCellTypeMiddle];
      
      [attributes setMiddleSeparatorInset:_middleSeparatorInsets?_middleSeparatorInsets[indexPath.section]:_middleSeparatorInset];
      [attributes setBorderSeparatorWidth:_borderSeparatorWidths?_borderSeparatorWidths[indexPath.section]:_borderSeparatorWidth];
      [attributes setMiddleSeparatorWidth:_middleSeparatorWidths?_middleSeparatorWidths[indexPath.section]:_middleSeparatorWidth];
    }
  
  return [array copy];
}

@end
