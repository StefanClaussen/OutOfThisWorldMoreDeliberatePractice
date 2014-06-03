//
//  STCTableViewController.m
//  Out of this world deliberate practice

#import "STCOuterSpaceTableViewController.h"

@interface STCOuterSpaceTableViewController ()

@end

@implementation STCOuterSpaceTableViewController

-(NSMutableArray *)planets
{
    if (!_planets)
    {
        _planets = [[NSMutableArray alloc]init];
    }
    return _planets;
}

-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects)
    {
        _addedSpaceObjects = [[NSMutableArray alloc]init];
    }
    return _addedSpaceObjects;
}

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
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    
    if (indexPath.section ==1)
    {
        //Use new space object to customise the cell
        STCSpaceObject *addedPlanet = self.addedSpaceObjects[indexPath.row];
        cell.textLabel.text = addedPlanet.name;
        cell.detailTextLabel.text = addedPlanet.nickname;
        cell.imageView.image = addedPlanet.spaceImage;
    }
    else
    {
        STCSpaceObject *planet = self.planets[indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    
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

#pragma mark - STCAddSpaceObjectViewContollerDelegate methods

- (void)didCancel
{
    NSLog(@"Cancel pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addSpaceObject:(STCSpaceObject *)spaceObject;
{
    NSLog(@"Add pressed");
    [self.addedSpaceObjects addObject:spaceObject];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        STCSpaceObject *selectedObject;
        if ([segue.destinationViewController isKindOfClass:[STCSpaceImageViewController class]])
        {
            STCSpaceImageViewController *nextVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            if (path.section == 0)
            {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1)
            {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            nextVC.spaceObject = selectedObject;
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        STCSpaceObject *selectedObject;
        if ([segue.destinationViewController isKindOfClass:[STCSpaceDataViewController class]])
        {
            STCSpaceDataViewController *nextSpaceDataVC = segue.destinationViewController;
            NSIndexPath *path = sender;
            if (path.section == 0)
            {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1)
            {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            nextSpaceDataVC.spaceObject = selectedObject;
        }
    }
    if ([segue.destinationViewController isKindOfClass:[STCAddSpaceObjectViewController class]])
    {
        STCAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

@end
