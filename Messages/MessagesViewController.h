//
//  MessagesViewController.h
//  Messages
//
//  Created by Liam on 8/14/12.
//  Copyright (c) 2012 Liam McArdle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MessagesViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UIButton *setUserButton;
    IBOutlet UITextField *setUserTextField;
    IBOutlet UITextField *messageToTextField;
    IBOutlet UITextView *messageBodyTextField;
    IBOutlet UIButton *sendMessageButton;
    IBOutlet UILabel *messageFromTextField;
    IBOutlet UILabel *receivedMessageBody;
}

- (IBAction)setUser;
- (IBAction)sendMessage;

@end
