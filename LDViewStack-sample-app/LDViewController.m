//
//  LDViewController.m
//  LDViewStack-sample-app
//
//  Created by Lee Daffen on 07/05/2013.
//  Copyright (c) 2013 Lee Daffen. All rights reserved.
//

#import "LDViewController.h"
#import "LDViewStack.h"
#import "UIImage+Resize.h"


@interface LDViewController() <LDViewStackDataSource, LDViewStackDelegate>

@property (nonatomic, weak) IBOutlet LDViewStack *viewStack;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, copy) NSArray *imageNames;
@property (nonatomic, strong) NSMutableArray *imageViews;

@end


@implementation LDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageNames = @[
                        @"image_1.jpg",
                        @"image_2.jpg",
                        @"image_3.jpg",
                        @"image_4.jpg",
                        @"image_5.jpg",
                        @"image_6.jpg",
                        @"image_7.jpg",
                        @"image_8.jpg",
                        @"image_9.jpg",
                        @"image_10.jpg",
                        @"image_11.jpg",
                        @"image_12.jpg"
                        ];
    
    self.imageViews = [NSMutableArray arrayWithCapacity:self.imageNames.count];
    
    for (NSString *name in self.imageNames) {
        UIImage *resizedImage = [[UIImage imageNamed:name] resizedImage:self.viewStack.bounds.size interpolationQuality:kCGInterpolationHigh];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:resizedImage];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.imageViews addObject:imageView];
    }
    
    self.viewStack.dataSource = self;
    self.viewStack.delegate = self;
    self.viewStack.maxVisibleItems = 5;
    self.viewStack.shuffleAnimationDuration = 0.25;
    
    self.pageControl.numberOfPages = self.imageNames.count;
}


#pragma mark - LDViewStackDataSource

- (NSUInteger)numberOfViewsInStack {
    return self.imageNames.count;
}

- (UIView *)viewStack:(LDViewStack *)viewStack viewAtIndex:(NSInteger)index {
    if (index >= self.imageViews.count) return [self.imageViews lastObject];
    if (index < 0) return [self.imageViews firstObject];
    
    UIImageView *imageView = self.imageViews[index];
    imageView.frame = viewStack.bounds;
    
    return imageView;
}


#pragma mark - LDViewStackDelegate

- (void)viewStack:(LDViewStack *)viewStack didMoveViewToTopOfStack:(UIView *)imageView {
    self.pageControl.currentPage = [self.imageViews indexOfObject:imageView];
}

@end
