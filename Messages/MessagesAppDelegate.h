//
//  MessagesAppDelegate.h
//  Messages
//
//  Created by Liam on 8/14/12.
//  Copyright (c) 2012 Liam McArdle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessagesViewController;

@interface MessagesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MessagesViewController *viewController;

@end
