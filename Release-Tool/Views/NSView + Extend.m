//
//  NSView + Extend.m
//  Release-Tool
//
//  Created by Joe on 13-11-29.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import "NSView + Extend.h"

@implementation NSView(Extend)
@dynamic center;

- (void)setCenter:(NSPoint)center
{
    self.frame = NSMakeRect(center.x - self.frame.size.width/2,
                            center.y - self.frame.size.height/2,
                            self.frame.size.width,
                            self.frame.size.height);
}

- (NSPoint)center
{
    NSPoint center = NSMakePoint(self.frame.origin.x + self.frame.size.width/2,
                                 self.frame.origin.y + self.frame.size.height/2);
    return  center;
}
@end
