//
//  UITextView+YYTextViewPlaceHolder.m
//  OCTest
//
//  Created by yangyuan on 2022/6/2.
//

#import "UITextView+YYTextViewPlaceHolder.h"
#import <objc/runtime.h>

static const char *yy_textViewPlaceHolder_key = "yy_textViewPlaceHolder_key";

@interface UITextView (YYTextViewPlaceHolder)

@property(nonatomic, strong) UITextView *yy_textViewPlaceHolder;

@end


@implementation UITextView (YYTextViewPlaceHolder)

- (void)setYy_textViewPlaceHolder:(UITextView *)yy_textViewPlaceHolder {
    objc_setAssociatedObject(self, yy_textViewPlaceHolder_key, yy_textViewPlaceHolder, OBJC_ASSOCIATION_RETAIN);
}

- (UITextView *)yy_textViewPlaceHolder {
    return objc_getAssociatedObject(self, yy_textViewPlaceHolder_key);
}

- (void)yy_settextViewPlaceHolderWithText:(NSString *)text textColor:(nullable UIColor *)textColor {
    if (!self.yy_textViewPlaceHolder) {
        self.yy_textViewPlaceHolder = [[UITextView alloc] initWithFrame:self.bounds];
        self.yy_textViewPlaceHolder.backgroundColor = [UIColor clearColor];
        self.yy_textViewPlaceHolder.text = text;
        self.yy_textViewPlaceHolder.textColor = textColor ? textColor : [UIColor grayColor];
        self.yy_textViewPlaceHolder.font = self.font;
        self.yy_textViewPlaceHolder.userInteractionEnabled = NO;
        [self addSubview:self.yy_textViewPlaceHolder];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (void)textViewTextDidChange {
    self.yy_textViewPlaceHolder.hidden = ![self.text isEqualToString:@""];
}

@end
