//
//  STCDetailViewController.m
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 21/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "STCDetailViewController.h"

@interface STCDetailViewController ()

@end

@implementation STCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView = [[UIImageView alloc]initWithImage:self.spaceObject.spaceImage];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView Delegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
