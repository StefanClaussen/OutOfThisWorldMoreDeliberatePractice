//
//  STCAddSpaceObjectViewController.h
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 27/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STCAddSpaceObjectViewContollerDelegate <NSObject>

@required

- (void)addSpaceObject;
- (void)didCancel;

@end

@interface STCAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <STCAddSpaceObjectViewContollerDelegate>delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;


- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;

@end
