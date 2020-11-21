#import "EverytimeTweakCCContentViewController.h"

@implementation EverytimeTweakCCContentViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController *mainVC = [[MainViewController alloc] init];
    self.contentView = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    [self addChildViewController:self.contentView];
    [self.view addSubview:self.contentView.view];
    
    self.contentView.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.contentView.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.contentView.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.contentView.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;

    //

    if (@available(iOS 13.0, *)) {
        UIImage *iconImage = [UIImage systemImageNamed:@"snow"];
        self.iconImageView = [[UIImageView alloc] initWithImage:iconImage];
        [self.iconImageView setTintColor:UIColor.whiteColor];
        [self.view addSubview:self.iconImageView];
    } else {
        // 어차피 Everytime은 최소 iOS 버전이 13.0 이상이므로 처리할 필요가 없다.
    }

    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.iconImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.iconImageView.widthAnchor constraintEqualToConstant:72].active = YES;
    [self.iconImageView.heightAnchor constraintEqualToConstant:72].active = YES;

    //

    [self togglePresentation:NO];
}

- (void)willTransitionToExpandedContentMode:(_Bool)arg1 {
    [self togglePresentation:arg1];
}

- (double)preferredExpandedContentHeight {
    return 600.0;
}

- (_Bool)shouldExpandModuleOnTouch:(UITouch *)arg1 {
    return YES;
}

- (void)togglePresentation:(BOOL)presented {
    [self.contentView.view setHidden:!presented];
    [self.iconImageView setHidden:presented];
}
@end