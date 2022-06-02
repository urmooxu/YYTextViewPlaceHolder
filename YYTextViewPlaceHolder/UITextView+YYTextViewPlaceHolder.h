//
//  UITextView+YYTextViewPlaceHolder.h
//  OCTest
//
//  Created by yangyuan on 2022/6/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (YYTextViewPlaceHolder)

- (void)yy_settextViewPlaceHolderWithText:(NSString *)text textColor:(nullable UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END
