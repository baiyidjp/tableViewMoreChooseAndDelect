//
//  NSString+Extonsion.m
//  01-新浪微博(UITabarButton)
//
//  Created by I Smile going on 15/8/3.
//  Copyright (c) 2015年 I Smile going. All rights reserved.
//

#import "NSString+Extonsion.h"

@implementation NSString (Extonsion)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    
    return [self sizeWithAttributes:dict];
}

@end
