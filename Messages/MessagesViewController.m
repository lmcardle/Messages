//
//  MessagesViewController.m
//  Messages
//
//  Created by Liam on 8/14/12.
//  Copyright (c) 2012 Liam McArdle. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@property (nonatomic, strong) NSString *user;
@end

@implementation MessagesViewController{
    NSTimer *timer;
}

@synthesize user = _user;

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)setUser
{
    NSLog(@"setting the user");
    [timer invalidate];
    self.user = [setUserTextField text];
    [setUserTextField resignFirstResponder];
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(checkMessages) userInfo:nil repeats:YES];
    NSLog(@"The user %@ has been set", self.user);
}

- (IBAction)sendMessage
{
    PFObject *sendMessage = [PFObject objectWithClassName:@"msg"];
    [sendMessage setObject:[messageToTextField text] forKey:@"to"];
    [sendMessage setObject:self.user forKey:@"from"];
    [sendMessage setObject:[messageBodyTextField text] forKey:@"body"];
    [sendMessage save];
    [messageToTextField setText:@""];
    [messageBodyTextField setText:@""];
    [messageToTextField resignFirstResponder];
    [messageBodyTextField resignFirstResponder];
}

- (void)checkMessages
{
    NSLog(@"checking messages for user: %@", self.user);
    PFQuery *query = [PFQuery queryWithClassName:@"msg"];
    [query whereKey:@"to" equalTo:self.user];
    [query orderByDescending:@"createdAt"];
    PFObject *message = [query getFirstObject];
    [messageFromTextField setText:[message objectForKey:@"from"]];
    [receivedMessageBody setText:[message objectForKey:@"body"]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    setUserButton = nil;
    setUserTextField = nil;
    messageToTextField = nil;
    messageBodyTextField = nil;
    sendMessageButton = nil;
    messageFromTextField = nil;
    receivedMessageBody = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
