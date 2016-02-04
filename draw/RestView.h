//
//  RestView.h
//  draw
//
//  Created by miss on 16/2/3.
//  Copyright © 2016年 qiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#define TOTALTIME 10.0
@interface RestView : UIView

//@property (nonatomic,copy)void(^finishBlock)();
//@property (nonatomic,copy)void()();

-(void)setFinishBlock:(void(^)())finish interruptBlock:(void(^)())interrupt;

@end
