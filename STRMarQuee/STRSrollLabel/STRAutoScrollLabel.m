//
//  STRAutoScrollLabel.m
//  CalfProject
//
//  Created by renxingxing on 2017/6/21.
//  Copyright © 2017年 renxingxing. All rights reserved.
//

#import "STRAutoScrollLabel.h"
#import <QuartzCore/QuartzCore.h>
#define NumLabels 2
#define AutoLabel_speed 30
#define AutoLabel_pause 2
#define AutoLabel_betweenGap 50


@interface STRAutoScrollLabel(){
    
    UILabel *_label[NumLabels];
    NSInteger _speed;
}
@end
@implementation STRAutoScrollLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    
    for (NSInteger i = 0; i < NumLabels; i++) {
        _label[i] = [[UILabel alloc] init];
        [_label[i] setTextColor:[UIColor grayColor]];
        [_label[i] setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_label[i]];
    }
    _pauseTime = AutoLabel_pause;
    _labelBetweenGap = AutoLabel_betweenGap;
    _speed = AutoLabel_speed;
    _dirtionType = DirtionTypeLeft;
    self.showsVerticalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
}
- (void)rejustlabels{
    
    //set labels frame 及self contentsize和is scroll
    CGFloat offset = 0.0f;
    for (NSInteger i = 0; i < NumLabels; i++) {
        [_label[i] sizeToFit];
        CGPoint center = _label[i].center;
        center.y = self.center.y - self.frame.origin.y;
        _label[i].center = center;
        
        CGRect frame = _label[i].frame;
        frame.origin.x = offset;
        _label[i].frame = frame;
        
        offset += _label[i].frame.size.width+_labelBetweenGap;
    }
    CGSize size;
    size.width = _label[0].frame.size.width+self.frame.size.width+_labelBetweenGap;
    size.height = self.frame.size.height;
    self.contentSize = size;
    
    if (_label[0].frame.size.width > self.frame.size.width) {
        //show lab
        for (NSInteger i = 1; i <NumLabels; i++) {
            _label[i].hidden = NO;
        }
        [self scroll];
    }else{
        for (NSInteger i = 1;i < NumLabels; i++) {
            _label[i].hidden = YES;
        }
        
        CGPoint center = _label[0].center;
        center.x = self.center.x - self.frame.origin.x;
        _label[0].center = center;
    }
}

- (void)scroll{
    //delete before animations
    [self.layer removeAllAnimations];
    
    if (_dirtionType == DirtionTypeLeft) {
        self.contentOffset = CGPointMake(0, 0);
    }else if (_dirtionType == DirtionTypeRight){
        self.contentOffset = CGPointMake(_label[0].frame.size.width+_labelBetweenGap, 0);
    }
    
    [UIView beginAnimations:@"scroll" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:_label[0].frame.size.width/_speed];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    //animations
    if (_dirtionType == DirtionTypeLeft) {
        self.contentOffset = CGPointMake(_label[0].frame.size.width+_labelBetweenGap, 0);
    }else if (_dirtionType == DirtionTypeRight){
        self.contentOffset = CGPointMake(0, 0);
    }
    [UIView commitAnimations];
    
}
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finish context:(NSString *)context{
    
    if (finish.integerValue == 1 && _label[0].frame.size.width > self.frame.size.width) {
        //pause time
        [NSTimer scheduledTimerWithTimeInterval:_pauseTime target:self selector:@selector(scroll) userInfo:nil repeats:NO];
    }
}
- (void)setText:(NSString *)text{
    
    if ([text isEqualToString:_label[0].text]) {
        if (_label[0].frame.size.width > self.frame.size.width) {
            [self scroll];
        }
        return;
    }
    for (NSInteger i = 0; i< NumLabels; i++) {
        _label[i].text = text;
    }
    [self rejustlabels];
}

- (void)setDirtionType:(DirtionType)dirtionType{
    _dirtionType = dirtionType;
    [self rejustlabels];
}
- (void)setLabelBetweenGap:(NSInteger)labelBetweenGap{
    _labelBetweenGap = labelBetweenGap;
    [self rejustlabels];
}
- (void)setPauseTime:(NSInteger)pauseTime{
    _pauseTime = pauseTime;
    [self rejustlabels];
}
- (void)setSpeed:(NSInteger)speed{
    _speed = speed;
    [self rejustlabels];
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (NSInteger i = 0; i <NumLabels; i++) {
        _label[i].textColor = textColor;
    }
}
@end
