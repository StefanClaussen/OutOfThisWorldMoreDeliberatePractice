//
//  STCAddSpaceObjectViewController.h
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 27/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCAddSpaceObjectViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *nickname;
@property (strong, nonatomic) IBOutlet UITextField *diameter;
@property (strong, nonatomic) IBOutlet UITextField *temperature;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoons;
@property (strong, nonatomic) IBOutlet UITextField *interestingFact;


- (IBAction)cancelButtonPressed:(UIButton *)sender;

- (IBAction)addButtonPressed:(UIButton *)sender;

@end
