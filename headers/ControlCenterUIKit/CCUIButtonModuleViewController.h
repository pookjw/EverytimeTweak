#import <UIKit/UIViewController.h>

@interface CCUIButtonModuleViewController : UIViewController {
    _Bool _expanded;
}
@property(nonatomic, getter=isExpanded) _Bool expanded; // @synthesize expanded=_expanded;
- (void)didTransitionToExpandedContentMode:(_Bool)arg1;
- (void)willTransitionToExpandedContentMode:(_Bool)arg1;
@property(readonly, nonatomic) double preferredExpandedContentHeight;
- (void)viewWillLayoutSubviews;
- (void)viewDidLoad;
@property(readonly, nonatomic) _Bool hasGlyph;
- (void)_buttonTapped:(id)arg1 forEvent:(id)arg2;
- (void)buttonTapped:(id)arg1 forEvent:(id)arg2;
- (void)_buttonTouchDown:(id)arg1 forEvent:(id)arg2;
- (void)buttonTouchDown:(id)arg1 forEvent:(id)arg2;
@property(nonatomic, getter=isSelected) _Bool selected;
@property(nonatomic) double glyphScale;
@property(copy, nonatomic) NSString *glyphState;
@property(retain, nonatomic) UIColor *selectedGlyphColor;
@property(retain, nonatomic) UIImage *selectedGlyphImage;
@property(retain, nonatomic) UIColor *glyphColor;
@property(retain, nonatomic) UIImage *glyphImage;
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly, nonatomic) double preferredExpandedContentWidth;
@property(readonly, nonatomic) double preferredExpandedContinuousCornerRadius;
@property(readonly, nonatomic) _Bool providesOwnPlatter;
@property(readonly, nonatomic) _Bool shouldPerformHoverInteraction;
@property(readonly) Class superclass;
@end