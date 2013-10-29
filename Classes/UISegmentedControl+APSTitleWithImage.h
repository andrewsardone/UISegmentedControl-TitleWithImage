#import <UIKit/UIKit.h>

@interface UISegmentedControl (APSTitleWithImage)

- (void)insertSegmentWithTitle:(NSString *)title
                         image:(UIImage *)image
                       atIndex:(NSUInteger)segment
                      animated:(BOOL)animated;

- (void)insertSegmentWithTitle:(NSString *)title
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage
                       atIndex:(NSUInteger)segment
                      animated:(BOOL)animated;

- (void)setTitle:(NSString *)title image:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment;

- (void)setTitle:(NSString *)title image:(UIImage *)image
                           selectedImage:(UIImage *)selectedImage
                       forSegmentAtIndex:(NSUInteger)segment;

@end
