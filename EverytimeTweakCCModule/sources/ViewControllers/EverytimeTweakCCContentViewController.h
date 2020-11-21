#import <ControlCenterUIKit/CCUIContentModuleContentViewController-Protocol.h>
#import "MainViewController.h"

@interface EverytimeTweakCCContentViewController : UIViewController<CCUIContentModuleContentViewController>
@property UINavigationController *contentView;
@property UIImageView *iconImageView;
- (void)togglePresentation:(BOOL)presented;
@end