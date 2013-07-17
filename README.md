# UISegmentedControl-TitleWithImage

:warning: Not production-ready :warning:

Apple's [`UISegmentedControl`](https://developer.apple.com/library/ios/#documentation/uikit/reference/UISegmentedControl_Class/Reference/UISegmentedControl.html) is a great little object that's commonly used throughout the UI of our iOS apps. But do you know what really [grinds my gears](https://s3.amazonaws.com/f.cl.ly/items/402Y193L3C1j2B3J2N0j/grinds-my-gears-o.gif)? `UISegmentedControl` will let you set a title per segment, or an image per segment, but **not both an image *and* a title**. There needs to be a better way…

UISegmentedControl-TitleWithImage adds a [couple of methods][uiscadd] to `UISegmentedControl` that let you do just that, namely, **show both a title and an image within the same segment**:

```objc
#import "ViewController.h"
#import <UISegmentedControl+TitleWithImage/UISegmentedControl+APSTitleWithImage.h>

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [@[@"Hello", @"World"] enumerateObjectsUsingBlock:^(NSString *t, NSUInteger i, BOOL *stop) {
        [self.segmentedControl insertSegmentWithTitle:t
                                                image:[UIImage bigUglyRedSquare]
                                              atIndex:i
                                             animated:NO];
    }];
}

@end
```

[uiscadd]: https://github.com/andrewsardone/UISegmentedControl-TitleWithImage/blob/master/Classes/UISegmentedControl%2BAPSTitleWithImage.h

Now, `self.segmentedControl` will look like:

<img src="https://s3.amazonaws.com/f.cl.ly/items/0H1M2o1i4014261B2Q1u/iOS%20Simulator%20Screen%20shot%20Jul%2017,%202013%209.16.21%20AM.png" width="568" height="320" />

[I. know.](https://s3.amazonaws.com/f.cl.ly/items/3A0x1j3v3d333G2Z3C27/mind-blown.gif)
