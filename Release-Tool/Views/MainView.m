//
//  MainView.m
//  Release-Tool
//
//  Created by Joe on 13-11-29.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import "MainView.h"
#import "NSView + Extend.h"
#import "JXFileManager.h"
@implementation MainView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _textFieldIncome = [[DragTextField alloc] initWithFrame:NSMakeRect(0, 0, 400, 30)];
        _textFieldIncome.delegate = self;
        _textFieldIncome.font = [NSFont fontWithName:@"Helvetica" size:17];
        _textFieldIncome.center = NSMakePoint(AppWidth/2, AppHeight/2 + 40);
        _textFieldIncome.backgroundColor = [NSColor grayColor];
        
        _textFieldOutput = [[DragTextField alloc] initWithFrame:NSMakeRect(0, 0, 400, 30)];
        _textFieldOutput.delegate = self;
        _textFieldOutput.font = [NSFont fontWithName:@"Helvetica" size:17];
        _textFieldOutput.center = NSMakePoint(_textFieldIncome.center.x, _textFieldIncome.center.y - 40);
        _textFieldOutput.backgroundColor = [NSColor grayColor];
        
    
        NSButton *btn = [[NSButton alloc]initWithFrame:NSMakeRect(0,0,200,30)];
        btn.title = @"start";
        [btn setTarget:self];
        [btn setAction:@selector(btnDidSelect)];
        btn.center = NSMakePoint(_textFieldIncome.center.x, _textFieldIncome.center.y - 80);
        
        
        [self addSubview:btn];
        [self addSubview:_textFieldIncome];
        [self addSubview:_textFieldOutput];
    }
    return self;
}

- (void)btnDidSelect
{
    if (![self checkInput])
    {
        return;
    }
    
//    [self packageWithScriptName:@"android_pack.sh"];
//    [self packageWithScriptName:@"ios_pack.sh"];
    [self packageWithScriptName:@"all_pack.sh"];
}

- (void)packageWithScriptName:(NSString *)scriptName
{
    NSString *projectPath = _textFieldIncome.stringValue;
    NSString *outputPath = _textFieldOutput.stringValue;
    
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    NSString *shellPath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:scriptName];
    NSArray *arguments = [NSArray arrayWithObjects:shellPath,projectPath,outputPath, nil];
    [task setArguments: arguments];
    [task launch];
    [task setTerminationHandler:^(NSTask *t) {
        NSAlert *al = [NSAlert alertWithMessageText:@"打包成功!"
                                      defaultButton:@"关闭"
                                    alternateButton:@""
                                        otherButton:@""
                          informativeTextWithFormat:@""];
        [al beginSheetModalForWindow:nil modalDelegate:self didEndSelector:@selector(showDiretory) contextInfo:nil];
    }];
}

- (BOOL)checkInput
{
    if (_textFieldIncome.stringValue.length == 0) {
        NSAlert *al = [NSAlert alertWithMessageText:@"请输入项目路径" defaultButton:@"ok" alternateButton:@"" otherButton:@"" informativeTextWithFormat:@""];
        [al beginSheetModalForWindow:nil modalDelegate:nil didEndSelector:nil contextInfo:nil];
        return NO;
    }
    else if (_textFieldOutput.stringValue.length == 0) {
        NSAlert *al = [NSAlert alertWithMessageText:@"请输入目标路径" defaultButton:@"ok" alternateButton:@"" otherButton:@"" informativeTextWithFormat:@""];
        [al beginSheetModalForWindow:nil modalDelegate:nil didEndSelector:nil contextInfo:nil];
        return NO;
    }
    return YES;
}

- (void)showDiretory
{
    
}


- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

@end
