//
//  LDViewController.m
//  LDViewStack-sample-app
//
//  Created by Lee Daffen on 07/05/2013.
//  Copyright (c) 2013 Lee Daffen. All rights reserved.
//

#import "LDViewController.h"
#import "LDViewStack.h"

@interface LDViewController() <LDViewStackDataSource, LDViewStackDelegate>

@property (nonatomic, weak) IBOutlet LDViewStack *viewStack;
@property (nonatomic, copy) NSArray *imageNames;

@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    self.viewStack.dataSource = self;
    self.viewStack.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - LDViewStackDataSource

- (NSUInteger)numberOfViewsInStack {
    return self.imageNames.count;
}

- (UIView *)viewStack:(LDViewStack *)viewStack viewAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:self.imageNames[index]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGSize newImageSize = CGSizeMake(image.size.width/3, image.size.height/3);
    
    imageView.frame = CGRectMake((viewStack.bounds.size.width/2) - (newImageSize.width/2),
                                 (viewStack.bounds.size.height/2) - (newImageSize.height/2),
                                 newImageSize.width,
                                 newImageSize.height);
    
    return imageView;
}


#pragma mark - LDViewStackDelegate

- (void)viewStack:(LDViewStack *)viewStack didMoveViewToTopOfStack:(UIView *)imageView {
    
}

@end
