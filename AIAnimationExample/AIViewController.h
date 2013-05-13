//  Created by Alejandro Isaza on 2013-03-26.
//  Copyright (c) 2013 Alejandro Isaza. All rights reserved.

#import <UIKit/UIKit.h>
#import "AIAnimation.h"
#import "AIAnimationSequence.h"


@interface AIViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISlider* durationSlider;
@property (weak, nonatomic) IBOutlet UITextField* durationTextField;
@property (weak, nonatomic) IBOutlet UISwitch* easeInSwitch;
@property (weak, nonatomic) IBOutlet UISwitch* easeOutSwitch;
@property (weak, nonatomic) IBOutlet UISwitch* repeatSwitch;

@property (weak, nonatomic) IBOutlet UIButton* button;
@property (weak, nonatomic) IBOutlet UIView* animationContainerView;
@property (weak, nonatomic) IBOutlet UIView* animatingView;

@property (strong, nonatomic) AIAnimationSequence* animationSequence;


- (IBAction)parameterDidChange:(id)sender;
- (IBAction)animate;

@end
