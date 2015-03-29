//
//  MainViewController.h
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSMutableArray+Queue.h"
#import "OmeletOrder.h"
#import "Constants.h"
#import "NameAndNumberWindowController.h"

@interface MainViewController : NSViewController

@property (nonatomic, strong) NSMutableArray *orders;
@property (nonatomic, strong) OmeletOrder *currentCommand;
@property (nonatomic, strong) NameAndNumberWindowController *windowController;

- (void)createOrderWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption name:(NSString *)name number:(NSString *)number;

- (void)pollOmeletBot;

- (void) setToInProgressAtPosition:(GrillPosition)position;



@end
