//
//  MainViewController.m
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
//Topping Popup Buttons
@property (strong) IBOutlet NSPopUpButton *topLeftPopupButton;
@property (strong) IBOutlet NSPopUpButton *topMiddlePopupButton;
@property (strong) IBOutlet NSPopUpButton *topRightPopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomLeftPopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomMiddlePopupButton;
@property (strong) IBOutlet NSPopUpButton *bottomRightPopupButton;

//Egg Buttons
@property (strong) IBOutlet NSButton *topLeftEggButton;
@property (strong) IBOutlet NSButton *topMiddleEggButton;
@property (strong) IBOutlet NSButton *topRightEggButton;
@property (strong) IBOutlet NSButton *bottomLeftEggButton;
@property (strong) IBOutlet NSButton *bottomMiddleEggButton;
@property (strong) IBOutlet NSButton *bottomRightEggButton;

//Scrambled Eggs
@property (strong) IBOutlet NSImageView *topLeftScrambledImage;
@property (strong) IBOutlet NSImageView *topMiddleScrambledImage;
@property (strong) IBOutlet NSImageView *topRightScrambledImage;
@property (strong) IBOutlet NSImageView *bottomLeftScrambledImage;
@property (strong) IBOutlet NSImageView *bottomMiddleScrambledImage;
@property (strong) IBOutlet NSImageView *bottomRightScrambledImage;

//Status Labels.
@property (strong) IBOutlet NSTextField *topLeftStatus;
@property (strong) IBOutlet NSTextField *topMiddleStatus;
@property (strong) IBOutlet NSTextField *topRightStatus;
@property (strong) IBOutlet NSTextField *bottomLeftStatus;
@property (strong) IBOutlet NSTextField *bottomMiddleStatus;
@property (strong) IBOutlet NSTextField *bottomRightStatus;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSArray *options = [NSArray arrayWithObjects:PLAIN_STRING,
                        DISPENSER_1_STRING,
                        DISPENSER_2_STRING,
                        BOTH_STRING,
                        nil];
    [self populatePopupButton:_topLeftPopupButton withItems:options];
    [self populatePopupButton:_topMiddlePopupButton withItems:options];
    [self populatePopupButton:_topRightPopupButton withItems:options];
    [self populatePopupButton:_bottomLeftPopupButton withItems:options];
    [self populatePopupButton:_bottomMiddlePopupButton withItems:options];
    [self populatePopupButton:_bottomRightPopupButton withItems:options];
    //Set every position to ready mode
    [self setToReadyStateAtPosition:TOP_LEFT];
    [self setToReadyStateAtPosition:TOP_MIDDLE];
    [self setToReadyStateAtPosition:TOP_RIGHT];
    [self setToReadyStateAtPosition:BOTTOM_LEFT];
    [self setToReadyStateAtPosition:BOTTOM_MIDDLE];
    [self setToReadyStateAtPosition:BOTTOM_RIGHT];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(pollOmeletBot) userInfo:nil repeats:YES];

}


- (void)populatePopupButton:(NSPopUpButton *)popupButton withItems:(NSArray *)items{
    
    if (popupButton != nil){
        [popupButton addItemsWithTitles:items];
    }
}

//This is for initialization and just my own sanity
- (void)hideAllPopupButtons{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_topLeftPopupButton setHidden:YES];
        [_topMiddlePopupButton setHidden:YES];
        [_topRightPopupButton setHidden:YES];
        [_bottomLeftPopupButton setHidden:YES];
        [_bottomMiddlePopupButton setHidden:YES];
        [_bottomRightPopupButton setHidden:YES];
    });
}

- (void)hideAllScrambledImages{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_topLeftScrambledImage setHidden:YES];
        [_topMiddleScrambledImage setHidden:YES];
        [_topRightScrambledImage setHidden:YES];
        [_bottomLeftScrambledImage setHidden:YES];
        [_bottomMiddleScrambledImage setHidden:YES];
        [_bottomRightScrambledImage setHidden:YES];
    });
}

