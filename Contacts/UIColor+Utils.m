//
//  UIColor+Utils.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "UIColor+Utils.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]

@implementation UIColor (Utils)

+ (instancetype)mainColor
{
    return RGBA(255, 45, 85, 1);
}

@end
