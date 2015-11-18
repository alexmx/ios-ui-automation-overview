//
//  ContactCell.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "ContactCell.h"
#import "Contact.h"

@interface ContactCell ()

@property (weak, nonatomic) IBOutlet UIImageView *contactIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;

@end

@implementation ContactCell

- (NSString *)contactName
{
    return self.contactNameLabel.text;
}

- (void)setContactName:(NSString *)contactName
{
    self.contactNameLabel.text = contactName;
}

- (UIImage *)contactIcon
{
    return self.contactIconImageView.image;
}

- (void)setContactIcon:(UIImage *)contactIcon
{
    self.contactIconImageView.image = contactIcon;
}

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    
    self.contactName = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    self.contactIcon = contact.icon;
}

@end
