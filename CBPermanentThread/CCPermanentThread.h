//
//  CCPermanentThread.h
//  Runloop_ PermanentThread
//
//  Created by walben on 2019/10/6.
//  Copyright © 2019 LB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCPermanentThread : NSObject
/**
 线程启动
 */
-(void)run;

/**
 线程停止
 */
-(void)stop;

/**
 线程执行任务
 */
-(void)excuteTask:(void (^)(void))task;


@end

NS_ASSUME_NONNULL_END
