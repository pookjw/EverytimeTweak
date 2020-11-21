#import "Model.h"

@implementation Model
+(instancetype)sharedInstance {
    static Model *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Model alloc] init];
        if (sharedInstance.messagingCenter == nil) {
            sharedInstance.messagingCenter = [objc_getClass("CPDistributedMessagingCenter") centerNamed:@"com.pookjw.everytimetweakmessagecenter"];
            rocketbootstrap_distributedmessagingcenter_apply(sharedInstance.messagingCenter);
            [sharedInstance.messagingCenter runServerOnCurrentThread];
            [sharedInstance.messagingCenter registerForMessageName:@"request" target:sharedInstance selector:@selector(handleMessageNamed:withUserInfo:)];
        }

        sharedInstance.removeAdViewOnArticleList = YES;
        sharedInstance.removeAdViewOnCommentList = YES;
    });
    return sharedInstance;
}

- (void)killEverytime {
    pid_t pid;
    int status;
    const char* args[] = {"killall", "-9", "everytime", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (NSDictionary *)handleMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userinfo {
 	return @{
        @"removeAdViewOnArticleList": @(self.removeAdViewOnArticleList),
        @"removeAdViewOnCommentList": @(self.removeAdViewOnCommentList),
    };
}
@end