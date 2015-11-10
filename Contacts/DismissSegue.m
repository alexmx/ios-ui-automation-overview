//
//  DismissSegue.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/10/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
