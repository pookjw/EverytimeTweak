#import "substrate.h"
#import <rocketbootstrap/rocketbootstrap.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
#import <UIKit/UIKit.h>
#import <everytime/moimArticleListViewController.h>
#import <everytime/moimCommentListViewController.h>

static NSDictionary *tweakDic = nil;

%group HookEverytime
%hook moimArticleListViewController
- (void)viewWillAppear:(BOOL)animated {
	%orig(animated);
	if ([tweakDic[@"removeAdViewOnArticleList"] boolValue]) {
        [self performSelector:@selector(setAdViewsHeightToZero)];
    }
}

%new
- (void)setAdViewsHeightToZero {
	// 광고 View들의 높이를 0으로 설정한다.
	// removeFromSuperview로 처리할 경우 연결되어 있는 view들의 constraints을 다시 정의해줘야 하므로, 이렇게 간단하게 처리하자
	for (NSLayoutConstraint *constraint in self.adImageView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 0;
        }
    }

	for (NSLayoutConstraint *constraint in self.adBackgroundView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 0;
        }
    }
}

- (void)finishLoadAdInfo:(id)arg1 {
	if ([tweakDic[@"removeAdViewOnArticleList"] boolValue]) {
		// 광고를 받아도 아무것도 안하게 한다
	} else {
		%orig(arg1);
	}
}
%end

%hook moimCommentListViewController
- (void)viewWillAppear:(BOOL)animated {
	%orig(animated);
	if ([tweakDic[@"removeAdViewOnCommentList"] boolValue]) {
        [self performSelector:@selector(setAdViewsHeightToZero)];
    }
}

%new
- (void)setAdViewsHeightToZero {
	// 광고 View들의 높이를 0으로 설정한다.
	// removeFromSuperview로 처리할 경우 연결되어 있는 view들의 constraints을 다시 정의해줘야 하므로, 이렇게 간단하게 처리하자
	for (NSLayoutConstraint *constraint in self.adImageView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 0;
        }
    }

	for (NSLayoutConstraint *constraint in self.adBackgroundView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 0;
        }
    }
}

- (void)finishLoadAdInfo:(id)arg1 {
	if ([tweakDic[@"removeAdViewOnCommentList"] boolValue]) {
		// 광고를 받아도 아무것도 안하게 한다
	} else {
		%orig(arg1);
	}
}
%end

%hook UIViewController
- (void)viewDidAppear:(BOOL)animated {
	%orig(animated);
	// lldb debugging이 잘 안 되길래, 그냥 이렇게 해서 ViewController의 symbol을 받아 온다.
	NSLog(@"EverytimeTweakLogger: %@", self);
}
%end
%end

%ctor {
	CPDistributedMessagingCenter *messagingCenter = [objc_getClass("CPDistributedMessagingCenter") centerNamed:@"com.pookjw.everytimetweakmessagecenter"];
	if (messagingCenter == nil) {
        return;
	}
	rocketbootstrap_distributedmessagingcenter_apply(messagingCenter);
	tweakDic = [messagingCenter sendMessageAndReceiveReplyName:@"request" userInfo:nil];
	if (tweakDic == nil) {
		return;
	}

	%init(HookEverytime)
}