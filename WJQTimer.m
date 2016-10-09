//
//  WJQTimer.m
//  CustomerTimer
//
//  Created by wujiaqing on 16/9/21.
//  Copyright © 2016年 口水网络科技有限公司. All rights reserved.
//

#import "WJQTimer.h"

@interface WJQTimer ()

{
    /**
     *  定时器
     */
    NSTimer *_timer;
    /**
     *  最大时间，到时间自动停止
     */
    NSInteger _maxTime;
    /**
     *  block
     */
    WJQTimerHandler _block;
    /**
     *  倒计时结束的回调
     */
    WJQTimerHandler _endblock;
}

@end

@implementation WJQTimer

- (instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}

- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeat maxTime:(NSInteger)maxTime block:(WJQTimerHandler )block endblock:(WJQTimerHandler )endblock{
    //倒计时时间
    _maxTime = maxTime;
    
    _block = block;
    _endblock = endblock;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerRunOne) userInfo:nil repeats:repeat];
    [_timer fire];
}

- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeat  block:(WJQTimerHandler )block{
    _block = block;
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerRunTwo) userInfo:nil repeats:repeat];
    [_timer fire];
}

- (void)timerRunOne{
    _maxTime -- ;
    if (_maxTime <= 0) {
        if (_endblock) {
            _endblock(@"end");
        }
        //销毁定时器
        [self destroyTimer];
        return;
    }
    if (_block) {
        _block(@(_maxTime));
    }
}

- (void)timerRunTwo{
    if (_block) {
        _block(@"block");
    }
}

- (void)closeTimer{
    [self destroyTimer];
}

- (void)destroyTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
