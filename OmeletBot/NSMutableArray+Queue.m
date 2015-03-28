//
//  NSMutableArray+Queue.m
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)
- (id)front{
    id head = [self objectAtIndex:0];
    return head;
}

- (void)dequeue{
    id head = [self objectAtIndex:0];
    if(head != nil){
        [self removeObjectAtIndex:0];
    }
}
- (void)enqueue:(id) obj{
    [self addObject:obj];
}

- (BOOL)empty{
    return ([self objectAtIndex:0] == nil) ? YES : NO;
}

@end
