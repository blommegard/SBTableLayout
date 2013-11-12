//
//  SBCollectionViewTableLayout.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Protocol for seting the properties on a section basis instead of the whole layout
 */
@protocol SBCollectionViewDelegateTableLayout <UICollectionViewDelegateFlowLayout>
@optional

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout middleSeparatorInsetForSectionAntIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderSeparatorWidthForSectionAntIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout middleSeparatorWidthForSectionAntIndex:(NSInteger)section;

@end

/**
 The layout calculating and collection the different properties.
 */
@interface SBCollectionViewTableLayout : UICollectionViewFlowLayout

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
