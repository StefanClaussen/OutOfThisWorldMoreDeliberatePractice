//
//  STCTableViewController.h
//  Out of this world deliberate practice

#import <UIKit/UIKit.h>
#import "STCSpaceObject.h"
#import "AstronomicalData.h"
#import "STCDetailViewController.h"
#import "STCSpaceDataViewController.h"
#import "STCAddSpaceObjectViewController.h"


@interface STCTableViewController : UITableViewController <STCAddSpaceObjectViewContollerDelegate>

@property (strong, nonatomic)NSMutableArray *planets;
@property (strong, nonatomic)NSMutableArray *addedSpaceObjects;

@end
