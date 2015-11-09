//
//  ContactCell.h
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;

@interface ContactCell : UITableViewCell

@property (nonatomic, strong) UIImage *contactIcon;
@property (nonatomic, copy) NSString *contactName;

@property (nonatomic, strong) Contact *contact;

@end
