//
//  Contact.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)init
{
    if (self = [super init]) {
        self.icon = [UIImage imageNamed:@"contact-icon"];
    }
    
    return self;
}

@end
