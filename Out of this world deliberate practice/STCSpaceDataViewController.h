//
//  STCSpaceDataViewController.h
//  Out of this world deliberate practice
//
//  Created by Stefan Claussen on 22/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCSpaceDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
