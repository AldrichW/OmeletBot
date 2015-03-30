//
//  OmeletOrder.m
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "OmeletOrder.h"

@implementation OmeletOrder{

}
- (OmeletOrder *)initWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption{
    OmeletOrder *newOrder = [[OmeletOrder alloc]init];
    newOrder.grillPosition = grillPosition;
    newOrder.toppingOption = toppingOption;
    //For now assume yes.
    newOrder.inProgress = YES;
    
    return newOrder;
}

- (OmeletOrder *)initWithGrillPosition:(GrillPosition)grillPosition{
    OmeletOrder *newOrder = [[OmeletOrder alloc]init];
    newOrder.grillPosition = grillPosition;
    newOrder.toppingOption = (ToppingOption)-1;
    //For now assume yes.
    newOrder.inProgress = YES;
    
    return newOrder;
}

- (BOOL) sendOrder{
    
    //Need to form the request
    // Tentative url request hostname:port/GRILL_POSITION/TOPPING_OPTION
    NSString *grillPosition=@"";
    if(BOTTOM_LEFT == _grillPosition){
        grillPosition = @"1";
    }
    else if(BOTTOM_MIDDLE == _grillPosition){
        grillPosition = @"2";
    }
    else if(BOTTOM_RIGHT == _grillPosition){
        grillPosition = @"3";
    }
    else if(TOP_LEFT == _grillPosition){
        grillPosition = @"4";
    }
    else if(TOP_MIDDLE == _grillPosition){
        grillPosition = @"5";
    }
    else if(TOP_RIGHT == _grillPosition){
        grillPosition = @"6";
    }
    
    NSString *preTopping = (_toppingOption == DISPENSER_1 || _toppingOption == BOTH) ?@"true":@"false";
    NSString *postTopping = (_toppingOption == DISPENSER_2 || _toppingOption == BOTH) ?@"true":@"false";
    NSString *urlString = [NSString stringWithFormat:@"%@:%@/?grillPosition=%@&preTopping=%@&postTopping=%@&name=%@&number=%@", HOSTNAME, PORT, grillPosition, preTopping,postTopping, _name, _phoneNumber];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"GET"];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error != nil){
        NSLog(@"Failed to send GET Request to web server. %@", error);
        return NO;
    }
    
    else if ([response statusCode] == 200){
        //figure out if I'm in queue or not. Need to think about the timer logic.
        NSLog(@"Successful request!");
    }
    
    return YES;
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

@end
