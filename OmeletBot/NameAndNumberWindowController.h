//
//  NameAndNumberWindowController.h
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-29.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OmeletOrder.h"

@interface NameAndNumberWindowController : NSWindowController
@property (strong) IBOutlet NSTextField *nameTextField;
@property (strong) IBOutlet NSTextField *phoneNumberTextfield;
@property id delegate;

@property (nonatomic) GrillPosition position;
@property (nonatomic) ToppingOption toppingOption;

- (void)setDelegate:(id)delegate;
- (IBAction)confirmButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end
