//
//  STCAddSpaceObjectViewController.m
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 27/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "STCAddSpaceObjectViewController.h"


@interface STCAddSpaceObjectViewController ()

@end

@implementation STCAddSpaceObjectViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Orion.jpg"]];
    self.nameTextField.delegate = self;
    self.nicknameTextField.delegate = self;
    self.diameterTextField.delegate = self;
    self.temperatureTextField.delegate = self;
    self.numberOfMoonsTextField.delegate = self;
    self.interestingFactTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

- (STCSpaceObject*)returnNewSpaceObject
{
    STCSpaceObject *newSpaceObject = [[STCSpaceObject alloc]init];
    newSpaceObject.name = self.nameTextField.text;
    newSpaceObject.nickname = self.nicknameTextField.text;
    newSpaceObject.diameter = [self.diameterTextField.text floatValue];
    newSpaceObject.temperature = [self.diameterTextField.text floatValue];
    newSpaceObject.numberOfMoons = [self.numberOfMoonsTextField.text integerValue];
    newSpaceObject.interestingFact = self.interestingFactTextField.text;
    newSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return newSpaceObject;
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

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender
{
    [self.delegate addSpaceObject:[self returnNewSpaceObject]];
}

#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    [self.nicknameTextField resignFirstResponder];
    [self.diameterTextField resignFirstResponder];
    [self.temperatureTextField resignFirstResponder];
    [self.numberOfMoonsTextField resignFirstResponder];
    [self.interestingFactTextField resignFirstResponder];
    return YES;
}

@end
