//
//  UIColor+SBCollectionViewTableLayoutColors.m
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "UIColor+SBCollectionViewTableLayoutColors.h"

@implementation UIColor (SBCollectionViewTableLayoutColors)

+ (UIColor *)sb_cellSeparatorColor {
  return [UIColor colorWithRed:0.784 green:0.780 blue:0.800 alpha:1.000];
}

+ (UIColor *)sb_cellBackgroundColor {
  return [UIColor whiteColor];
}

+ (UIColor *)sb_cellSelectedBacgroundColor {
  return [UIColor colorWithWhite:0.851 alpha:1.000];
}

+ (UIColor *)sb_tableBackgroundColor {
  return [UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.000];
}

+ (UIColor *)sb_supplementaryViewTextColor {
  return [UIColor colorWithRed:0.427 green:0.427 blue:0.447 alpha:1.000];
}

@end
