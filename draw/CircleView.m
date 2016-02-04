//
//  CircleView.m
//  draw
//
//  Created by miss on 16/2/3.
//  Copyright © 2016年 qiwo. All rights reserved.
//

#import "CircleView.h"
#import "RestView.h"
#define kLineWidth  10
@interface CircleView()
{
    UIBezierPath *_externalPath;
}
/**
 *  内部layer
 */
@property (nonatomic,weak)CAShapeLayer * innerLayer;

/**
 *  外部layer
 */
@property (nonatomic,weak)CAShapeLayer * externalLayer;

/**
 *  内部path
 */
@property (nonatomic,strong)UIBezierPath *innerPath;

/**
 *  倒计时label
 */
@property (nonatomic,weak)UILabel * label;
@end
@implementation CircleView

-(CAShapeLayer *)innerLayer
{
    if (_innerLayer ==nil)
    {
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        layer.lineWidth = kLineWidth;
        layer.strokeColor = [UIColor lightGrayColor].CGColor;
        layer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:layer];
        
        _innerLayer = layer;
    }
    return _innerLayer;
}

-(CAShapeLayer *)externalLayer
{
    if (_externalLayer == nil)
    {
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        layer.lineWidth = kLineWidth;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:layer];
        _externalLayer = layer;
    }
    return _externalLayer;
}

-(UIBezierPath *)innerPath
{
    if (!_innerPath)
    {
        _innerPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:MIN(self.frame.size.width, self.frame.size.height)/2-kLineWidth/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
        self.innerLayer.path = _innerPath.CGPath;
    }
    return _innerPath;
}
-(UILabel *)label
{
    if (!_label)
    {
        UILabel *l = [[UILabel alloc]initWithFrame:self.bounds];
        l.textAlignment = NSTextAlignmentCenter;
        l.font = [UIFont systemFontOfSize:70];
        [self addSubview:l];
        _label = l;
    }
    return _label;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self innerPath];
    }
    return self;
}

-(void)setProgess:(CGFloat)progess
{
    _progess = progess;
    
    _externalPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:MIN(self.frame.size.width, self.frame.size.height)/2-kLineWidth/2 startAngle:-M_PI_2 endAngle:2*M_PI*progess-M_PI_2 clockwise:YES];
    self.externalLayer.path = _externalPath.CGPath;
    self.label.text = [NSString stringWithFormat:@"%d",(int)(progess * TOTALTIME)+1];
}
-(void)setZero:(int)zero
{
    self.label.text = [NSString stringWithFormat:@"%d",zero];
}
@end
