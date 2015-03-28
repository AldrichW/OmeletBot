//
//  MainViewController.h
//  OmeletBot
//
//  Created by Aldrich Wingsiong on 2015-03-28.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController

@property (nonatomic, strong) Queue *orders;
@property (nonatomic, strong) OmeletOrder currentCommand;

@end
