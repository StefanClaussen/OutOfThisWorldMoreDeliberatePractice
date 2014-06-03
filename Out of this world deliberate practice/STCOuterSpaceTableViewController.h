//
//  STCTableViewController.h
//  Out of this world deliberate practice

#import <UIKit/UIKit.h>
#import "STCSpaceObject.h"
#import "AstronomicalData.h"
#import "STCSpaceImageViewController.h"
#import "STCSpaceDataViewController.h"
#import "STCAddSpaceObjectViewController.h"


@interface STCOuterSpaceTableViewController : UITableViewController <STCAddSpaceObjectViewContollerDelegate>

@property (strong, nonatomic)NSMutableArray *planets;
@property (strong, nonatomic)NSMutableArray *addedSpaceObjects;

@end
