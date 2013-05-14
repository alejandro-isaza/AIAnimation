//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import "AIAnimation.h"
#import <SenTestingKit/SenTestingKit.h>


@interface AIAnimationTests : SenTestCase
@end


@implementation AIAnimationTests

- (void)testCreateAnimation {
    AIAnimation* anim = [AIAnimation animationWithDuration:0.25 block:^() {}];
    STAssertEquals(anim.duration, 0.25, nil);
    STAssertEquals(anim.delay, 0., nil);
    STAssertTrue(anim.easeIn, nil);
    STAssertTrue(anim.easeOut, nil);
    STAssertFalse(anim.beginFromCurrentState, nil);
    STAssertFalse(anim.repeat, nil);
}

- (void)testCopyAnimation {
    AIAnimation* anim = [AIAnimation animationWithDuration:0.25 block:^() {}];
    anim.delay = 0.5;
    anim.repeat = YES;
    
    AIAnimation* copy = [anim copy];
    STAssertEquals(anim.duration, copy.duration, nil);
    STAssertEquals(anim.delay, copy.delay, nil);
    STAssertEquals(anim.easeIn, copy.easeIn, nil);
    STAssertEquals(anim.easeOut, copy.easeOut, nil);
    STAssertEquals(anim.beginFromCurrentState, copy.beginFromCurrentState, nil);
    STAssertEquals(anim.repeat, copy.repeat, nil);
}

@end
