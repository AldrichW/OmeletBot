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

@end
