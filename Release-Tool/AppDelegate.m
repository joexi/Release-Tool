//
//  AppDelegate.m
//  Release-Tool
//
//  Created by Joe on 13-11-29.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"
@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSWindow *window = [self window];
    NSScreen *screen = [NSScreen mainScreen];
    NSRect appRect = NSMakeRect(screen.visibleFrame.size.width/2 - AppWidth/2,
                                screen.visibleFrame.size.height/2 - AppHeight/2,
                                AppWidth,
                                AppHeight);
    [window setFrame:appRect display:YES animate:YES];
    NSView *contentView = (NSView *)window.contentView;
    
    MainView *mainView = [[MainView alloc] initWithFrame:NSMakeRect(0,
                                                                    0,
                                                                    window.frame.size.width,
                                                                    window.frame.size.height)];
    [contentView addSubview:mainView];
}


@end