//READY State
-(void)setToReadyStateAtPosition:(GrillPosition) position{
    dispatch_async(dispatch_get_main_queue(), ^{
        switch(position){
            case TOP_LEFT:
                [_topLeftEggButton setHidden:NO];
                [_topLeftPopupButton setHidden:YES];
                [_topLeftScrambledImage setHidden:YES];
                [_topLeftStatus setStringValue:@"READY"];
                break;
            case TOP_MIDDLE:
                [_topMiddleEggButton setHidden:NO];
                [_topMiddlePopupButton setHidden:YES];
                [_topMiddleScrambledImage setHidden:YES];
                [_topMiddleStatus setStringValue:@"READY"];
                break;
            case TOP_RIGHT:
                [_topRightEggButton setHidden:NO];
                [_topRightPopupButton setHidden:YES];
                [_topRightScrambledImage setHidden:YES];
                [_topRightStatus setStringValue:@"READY"];
                break;
            case BOTTOM_LEFT:
                [_bottomLeftEggButton setHidden:NO];
                [_bottomLeftPopupButton setHidden:YES];
                [_bottomLeftScrambledImage setHidden:YES];
                [_bottomLeftStatus setStringValue:@"READY"];
                break;
            case BOTTOM_MIDDLE:
                [_bottomMiddleEggButton setHidden:NO];
                [_bottomMiddlePopupButton setHidden:YES];
                [_bottomMiddleScrambledImage setHidden:YES];
                [_bottomMiddleStatus setStringValue:@"READY"];
                break;
            case BOTTOM_RIGHT:
                [_bottomRightEggButton setHidden:NO];
                [_bottomRightPopupButton setHidden:YES];
                [_bottomRightScrambledImage setHidden:YES];
                [_bottomRightStatus setStringValue:@"READY"];
                break;
        };
    });
}

