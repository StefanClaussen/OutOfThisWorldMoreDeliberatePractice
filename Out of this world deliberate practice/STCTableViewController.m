//
//  STCTableViewController.m
//  Out of this world deliberate practice

#import "STCTableViewController.h"

@interface STCTableViewController ()

@end

@implementation STCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    for (NSDictionary *data in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", data[PLANET_NAME]];
        STCSpaceObject *spacePlanet = [[STCSpaceObject alloc]initWithData:data andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:spacePlanet];
    }
    NSLog(@"%@", self.planets);
    
}

-(NSMutableArray *)planets
{
    if (!_planets)
    {
        _planets = [[NSMutableArray alloc]init];
    }
    return _planets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.addedSpaceObjects count])
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return [self.addedSpaceObjects count];
    }
    else
    {
        return [self.planets count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    STCSpaceObject *planet = self.planets[indexPath.row];
    cell.textLabel.text = planet.name;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = planet.nickname;
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    cell.imageView.image = planet.spaceImage;
    
    tableView.backgroundColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - Table View delegate methods

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"planetsToSpaceDataSegue" sender:indexPath];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[STCDetailViewController class]])
        {
            STCDetailViewController *nextVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            STCSpaceObject *selectedObject = self.planets[path.row];
            nextVC.spaceObject = selectedObject;
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[STCSpaceDataViewController class]])
        {
            STCSpaceDataViewController *nextSpaceDataVC = segue.destinationViewController;
            NSIndexPath *path = sender;
            STCSpaceObject *spaceDataSelectedObject = self.planets[path.row];
            nextSpaceDataVC.spaceObject = spaceDataSelectedObject;
        }
    }
}

@end
