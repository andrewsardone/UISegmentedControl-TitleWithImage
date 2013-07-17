#import <UIKit/UIKit.h>

@interface UISegmentedControl (APSTitleWithImage)

- (void)insertSegmentWithTitle:(NSString *)title
                         image:(UIImage *)image
                       atIndex:(NSUInteger)segment
                      animated:(BOOL)animated;

- (void)setTitle:(NSString *)title image:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment;

@end
