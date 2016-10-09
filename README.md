# WJQTimer
定时器
/**
 *  用于验证码倒计时
 *
 *  @param interval 时间间隔
 *  @param block    回调block
 *  @param repeat   是否重复
 *  @param maxTime  倒计时最大时间,到时间自动停止计时
 *  @param endblock 时间结束后的回调
 */
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeat maxTime:(NSInteger)maxTime block:(WJQTimerHandler )block endblock:(WJQTimerHandler )endblock;

/**
 *  普通的定时器
 *
 *  @param interval 时间间隔
 *  @param repeat   是否重复
 *  @param block    回调
 */
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeat  block:(WJQTimerHandler )block;

/**
 *  关闭定时器
 */
- (void)closeTimer;
