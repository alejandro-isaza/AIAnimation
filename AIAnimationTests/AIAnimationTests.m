//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import "AIAnimation.h"
#import <XCTest/XCTest.h>


@interface AIAnimationTests : XCTestCase
@end


@implementation AIAnimationTests

- (void)testCreateAnimation {
    AIAnimation* anim = [AIAnimation animationWithDuration:0.25 block:^() {}];
    XCTAssertEqual(anim.duration, 0.25);
    XCTAssertEqual(anim.delay, 0.);
    XCTAssertTrue(anim.easeIn);
    XCTAssertTrue(anim.easeOut);
    XCTAssertFalse(anim.beginFromCurrentState);
    XCTAssertFalse(anim.repeat);
}

- (void)testCopyAnimation {
    AIAnimation* anim = [AIAnimation animationWithDuration:0.25 block:^() {}];
    anim.delay = 0.5;
    anim.repeat = YES;
    
    AIAnimation* copy = [anim copy];
    XCTAssertEqual(anim.duration, copy.duration);
    XCTAssertEqual(anim.delay, copy.delay);
    XCTAssertEqual(anim.easeIn, copy.easeIn);
    XCTAssertEqual(anim.easeOut, copy.easeOut);
    XCTAssertEqual(anim.beginFromCurrentState, copy.beginFromCurrentState);
    XCTAssertEqual(anim.repeat, copy.repeat);
}

@end
