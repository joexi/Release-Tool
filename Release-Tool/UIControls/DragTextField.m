//
//  DragTextField.m
//  Release-Tool
//
//  Created by Joe on 13-11-29.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import "DragTextField.h"

@implementation DragTextField

- (id)init
{
    self = [super init];
    if (self) {
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
        [((NSTextFieldCell *)[self cell]) setWraps:NO];
        [((NSTextFieldCell *)[self cell]) setScrollable:YES];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
        [((NSTextFieldCell *)[self cell]) setWraps:NO];
        [((NSTextFieldCell *)[self cell]) setScrollable:YES];
    }
    return self;
}

- (void)dealloc
{

}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
	NSLog(@"draggingEntered");
	NSPasteboard *pboard;
	NSDragOperation sourceDragMask;
	sourceDragMask = [sender draggingSourceOperationMask];
	pboard = [sender draggingPasteboard];
	return NSDragOperationLink;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	NSLog(@"performDragOperation");
	NSPasteboard *pboard = [sender draggingPasteboard];
	if ([sender draggingSource] != self) {
		if ([[pboard types] containsObject:NSFilenamesPboardType]) {
			NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];
			NSString *filePath = [files objectAtIndex:0];
            [self setStringValue:filePath];
			// modify here to continue
		}
	}
	return YES;
}

@end
