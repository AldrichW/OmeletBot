//
//  OmeletOrder.h
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    PLAIN = 0,
    DISPENSER_1,
    DISPENSER_2,
    BOTH
} ToppingOption;

typedef enum{
    TOP_LEFT = 0,
    TOP_MIDDLE,
    TOP_RIGHT,
    BOTTOM_LEFT,
    BOTTOM_MIDDLE,
    BOTTOM_RIGHT
} GrillPosition;

@interface OmeletOrder : NSObject{

}

@property(nonatomic) ToppingOption toppingOption;
@property(nonatomic) GrillPosition grillPosition;
@property(nonatomic) BOOL inProgress;

//When an omelet order is inited, assume in progress.
- (OmeletOrder *)initWithGrillPosition:(GrillPosition)grillPosition toppingOption:(ToppingOption)toppingOption;
- (OmeletOrder *)initWithGrillPosition:(GrillPosition)grillPosition;
- (OmeletOrder *)init;


@end
