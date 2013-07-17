#import "UISegmentedControl+APSTitleWithImage.h"
#import <QuartzCore/QuartzCore.h>

/**
 * Adds the ability to grab a UIImage-representation of any UIView.
 */
@interface UIView (APSLayerSnapshot)
@end
@implementation UIView (APSLayerSnapshot)

- (UIImage *)aps_imageFromLayer
{
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return image;
}

@end

#pragma mark -

@implementation UISegmentedControl (APSTitleWithImage)

- (void)insertSegmentWithTitle:(NSString *)title
                         image:(UIImage *)image
                       atIndex:(NSUInteger)segment
                      animated:(BOOL)animated
{

}

- (void)setTitle:(NSString *)title image:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment
{
}

@end
