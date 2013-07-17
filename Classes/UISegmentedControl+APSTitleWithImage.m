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

/**
 * The inner content view that lays out the title labe and image and is eventually
 * transformed into a UIImage for use within the UISegmentedControl.
 */
@interface APSContainerView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;

// private
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSDictionary *textAttributes;

@end

@implementation APSContainerView

+ (instancetype)viewWithTitle:(NSString *)title image:(UIImage *)image textAttributes:(NSDictionary *)attributes
{
    APSContainerView *cv = [[APSContainerView alloc] initWithFrame:CGRectZero];

    cv.backgroundColor = UIColor.clearColor;
    cv.textAttributes = attributes;

    cv.label = [[UILabel alloc] initWithFrame:CGRectZero];
    cv.label.text = title;
    cv.label.backgroundColor = UIColor.clearColor;
    cv.label.font = cv.textAttributes[UITextAttributeFont];
    cv.label.textColor = cv.textAttributes[UITextAttributeTextColor];
    cv.label.shadowColor = cv.textAttributes[UITextAttributeTextShadowColor];
    cv.label.shadowOffset = ^CGSize (UIOffset offset) {
        return CGSizeMake(offset.horizontal, offset.vertical);
    }([cv.textAttributes[UITextAttributeTextShadowOffset] UIOffsetValue]);
    [cv.label sizeToFit];
    [cv addSubview:cv.label];

    cv.imageView = [[UIImageView alloc] initWithImage:image];
    [cv addSubview:cv.imageView];

    return cv;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    // TODO: Fix assumption that image and title are side-by-side with image aligned left
    return (CGSize) {
        .width = self.label.frame.size.width + self.imageAndLabelPadding + self.imageView.frame.size.width,
        .height = MAX(self.label.bounds.size.height, self.imageView.bounds.size.height)
    };
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    // TODO: Fix assumption that image and title are side-by-side with image aligned left
    self.imageView.frame = (CGRect) { .size = self.imageView.frame.size };
    self.label.frame = (CGRect) {
        .origin.x = CGRectGetMaxX(self.imageView.frame) + self.imageAndLabelPadding,
        .origin.y = ceilf((self.bounds.size.height - self.label.frame.size.height)/ 2.0),
        .size = self.label.frame.size
    };
}

- (CGFloat)imageAndLabelPadding { return 3.0; }

- (void)setTextAttributes:(NSDictionary *)textAttributes
{
    _textAttributes = (textAttributes) ? [textAttributes mutableCopy] : [NSMutableDictionary dictionary];

    NSMutableDictionary *ta = (NSMutableDictionary *) _textAttributes;

    ta[UITextAttributeFont] = ta[UITextAttributeFont] ?: [UIFont systemFontOfSize:UIFont.systemFontSize];
    ta[UITextAttributeTextColor] = ta[UITextAttributeTextColor] ?: UIColor.blackColor;
    ta[UITextAttributeTextShadowColor] = ta[UITextAttributeTextShadowColor] ?: UIColor.whiteColor;
    ta[UITextAttributeTextShadowOffset] = ta[UITextAttributeTextShadowOffset] ?: [NSValue valueWithUIOffset:UIOffsetMake(0.0, 1.0)];
}

@end

#pragma mark -

@implementation UISegmentedControl (APSTitleWithImage)

- (void)insertSegmentWithTitle:(NSString *)title
                         image:(UIImage *)image
                       atIndex:(NSUInteger)segment
                      animated:(BOOL)animated
{
    [self insertSegmentWithTitle:title atIndex:segment animated:animated];
    [self setTitle:title image:image forSegmentAtIndex:segment];
}

- (void)setTitle:(NSString *)title image:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment
{
    UIView *containerView = [APSContainerView viewWithTitle:title
                                                      image:image
                                             textAttributes:[self titleTextAttributesForState:UIControlStateNormal]];
    [containerView sizeToFit];
    UIImage *staticImage = [containerView aps_imageFromLayer];

    [self setImage:staticImage forSegmentAtIndex:segment];
}
}

@end
