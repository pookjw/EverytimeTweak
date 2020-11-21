#import <objc/NSObject.h>

@protocol CCUIContentModuleBackgroundViewController, CCUIContentModuleContentViewController;

@interface CCUIToggleModule : NSObject
{
    NSHashTable *_contentViewControllers;
}

- (id)contentViewControllerForContext:(id)arg1;
- (void)reconfigureView;
- (void)refreshState;
@property(readonly, nonatomic) double glyphScale;
@property(readonly, copy, nonatomic) NSString *glyphState;
- (id)glyphPackage;
@property(readonly, copy, nonatomic) UIColor *selectedColor; // @dynamic selectedColor;
@property(readonly, copy, nonatomic) UIImage *selectedIconGlyph; // @dynamic selectedIconGlyph;
@property(readonly, copy, nonatomic) UIImage *iconGlyph; // @dynamic iconGlyph;
@property(nonatomic, getter=isSelected) _Bool selected; // @dynamic selected;

// Remaining properties
@property(readonly, nonatomic) UIViewController<CCUIContentModuleBackgroundViewController> *backgroundViewController;
@property(readonly, nonatomic) UIViewController<CCUIContentModuleContentViewController> *contentViewController;
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end