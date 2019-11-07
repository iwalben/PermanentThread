//
//  CCButton.m
//  Runloop_ PermanentThread
//
//  Created by walben on 2019/10/9.
//  Copyright © 2019 LB. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

-(instancetype)initWithButtonFrame:(CGRect)frame title:(NSString *)title handle:(ClickHandle)handle
{
    if (self = [super init]) {
        self.handle = handle ;
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor redColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)click:(id)sender
{
    !self.handle?:self.handle();
}

@end
