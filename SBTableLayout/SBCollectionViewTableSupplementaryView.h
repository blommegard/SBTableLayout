//
//  SBCollectionViewTableSupplementaryView.h
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A helper class to create footer/header views looking like the ones on a grouped UITableView
 */
@interface SBCollectionViewTableSupplementaryView : UICollectionReusableView

/**
 Label pre sized accordingly, inseted 10pt from every edge, numberOfLined set to 0.
 */
@property (nonatomic, strong) UILabel *label;

/**
 Ruturns the size (calculated height + width) for the whole view.
 
 @param width The bounding width for the view, this will be returned as the width as well.
 
 @param string The atteributed string to be rendered by the label in this view.
 
 @return Ruturns the size (calculated height + width) for the whole view.
 */
+ (CGSize)sizeForWidth:(CGFloat)width atteributedString:(NSAttributedString *)string;

/**
 Ruturns an attributet string with matching style as the header/footer for UITableView.
 
 @param kind The kind of supplementary element, only UICollectionElementKindSectionHeader or UICollectionElementKindSectionFooter is supported.
 
 @param text The text to be rendered.
 
 @return Ruturns an attributet string with matching style as the header/footer for UITableView.
 */
+ (NSAttributedString *)atteributedStringForKind:(NSString *)kind text:(NSString *)text;

@end
