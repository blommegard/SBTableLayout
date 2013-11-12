//
//  UIColor+SBCollectionViewTableLayoutColors.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A helper class with the default colors a grouped UITableView uses.
 */
@interface UIColor (SBCollectionViewTableLayoutColors)

/**
 Returns the default color of a separator used in a grouped UITableView 

 @return Returns the default color of a separator used in a grouped UITableView
 */
+ (UIColor *)sb_cellSeparatorColor;

/**
 Returns the default color of a cell background used in a grouped UITableView
 
 @return Returns the default color of a cell background used in a grouped UITableView
 */+ (UIColor *)sb_cellBackgroundColor;

/**
 Returns the default color of a selected cell background used in a grouped UITableView
 
 @return Returns the default color of a selected cell background used in a grouped UITableView
 */
+ (UIColor *)sb_cellSelectedBacgroundColor;

/**
 Returns the default color of the background in a grouped UITableView
 
 @return Returns the default color of the background in a grouped UITableView
 */
+ (UIColor *)sb_tableBackgroundColor;

/**
 Returns the default text color of the header / footer text in a grouped UITableView
 
 @return Returns the default text color of the header / footer text in a grouped UITableView
 */
+ (UIColor *)sb_supplementaryViewTextColor;

@end
