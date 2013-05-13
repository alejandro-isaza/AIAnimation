//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import "AIAnimation.h"


@implementation AIAnimation

+ (instancetype)animationWithDuration:(NSTimeInterval)duration block:(AIAnimationBlock)animation {
    AIAnimation* anim = [[AIAnimation alloc] init];
    anim.duration = duration;
    anim.animationBlock = animation;
    return anim;
}

+ (instancetype)animationWithDuration:(NSTimeInterval)duration block:(AIAnimationBlock)animation completion:(AICompletionBlock)completion {
    AIAnimation* anim = [[AIAnimation alloc] init];
    anim.duration = duration;
    anim.animationBlock = animation;
    anim.completionBlock = completion;
    return anim;
}

- (void)run {
    if (_setupBlock)
        _setupBlock();
    
    AIAnimationBlock animationWrapperBlock = ^() {
        [self willStartAnimation];
        if (_animationBlock)
            _animationBlock();
        [self didStartAnimation];
    };
    
    AICompletionBlock completionWrapperBlock = ^(BOOL finished) {
        if (_completionBlock)
            _completionBlock(finished);
        if (finished)
            [self didFinishAnimation];
        else
            [self didAbortAnimation];
    };
    
    [UIView animateWithDuration:_duration
                          delay:_delay
                        options:[self options]
                     animations:animationWrapperBlock
                     completion:completionWrapperBlock];
}

- (UIViewAnimationOptions)options {
    UIViewAnimationOptions options = 0;
    if (_easeIn && _easeOut)
        options |= UIViewAnimationOptionCurveEaseInOut;
    else if (_easeIn)
        options |= UIViewAnimationOptionCurveEaseIn;
    else if (_easeOut)
        options |= UIViewAnimationOptionCurveEaseOut;
    else
        options |= UIViewAnimationOptionCurveLinear;
    
    if (_beginFromCurrentState)
        options |= UIViewAnimationOptionBeginFromCurrentState;
    
    if (_repeat)
        options |= UIViewAnimationOptionRepeat;
    
    return options;
}


#pragma mark Animation status methods

- (void)willStartAnimation {
}

- (void)didStartAnimation {
}

- (void)didAbortAnimation {
}

- (void)didFinishAnimation {
}


#pragma mark NSCopying

- (id)copyWithZone:(NSZone*)zone {
    AIAnimation* copy = [[AIAnimation alloc] init];
    copy.duration = _duration;
    copy.delay = _delay;
    copy.easeIn = _easeIn;
    copy.easeOut = _easeOut;
    copy.beginFromCurrentState = _beginFromCurrentState;
    copy.repeat = _repeat;
    copy.animationBlock = _animationBlock;
    copy.completionBlock = _completionBlock;
    return copy;
}

@end
