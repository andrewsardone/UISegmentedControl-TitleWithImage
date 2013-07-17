#import "UIImage+APSImages.h"

@implementation UIImage (APSImages)

+ (instancetype)aps_redSquare;
{
    return [self aps_squareWithColor:UIColor.redColor width:30.0];
}

+ (instancetype)aps_yellowSquare
{
    return [self aps_squareWithColor:UIColor.yellowColor width:30.0];
}

+ (UIImage *)aps_squareWithColor:(UIColor *)color width:(CGFloat)width
{
    UIImage *image;
    CGRect square = (CGRect) { .size = { .width = width, .height = width } };
    UIGraphicsBeginImageContextWithOptions(square.size, YES, 0.0);
    {
        [color setFill];
        CGContextFillRect(UIGraphicsGetCurrentContext(), square);
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return image;
}

@end
