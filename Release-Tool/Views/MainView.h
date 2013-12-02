//
//  MainView.h
//  Release-Tool
//
//  Created by Joe on 13-11-29.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DragTextField.h"

@interface MainView : NSView <NSTextFieldDelegate,NSAlertDelegate>
{
    DragTextField *_textFieldIncome;
    DragTextField *_textFieldOutput;
}

@end
