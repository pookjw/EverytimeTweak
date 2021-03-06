#import <UIKit/UIKit.h>

@class UITouch, UIViewPropertyAnimator;

@protocol CCUIContentModuleContentViewController <NSObject>
@property(readonly, nonatomic) double preferredExpandedContentHeight;

@optional
@property(readonly, nonatomic) _Bool shouldPerformHoverInteraction;
@property(readonly, nonatomic) UIViewPropertyAnimator *customAnimator;
@property(readonly, nonatomic) _Bool providesOwnPlatter;
@property(readonly, nonatomic) double preferredExpandedContinuousCornerRadius;
@property(readonly, nonatomic) double preferredExpandedContentWidth;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)willResignActive;
- (void)willBecomeActive;
- (void)displayWillTurnOff;
- (void)dismissPresentedContentAnimated:(_Bool)arg1 completion:(void (^)(void))arg2;
- (_Bool)canDismissPresentedContent;
- (void)didTransitionToExpandedContentMode:(_Bool)arg1;
- (void)willTransitionToExpandedContentMode:(_Bool)arg1;
- (_Bool)shouldExpandModuleOnTouch:(UITouch *)arg1;
- (_Bool)shouldFinishTransitionToExpandedContentModule;
- (_Bool)shouldBeginTransitionToExpandedContentModule;
@end