- (void)setToToppingChooserAtPosition:(GrillPosition)position{
    dispatch_async(dispatch_get_main_queue(), ^{
        switch(position){
            case TOP_LEFT:
                [_topLeftEggButton setHidden:YES];
                [_topLeftPopupButton setHidden:NO];
                [_topLeftScrambledImage setHidden:NO];
                [_topLeftStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
            case TOP_MIDDLE:
                [_topMiddleEggButton setHidden:YES];
                [_topMiddlePopupButton setHidden:NO];
                [_topMiddleScrambledImage setHidden:NO];
                [_topMiddleStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
            case TOP_RIGHT:
                [_topRightEggButton setHidden:YES];
                [_topRightPopupButton setHidden:NO];
                [_topRightScrambledImage setHidden:NO];
                [_topRightStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
            case BOTTOM_LEFT:
                [_bottomLeftEggButton setHidden:YES];
                [_bottomLeftPopupButton setHidden:NO];
                [_bottomLeftScrambledImage setHidden:NO];
                [_bottomLeftStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
            case BOTTOM_MIDDLE:
                [_bottomMiddleEggButton setHidden:YES];
                [_bottomMiddlePopupButton setHidden:NO];
                [_bottomMiddleScrambledImage setHidden:NO];
                [_bottomMiddleStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
            case BOTTOM_RIGHT:
                [_bottomRightEggButton setHidden:YES];
                [_bottomRightPopupButton setHidden:NO];
                [_bottomRightScrambledImage setHidden:NO];
                [_bottomRightStatus setStringValue:@"CHOOSE TOPPINGS"];
                break;
        };
    });
}

- (void) setToInProgressAtPosition:(GrillPosition)position{
    dispatch_async(dispatch_get_main_queue(), ^{
        switch(position){
            case TOP_LEFT:
                [_topLeftEggButton setHidden:YES];
                [_topLeftPopupButton setHidden:YES];
                [_topLeftScrambledImage setHidden:NO];
                [_topLeftStatus setStringValue:@"IN PROGRESS"];
                break;
            case TOP_MIDDLE:
                [_topMiddleEggButton setHidden:YES];
                [_topMiddlePopupButton setHidden:YES];
                [_topMiddleScrambledImage setHidden:NO];
                [_topMiddleStatus setStringValue:@"IN PROGRESS"];
                break;
            case TOP_RIGHT:
                [_topRightEggButton setHidden:YES];
                [_topRightPopupButton setHidden:YES];
                [_topRightScrambledImage setHidden:NO];
                [_topRightStatus setStringValue:@"IN PROGRESS"];
                break;
            case BOTTOM_LEFT:
                [_bottomLeftEggButton setHidden:YES];
                [_bottomLeftPopupButton setHidden:YES];
                [_bottomLeftScrambledImage setHidden:NO];
                [_bottomLeftStatus setStringValue:@"IN PROGRESS"];
                break;
            case BOTTOM_MIDDLE:
                [_bottomMiddleEggButton setHidden:YES];
                [_bottomMiddlePopupButton setHidden:YES];
                [_bottomMiddleScrambledImage setHidden:NO];
                [_bottomMiddleStatus setStringValue:@"IN PROGRESS"];
                break;
            case BOTTOM_RIGHT:
                [_bottomRightEggButton setHidden:YES];
                [_bottomRightPopupButton setHidden:YES];
                [_bottomRightScrambledImage setHidden:NO];
                [_bottomRightStatus setStringValue:@"IN PROGRESS"];
                break;
        };
     });
}

- (void) setToFoldAtPosition:(GrillPosition)position{
    dispatch_async(dispatch_get_main_queue(), ^{
        switch(position){
            case TOP_LEFT:
                [_topLeftEggButton setHidden:YES];
                [_topLeftPopupButton setHidden:YES];
                [_topLeftScrambledImage setHidden:NO];
                [_topLeftStatus setStringValue:@"FOLD!"];
                break;
            case TOP_MIDDLE:
                [_topMiddleEggButton setHidden:YES];
                [_topMiddlePopupButton setHidden:YES];
                [_topMiddleScrambledImage setHidden:NO];
                [_topMiddleStatus setStringValue:@"FOLD!"];
                break;
            case TOP_RIGHT:
                [_topRightEggButton setHidden:YES];
                [_topRightPopupButton setHidden:YES];
                [_topRightScrambledImage setHidden:NO];
                [_topRightStatus setStringValue:@"FOLD!"];
                break;
            case BOTTOM_LEFT:
                [_bottomLeftEggButton setHidden:YES];
                [_bottomLeftPopupButton setHidden:YES];
                [_bottomLeftScrambledImage setHidden:NO];
                [_bottomLeftStatus setStringValue:@"FOLD!"];
                break;
            case BOTTOM_MIDDLE:
                [_bottomMiddleEggButton setHidden:YES];
                [_bottomMiddlePopupButton setHidden:YES];
                [_bottomMiddleScrambledImage setHidden:NO];
                [_bottomMiddleStatus setStringValue:@"FOLD!"];
                break;
            case BOTTOM_RIGHT:
                [_bottomRightEggButton setHidden:YES];
                [_bottomRightPopupButton setHidden:YES];
                [_bottomRightScrambledImage setHidden:NO];
                [_bottomRightStatus setStringValue:@"FOLD!"];
                break;
        };
    });
}

- (void)setToppingImageforTopping:(ToppingOption)toppingOption grillPosition:(GrillPosition)grillPosition{
    dispatch_async(dispatch_get_main_queue(), ^{
        switch(grillPosition){
            case TOP_LEFT:
                if(toppingOption == PLAIN){
                    [_topLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_topLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_topLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_topLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
            case TOP_MIDDLE:
                if(toppingOption == PLAIN){
                    [_topMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_topMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_topMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_topMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
            case TOP_RIGHT:
                if(toppingOption == PLAIN){
                    [_topRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_topRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_topRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_topRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
            case BOTTOM_LEFT:
                if(toppingOption == PLAIN){
                    [_bottomLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_bottomLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_bottomLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_bottomLeftScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
            case BOTTOM_MIDDLE:
                if(toppingOption == PLAIN){
                    [_bottomMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_bottomMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_bottomMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_bottomMiddleScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
            case BOTTOM_RIGHT:
                if(toppingOption == PLAIN){
                    [_bottomRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_1){
                    [_bottomRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_mushroom_pepper_graphic.png"]];
                }
                else if(toppingOption == DISPENSER_2){
                    [_bottomRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_cheese_tomato_graphic.png"]];
                }
                else if(toppingOption == BOTH){
                    [_bottomRightScrambledImage setImage:[NSImage imageNamed:@"scrambled_egg_all_toppings_graphic.png"]];
                }
                break;
        };
    });
}

//Create a new order and add it to the queue.
- (void)createOrderWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption name:(NSString *)name number:(NSString *)number{
    OmeletOrder *newOrder = [[OmeletOrder alloc]initWithGrillPosition:grillPosition toppingOption:toppingOption];
    
    [newOrder setPhoneNumber:number];
    [newOrder setName:name];
    
    NSString *grillPositionString = [self stringFromGrillPosition:newOrder.grillPosition];
    NSString *toppingOptionString = [self stringFromToppingOption:toppingOption];
    
    NSLog(@"New order created! Grill Position %@ with Topping %@",grillPositionString, toppingOptionString);
//    //Commenting out any queue related functions.
//    [_orders enqueue:newOrder];
//    [self printQueue];
    BOOL success = [newOrder sendOrder];
}

- (void)pollOmeletBot{
    //Check if Omelet bot has a free channel.
    
    //send a ping request to see if any of the values change.
    [self sendPing];
}

- (BOOL)sendPing{
    NSMutableURLRequest *request;
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@:%@/?json=on",HOSTNAME,PORT]]];
    [request setHTTPMethod:@"GET"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error != nil){
        NSLog(@"Failed to ping web server. %@", error);
        return NO;
    }
    else{
        if ([response statusCode] == 200){
            NSError *error = nil;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            //Uh oh, error converting the json string into a dictionary.
            if(error != nil){
                NSLog(@"Error, could not convert JSON to NSDictionary object. %@", error);
                
                return NO;
            }
            
            NSString *s1State = [dictionary objectForKey:@"S1"];
            NSString *s2State = [dictionary objectForKey:@"S2"];
            NSString *s3State = [dictionary objectForKey:@"S3"];
            NSString *s4State = [dictionary objectForKey:@"S4"];
            NSString *s5State = [dictionary objectForKey:@"S5"];
            NSString *s6State = [dictionary objectForKey:@"S6"];
            //Not recommended, really lazy coding. But I just want to see this work.
            // numbering is like
            //  3 2 1
            //  6 5 4
            
            
            if ([s1State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:BOTTOM_LEFT];
            }
            else if ([s1State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:BOTTOM_LEFT];
            }
            else if ([s1State isEqualToString: @"2"]){
                [self setToFoldAtPosition:BOTTOM_LEFT];
            }
            
            if ([s2State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:BOTTOM_MIDDLE];
            }
            else if ([s2State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:BOTTOM_MIDDLE];
            }
            else if ([s2State isEqualToString: @"2"]){
                [self setToFoldAtPosition:BOTTOM_MIDDLE];
            }
            
            if ([s3State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:BOTTOM_RIGHT];
            }
            else if ([s3State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:BOTTOM_RIGHT];
            }
            else if ([s3State isEqualToString: @"2"]){
                [self setToFoldAtPosition:BOTTOM_RIGHT];
            }
            
            if ([s4State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:TOP_LEFT];
            }
            else if ([s4State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:TOP_LEFT];
            }
            else if ([s4State isEqualToString: @"2"]){
                [self setToFoldAtPosition:TOP_LEFT];
            }
            
            if ([s5State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:TOP_MIDDLE];
            }
            else if ([s5State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:TOP_MIDDLE];
            }
            else if ([s5State isEqualToString: @"2"]){
                [self setToFoldAtPosition:TOP_MIDDLE];
            }
            
            if ([s6State isEqualToString: @"0"]){
                [self setToReadyStateAtPosition:TOP_RIGHT];
            }
            else if ([s6State isEqualToString: @"1"]){
                [self setToInProgressAtPosition:TOP_RIGHT];
            }
            else if ([s6State isEqualToString: @"2"]){
                [self setToFoldAtPosition:TOP_RIGHT];
            }
            
            return YES;
        }
    }
    return NO;
}

- (void)printQueue{
    for(OmeletOrder *obj in _orders){
        NSLog(@"%u",obj.grillPosition);
    }
}


- (IBAction)grillButtonPressed:(id)sender {
    
    NSButton *senderButton = (NSButton *)sender;
    //Show popup menu with options.
    NSLog(@"Button clicked for %ld", (long)senderButton.tag);
    
    NSLog(@"Pressing this should show our popup of toppings to choose from");
    
    GrillPosition position = (GrillPosition)senderButton.tag;
    
    [self setToToppingChooserAtPosition:position];
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
    
    
    _windowController = [[NameAndNumberWindowController alloc]initWithWindowNibName:@"NameAndNumberWindow"];
    [_windowController setDelegate:self];
    _windowController.position =(GrillPosition)popupButton.tag;
    _windowController.toppingOption =[self toppingOptionFromString:topping];
    [_windowController showWindow:self];
    
    
//    NSAlert *confirmationAlert = [[NSAlert alloc]init];
//    
//    [confirmationAlert addButtonWithTitle:@"Confirm"];
//    [confirmationAlert addButtonWithTitle:@"Cancel"];
//    
//    
//    [confirmationAlert setMessageText:@"Are You Sure?"];
//    [confirmationAlert setInformativeText:@"Once you confirm your delicious omelette, it cannot be undone."];
//    if ([confirmationAlert runModal] == NSAlertFirstButtonReturn){
//        [self createOrderWithGrillPosition:(GrillPosition)popupButton.tag toppingOption:[self toppingOptionFromString:topping]];
//        
//        [self setToppingImageforTopping:[self toppingOptionFromString:topping] grillPosition:(GrillPosition)popupButton.tag];
//        
//        [self setToInProgressAtPosition:(GrillPosition)popupButton.tag];
//        
//    }
}

@end
