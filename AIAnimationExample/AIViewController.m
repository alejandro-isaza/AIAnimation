//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import "AIViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AIViewController ()
@property (assign, nonatomic) BOOL running;
@end


@implementation AIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAnimations];
}

- (void)setUpAnimations {
    AIViewController __weak* wself = self;
    CGSize containerSize = _animationContainerView.bounds.size;
    CGSize blockSize = _animatingView.bounds.size;
    
    AIAnimation* animation1 = [AIAnimation animationWithDuration:0.25 block:^() {
        wself.animatingView.center = CGPointMake(blockSize.width/2, containerSize.height - blockSize.height/2);
    }];
    
    AIAnimation* animation2 = [AIAnimation animationWithDuration:0.25 block:^() {
        wself.animatingView.center = CGPointMake(containerSize.width - blockSize.width/2, containerSize.height - blockSize.height/2);
    }];
    
    AIAnimation* animation3 = [AIAnimation animationWithDuration:0.25 block:^() {
        wself.animatingView.center = CGPointMake(containerSize.width - blockSize.width/2, blockSize.height/2);
    }];
    
    AIAnimation* animation4 = [AIAnimation animationWithDuration:0.25 block:^() {
        wself.animatingView.center = CGPointMake(blockSize.width/2, blockSize.height/2);
    }];
    
    _animationSequence = [AIAnimationSequence animationSequenceWithAnimations:@[ animation1, animation2, animation3, animation4 ]];
    _animationSequence.completionBlock = ^(BOOL finished) {
        [wself.button setTitle:@"Animate" forState:UIControlStateNormal];
        wself.running = NO;
    };
}

- (IBAction)parameterDidChange:(id)sender {
    _durationTextField.text = [NSString stringWithFormat:@"%.2f", _durationSlider.value];
}

- (IBAction)animate {
    if (_running) {
        [_animatingView.layer removeAllAnimations];
        [_button setTitle:@"Animate" forState:UIControlStateNormal];
        _running = NO;
    } else {
        [_button setTitle:@"Stop" forState:UIControlStateNormal];
    
        for (AIAnimation* anim in _animationSequence.animations) {
            anim.duration = [_durationTextField.text floatValue];
            anim.easeIn = _easeInSwitch.on;
            anim.easeOut = _easeOutSwitch.on;
        }
        _animationSequence.repeat = _repeatSwitch.on;
        [_animationSequence run];
        _running = YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _durationSlider.value = [textField.text floatValue];
    [self parameterDidChange:textField];
}

@end
