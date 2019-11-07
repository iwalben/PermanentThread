//
//  CCPermanentThread.m
//  Runloop_ PermanentThread
//
//  Created by walben on 2019/10/6.
//  Copyright © 2019 LB. All rights reserved.
//

#import "CCPermanentThread.h"

@interface CCThread : NSThread

@end

@implementation CCThread

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

@end


@interface CCPermanentThread ()

@property (nonatomic , strong) CCThread * innerThread ;

@property (nonatomic , assign) BOOL isStopped;

@end

@implementation CCPermanentThread

-(instancetype)init
{
    if (self = [super init]) {
        
        self.isStopped = NO ;
        
        __weak typeof(self) weakSelf = self;
        
        self.innerThread = [[CCThread alloc]initWithBlock:^{
            
            //添加source1
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            
            //相当于[[NSRunLoop currentRunLoop] run]的内部实现;
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            NSLog(@"end");
            
        }];
        
        NSLog(@"start");
        
    }
    return self ;
}

-(void)run
{
    if (!self.innerThread) return ;
    
    [self.innerThread start];
}

-(void)stop
{
    if (!self.innerThread) return ;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

-(void)excuteTask:(void (^)(void))task
{
    if (!self.innerThread || !task) return ;
    
    [self performSelector:@selector(__excuteTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

#pragma mark - private methods
/**
 内部执行任务
 */
-(void)__excuteTask:(void (^)(void))task
{
    task();
}

/**
 内部停止运行在当前子线程运行
 */
-(void)__stop
{
    if (!self.innerThread) return ;
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    self.isStopped = YES ;
    
    self.innerThread = nil ;
    
    NSLog(@"stop------");
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
    
    [self stop];
}

@end
