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
@property (strong) IBOutlet NSPopUpButton *topLeftPopupButton;
@property (strong) IBOutlet NSPopUpButton *topMiddlePopupButton;
@property (strong) IBOutlet NSPopUpButton *topRightPopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomLeftPopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomMiddlePopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomRightPopupButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self hideAllPopupButtons];

}

-(void)populatePopupButton:(NSPopUpButton *)popupButton withItems:(NSArray *)items{
    
    if (popupButton != nil){
        [popupButton addItemsWithTitles:items];
    }
}

-(void)hideAllPopupButtons{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_topLeftPopupButton setHidden:YES];
        [_topMiddlePopupButton setHidden:YES];
        [_topRightPopupButton setHidden:YES];
        [_bottomLeftPopupButton setHidden:YES];
        [_bottomMiddlePopupButton setHidden:YES];
        [_bottomRightPopupButton setHidden:YES];
    });
}
//Create a new order and add it to the queue.
- (void)createOrderWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption{
    OmeletOrder *newOrder = [[OmeletOrder alloc]initWithGrillPosition:grillPosition toppingOption:toppingOption];
    
    NSString *grillPositionString = [self stringFromGrillPosition:newOrder.grillPosition];
    
    NSLog(@"New order created! Grill Position %@ with Topping %u",grillPositionString, toppingOption);
//    //Commenting out any queue related functions.
//    [_orders enqueue:newOrder];
//    [self printQueue];
    
    [self sendOrder];
}

- (void)pollOmeletBot{
    //Check if Omelet bot has a free channel.
}

- (void)printQueue{
    for(OmeletOrder *obj in _orders){
        NSLog(@"%u",obj.grillPosition);
    }
}

- (void)sendOrder{
    //This is where the HTTP request would get sent to poll and send order in.
}
- (IBAction)grillButtonPressed:(id)sender {
    
    NSButton *senderButton = (NSButton *)sender;
    //Show popup menu with options.
    NSLog(@"Button clicked for %@", senderButton.title);
    
    NSLog(@"Pressing this should show our popup of toppings to choose from");
    
    GrillPosition position = [self grillPositionFromString:senderButton.title];
    NSArray *options = [NSArray arrayWithObjects:@"Plain",
                                                 @"Dispenser1",
                                                 @"Dispenser2",
                                                 @"All Toppings",
                        nil];
    
    _candidateCommand = [[OmeletOrder alloc]initWithGrillPosition:position];
    
    switch(position){
        case TOP_LEFT:
            [_topLeftPopupButton setHidden:NO];
            [self populatePopupButton:_topLeftPopupButton withItems:options];
            break;
        case TOP_MIDDLE:
            [_topMiddlePopupButton setHidden:NO];
            [self populatePopupButton:_topMiddlePopupButton withItems:options];
            break;
            
        case TOP_RIGHT:
            [_topRightPopupButton setHidden:NO];
            [self populatePopupButton:_topRightPopupButton withItems:options];
            break;
        case BOTTOM_LEFT:
            [_bottomLeftPopupButton setHidden:NO];
            [self populatePopupButton:_bottomLeftPopupButton withItems:options];
            break;
        case BOTTOM_MIDDLE:
            [_bottomMiddlePopupButton setHidden:NO];
            [self populatePopupButton:_bottomMiddlePopupButton withItems:options];
            break;
        case BOTTOM_RIGHT:
            [_bottomRightPopupButton setHidden:NO];
            [self populatePopupButton:_bottomRightPopupButton withItems:options];
            break;
            
    };
    
}

#pragma mark - Grill Position String Conversions
-(GrillPosition) grillPositionFromString:(NSString *)positionString{
    if([positionString isEqualToString:TOP_LEFT_STRING]){
        return TOP_LEFT;
    }
    
    if([positionString isEqualToString:TOP_MIDDLE_STRING]){
        return TOP_MIDDLE;
    }
    
    if([positionString isEqualToString:TOP_RIGHT_STRING]){
        return TOP_RIGHT;
    }
    if([positionString isEqualToString:BOTTOM_LEFT_STRING]){
        return BOTTOM_LEFT;
    }
    
    if([positionString isEqualToString:BOTTOM_MIDDLE_STRING]){
        return BOTTOM_MIDDLE;
    }
    
    if([positionString isEqualToString:BOTTOM_RIGHT_STRING]){
        return BOTTOM_RIGHT;
    }
    return -1;
}

- (NSString *) stringFromGrillPosition:(GrillPosition)grillPosition{
    if(grillPosition == TOP_LEFT){
        return TOP_LEFT_STRING;
    }
    if(grillPosition == TOP_MIDDLE){
        return TOP_MIDDLE_STRING;
    }
    if(grillPosition == TOP_RIGHT){
        return TOP_RIGHT_STRING;
    }
    if(grillPosition == BOTTOM_LEFT){
        return BOTTOM_LEFT_STRING;
    }
    if(grillPosition == BOTTOM_MIDDLE){
        return BOTTOM_MIDDLE_STRING;
    }
    if(grillPosition == BOTTOM_RIGHT){
        return BOTTOM_RIGHT_STRING;
    }
    return nil;
}

#pragma mark - Topping Option String Conversions

- (ToppingOption) toppingOptionFromString:(NSString *)toppingString{
    if([toppingString isEqualToString:PLAIN_STRING]){
        return PLAIN;
    }
    if([toppingString isEqualToString:DISPENSER_1_STRING]){
        return DISPENSER_1;
    }
    if([toppingString isEqualToString:DISPENSER_2_STRING]){
        return DISPENSER_2;
    }
    if([toppingString isEqualToString:BOTH_STRING]){
        return BOTH;
    }
    return (ToppingOption)-1;
}

- (NSString *) stringFromToppingOption:(ToppingOption) toppingOption{
    if(toppingOption == PLAIN){
        return PLAIN_STRING;
    }
    if(toppingOption == DISPENSER_1){
        return DISPENSER_1_STRING;
    }
    if(toppingOption == DISPENSER_2){
        return DISPENSER_2_STRING;
    }
    if(toppingOption == BOTH){
        return BOTH_STRING;
    }
    return nil;
}
- (IBAction)placeOrderOnSelect:(id)sender {
    NSPopUpButton *popupButton = (NSPopUpButton *)sender;
    NSString *topping = [[popupButton selectedItem]title];
    NSLog(@"The topping  chosen is %@",topping);
    [self createOrderWithGrillPosition:_candidateCommand.grillPosition toppingOption:[self toppingOptionFromString:topping]];
    
    [self sendOrder];
    [self hideAllPopupButtons];
    
}

@end
