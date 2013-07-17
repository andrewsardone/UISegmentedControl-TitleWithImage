#import <Kiwi/Kiwi.h>
#import <UISegmentedControl+TitleWithImage/UISegmentedControl+APSTitleWithImage.h>

SPEC_BEGIN(UISegmentedControl_TitleWithImageSpec)

describe(@"UISegmentedControl+APSTitleWithImage", ^{

    it(@"adds an interface for inserting a segment with both a title and image", ^{
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
        [[segmentedControl should] respondToSelector:@selector(insertSegmentWithTitle:image:atIndex:animated:)];
    });

    it(@"adds an interface for settings a segment's content to both a title and image", ^{
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
        [[segmentedControl should] respondToSelector:@selector(setTitle:image:forSegmentAtIndex:)];
    });

});

SPEC_END
