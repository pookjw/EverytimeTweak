#import <Foundation/Foundation.h>
#import <rocketbootstrap/rocketbootstrap.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
#import <objc/runtime.h>
#import <spawn.h>

@interface Model : NSObject
+(instancetype)sharedInstance;
- (void)killEverytime;
@property (nonatomic, assign, readwrite) CPDistributedMessagingCenter *messagingCenter;
@property BOOL removeAdViewOnArticleList;
@property BOOL removeAdViewOnCommentList;
@end