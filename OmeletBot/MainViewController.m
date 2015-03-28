//
//  MainViewController.m
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong) IBOutlet NSButton *topLeftButton;
@property (strong) IBOutlet NSButton *topMiddleButton;
@property (strong) IBOutlet NSButton *topRightButton;
@property (strong) IBOutlet NSButton *bottomLeftButton;
@property (strong) IBOutlet NSButton *bottomMiddleButton;
@property (strong) IBOutlet NSButton *bottomRightButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    //Let's allocate the queue here.
    _orders = [NSMutableArray array];

}

//Create a new order and add it to the queue.
- (void)createOrderWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption{
    OmeletOrder *newOrder = [[OmeletOrder alloc]initWithGrillPosition:grillPosition toppingOption:toppingOption];
    //Add this to the queue.
    [_orders enqueue:newOrder];
    [self sendOrder];
}

- (void)pollOmeletBot{
    //Check if Omelet bot has a free channel.
}

- (void)sendOrder{
    //This is where the HTTP request would get sent to poll and send order in.
}
- (IBAction)grillButtonPressed:(id)sender {
    
    NSButton *senderButton = (NSButton *)sender;
    //Show popup menu with options.
    NSLog(@"Button clicked for %@", senderButton.title);
    NSLog(@"Pressing this should show our popup of toppings to choose from");
    
}

@end
