//
//  CCButton.h
//  Runloop_ PermanentThread
//
//  Created by walben on 2019/10/9.
//  Copyright © 2019 LB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickHandle)(void);

@interface CCButton : UIButton

@property (nonatomic ,copy)ClickHandle handle;

-(instancetype)initWithButtonFrame:(CGRect)frame title:(NSString *)title handle:(ClickHandle)handle;

@end

NS_ASSUME_NONNULL_END
