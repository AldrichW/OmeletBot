//
//  NSMutableArray+Queue.h
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)
- (id)front;
- (void)dequeue;
- (void)enqueue:(id) obj;
- (BOOL)empty;

@end
