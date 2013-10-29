#import <Kiwi/Kiwi.h>
#import "UIImage+APSImages.h"
#import <UISegmentedControl+TitleWithImage/UISegmentedControl+APSTitleWithImage.h>

SPEC_BEGIN(UISegmentedControl_TitleWithImageSpec)

describe(@"UISegmentedControl+APSTitleWithImage", ^{

    __block UISegmentedControl *sc;

    beforeEach(^{
        sc = [[UISegmentedControl alloc] initWithItems:nil];
    });

    it(@"adds an interface for inserting a segment with both a title and image", ^{
        [[sc should] respondToSelector:@selector(insertSegmentWithTitle:image:atIndex:animated:)];
    });

    it(@"adds an interface for settings a segment's content to both a title and image", ^{
        [[sc should] respondToSelector:@selector(setTitle:image:forSegmentAtIndex:)];
    });

    it(@"adds an interface for inserting a segment with a title, image, and selected image", ^{
        [[sc should] respondToSelector:@selector(insertSegmentWithTitle:image:selectedImage:atIndex:animated:)];
    });

    it(@"adds an interface for setting a segment's content to both a title, image, and selected image", ^{
        [[sc should] respondToSelector:@selector(setTitle:image:selectedImage:forSegmentAtIndex:)];
    });

    it(@"returns title and image components for specific accessors", ^{
        NSString *title = @"foo";
        UIImage *image = [UIImage aps_redSquare];

        [sc insertSegmentWithTitle:title image:image atIndex:0 animated:NO];

        [[sc titleForSegmentAtIndex:0] shouldNotBeNil];
        [[sc imageForSegmentAtIndex:0] shouldNotBeNil];

        [[[sc titleForSegmentAtIndex:0] should] equal:title];
        [[[sc imageForSegmentAtIndex:0] should] equal:image];
    });

    it(@"returns selected image for selected segment", ^{
        NSString *title = @"foo";
        UIImage *image = [UIImage aps_redSquare];
        UIImage *selectedImage = [UIImage aps_yellowSquare];

        [sc insertSegmentWithTitle:title image:image selectedImage:selectedImage atIndex:0 animated:NO];
        [sc insertSegmentWithTitle:title image:image selectedImage:selectedImage atIndex:1 animated:NO];

        sc.selectedSegmentIndex = 1;

        [[[sc imageForSegmentAtIndex:0] should] equal:image];
        [[[sc imageForSegmentAtIndex:1] should] equal:selectedImage];

        sc.selectedSegmentIndex = 0;

        [[[sc imageForSegmentAtIndex:0] should] equal:selectedImage];
        [[[sc imageForSegmentAtIndex:1] should] equal:image];
    });

    it(@"does not prevent using a solitary title", ^{
        NSString *titleWithImage = @"hello";
        NSString *standaloneTitle = @"goodbye";

        [sc insertSegmentWithTitle:titleWithImage image:[UIImage aps_redSquare] atIndex:0 animated:NO];
        [sc insertSegmentWithTitle:standaloneTitle atIndex:1 animated:NO];

        [[[sc titleForSegmentAtIndex:0] should] equal:titleWithImage];
        [[sc titleForSegmentAtIndex:1] shouldNotBeNil];
        [[[sc titleForSegmentAtIndex:1] should] equal:standaloneTitle];
    });

    it(@"does not prevent using a solitary image", ^{
        UIImage *imageWithTitle = [UIImage aps_redSquare];
        UIImage *standaloneImage = [UIImage aps_yellowSquare];

        [sc insertSegmentWithTitle:@"foo" image:imageWithTitle atIndex:0 animated:NO];
        [sc insertSegmentWithImage:standaloneImage atIndex:1 animated:NO];

        [[[sc imageForSegmentAtIndex:0] should] equal:imageWithTitle];
        [[sc imageForSegmentAtIndex:1] shouldNotBeNil];
        [[[sc imageForSegmentAtIndex:1] should] equal:standaloneImage];
    });

    it(@"returns nil if no image is being used for the segment", ^{
        [sc insertSegmentWithTitle:@"foo" atIndex:0 animated:NO];
        [[sc imageForSegmentAtIndex:0] shouldBeNil];
    });

});

SPEC_END
