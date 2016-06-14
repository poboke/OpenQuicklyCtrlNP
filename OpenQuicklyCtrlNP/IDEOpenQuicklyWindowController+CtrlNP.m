//
//  IDEOpenQuicklyWindowController+CtrlNP.m
//  OpenQuicklyCtrlNP
//
//  Created by Jobs on 16/6/14.
//  Copyright © 2016年 Yin Tan. All rights reserved.
//

#import "IDEOpenQuicklyWindowController+CtrlNP.h"
#import "NSObject+Swizzle.h"

@implementation IDEOpenQuicklyWindowController (CtrlNP)

+ (void)load
{
    [self _ty_swizzleInstanceMethod:@selector(control:textView:doCommandBySelector:)
                      withNewMethod:@selector(_cnp_control:textView:doCommandBySelector:)];
}

- (BOOL)_cnp_control:(id)arg1 textView:(id)arg2 doCommandBySelector:(SEL)selector
{
    // <C-j> and <C-k>
    if (selector == NSSelectorFromString(@"noop:") || selector == NSSelectorFromString(@"deleteToEndOfParagraph:")) {
        selector = @selector(moveDown:);
    }
    return [self _cnp_control:arg1 textView:arg2 doCommandBySelector:selector];
}

@end
