//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import "AIAnimation.h"

@interface AIAnimationSequence : AIAnimation

@property (strong, nonatomic) NSArray* animations;
@property (assign, nonatomic) NSUInteger currentAnimationIndex;

+ (instancetype)animationSequenceWithAnimations:(NSArray*)animations;

@end
