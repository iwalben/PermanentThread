//
//  FViewController.m
//  Runloop_ PermanentThread
//
//  Created by walben on 2019/9/29.
//  Copyright © 2019 LB. All rights reserved.
//

#import "CCViewController.h"
#import "CCPermanentThread.h"
#import "CCButton.h"


@interface CCViewController ()

@property (nonatomic ,strong) CCPermanentThread * thread;

@end

@implementation CCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadUI];
    
    _thread = [[CCPermanentThread alloc]init];
    
    [_thread run];
}

-(void)loadUI
{
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGRect  rect = CGRectMake(100, 200, 100, 30);
    
    __weak typeof(self) weakSelf = self;
    
    CCButton * btn = [[CCButton alloc]initWithButtonFrame:rect title:@"退出界面" handle:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [self.view addSubview:btn];
    
    CGRect  rect2 = CGRectMake(100, 300, 100, 30);
    
    CCButton * btn2 = [[CCButton alloc]initWithButtonFrame:rect2 title:@"退出线程" handle:^{
        [weakSelf.thread stop];
    }];
    
    [self.view addSubview:btn2];
    
    CGRect  rect3 = CGRectMake(100, 400, 100, 30);
    
    CCButton * btn3 = [[CCButton alloc]initWithButtonFrame:rect3 title:@"干活了" handle:^{
        [weakSelf.thread excuteTask:^{
            NSLog(@"干活了--干活了---");
        }];
    }];
    
    [self.view addSubview:btn3];
}


-(void)dealloc
{
    NSLog(@"%s",__func__);
}


@end
