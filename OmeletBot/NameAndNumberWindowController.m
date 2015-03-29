//
//  NameAndNumberWindowController.m
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-29.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "NameAndNumberWindowController.h"
#import "MainViewController.h"

@interface NameAndNumberWindowController ()

@end

@implementation NameAndNumberWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)confirmButtonPressed:(id)sender {

    
    [self.delegate setToInProgressAtPosition:_position];
    
    [self.delegate createOrderWithGrillPosition:_position toppingOption:_toppingOption name:_nameTextField.stringValue number:_phoneNumberTextfield.stringValue];
    
    [self close];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self close];
}
@end
