//
//  RestView.m
//  draw
//
//  Created by miss on 16/2/3.
//  Copyright © 2016年 qiwo. All rights reserved.
//

#import "RestView.h"

@interface RestView ()
{
    CGFloat _time;
    NSTimer *_timer;
    void(^finishBlock)();
    void(^interruptBlock)();
}
- (IBAction)stopRestEvent:(UIButton *)sender;
@property (nonatomic,weak)CircleView * circleView;
@end

@implementation RestView
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _time = TOTALTIME;
        [self countDown];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}
- (IBAction)stopRestEvent:(UIButton *)sender
{
    if (interruptBlock)
    {
        interruptBlock();
    }
}

-(CircleView *)circleView
{
    if (!_circleView)
    {
        CircleView * view = [[CircleView alloc]initWithFrame:CGRectMake(0, 0, 200 , 200)];
        view.center = self.center;
        [self addSubview:view];
        _circleView = view;
    }
    return _circleView;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}
-(void)countDown
{
    if (_time >= 0)
    {
        CGFloat progress = _time/TOTALTIME;
        [self.circleView setProgess:progress];
        _time = _time - 0.1;
    }
    else
    {
        [_timer invalidate];
        [self.circleView setZero:0];
        if (finishBlock)
        {
            finishBlock();
        }
    }
}
-(void)setFinishBlock:(void (^)())finish interruptBlock:(void (^)())interrupt
{
    finishBlock = finish;
    interruptBlock = interrupt;
}
@end
