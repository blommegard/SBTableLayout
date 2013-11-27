//
//  SBCollectionViewTableSupplementaryView.m
//  SBTableLayout
//
//  Created by Simon Blommegård on 2013-11-11.
//  Copyright (c) 2013 Simon Blommegård. All rights reserved.
//

#import "SBCollectionViewTableSupplementaryView.h"
#import "UIColor+SBCollectionViewTableLayoutColors.h"

static UIEdgeInsets paddning = {10.f, 12.f, 10.f, 10.f};

@implementation SBCollectionViewTableSupplementaryView

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self addSubview:self.label];
  }
  return self;
}

#pragma mark - Properties

- (UILabel *)label {
  if (!_label) {
    _label = [[UILabel alloc] initWithFrame:UIEdgeInsetsInsetRect(self.bounds, paddning)];
    [_label setBackgroundColor:[UIColor sb_tableBackgroundColor]];
    [_label setTextColor:[UIColor sb_supplementaryViewTextColor]];
    [_label setNumberOfLines:0];
  }
  return _label;
}

#pragma mark -

+ (CGSize)sizeForWidth:(CGFloat)width atteributedString:(NSAttributedString *)string {
  CGRect rect = [string boundingRectWithSize:CGSizeMake(width-paddning.left-paddning.right, CGFLOAT_MAX)
                                     options:(NSStringDrawingUsesLineFragmentOrigin)
                                     context:nil];
  
  return CGSizeMake(width, CGRectGetHeight(rect)+paddning.top+paddning.bottom);
}

+ (NSAttributedString *)atteributedStringForKind:(NSString *)kind text:(NSString *)text {
  NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
  [paragraphStyle setAlignment:NSTextAlignmentLeft];
  UIFont *font;
  
  if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    font = [UIFont systemFontOfSize:14.f];
    text = [text uppercaseString];
  }
  else {
    font = [UIFont systemFontOfSize:12.f];
  }
  
  NSDictionary *attributes = @{
                               NSFontAttributeName:font,
                               NSParagraphStyleAttributeName:paragraphStyle,
                               };
  
  return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

@end
