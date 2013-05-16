AIAnimation
===========

[![Build Status](https://travis-ci.org/aleph7/AIAnimation.png)](https://travis-ci.org/aleph7/AIAnimation)

AIAnimation makes working with UIKit animations simpler by making animations [first-class citizens](http://en.wikipedia.org/wiki/First-class_citizen). You can pass animations as arguments, return them from methods and easily chain animations together. 


## Example

Suppose you have a view you want to move around its parent. The animation is broken down into 4 parts and then chained together with an `AIAnimationSequence`:

```ObjC
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
_animationSequence.repeat = YES;
[_animationSequence run];
```

That's simpler than having 4 nested blocks.


## Installation

Just add AIAnimation.[h,m] and AIAnimationSequence.[h,m] to your project. If you are using [CocoaPods](https://github.com/cocoapods/cocoapods), add this to your `Podfile`:
```ruby
pod 'AIAnimation'
```
