//
//  STCDetailViewController.h
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 21/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STCSpaceObject.h"

@interface STCSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) STCSpaceObject *spaceObject;

@end
