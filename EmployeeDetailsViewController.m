//
//  ViewController.m
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmployeeDetailsViewController.h"
#import "EmplyeeInfoViewController.h"

@interface EmployeeDetailsViewController ()

{
    NSMutableArray *detailsFromPlistArray;
    NSInteger selectedIndex;
    NSMutableArray *empDetailsArray;
    NSString *plistPath;
    NSString *documentsPath;
}

@end

@implementation EmployeeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Registering the Nib
    [_employeesTableView registerNib:[UINib nibWithNibName:@"EmployeeNameViewCell" bundle:nil] forCellReuseIdentifier:@"EmployeeNameCell"];
    self.navigationItem.title = @"Employees";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     documentsPath = [paths objectAtIndex:0];
     plistPath = [documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:plistPath])
 {
     [self copyPlistFromBundleToDocumentDirectory];
 }
    detailsFromPlistArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    empDetailsArray = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < detailsFromPlistArray.count; i++)
    {
        NSDictionary *empDetailsDictionary = detailsFromPlistArray[i];
         _employeeInfo = [[EmployeeInfo alloc]init];
        _employeeInfo.employeeName = empDetailsDictionary[@"Name"];
        _employeeInfo.employeeImage = empDetailsDictionary[@"Photo"];
        _employeeInfo.employeeID = empDetailsDictionary[@"ID"];
        _employeeInfo.employeeDesignation = empDetailsDictionary[@"Desingation"];
        _employeeInfo.dateOfBirth = empDetailsDictionary[@"DOB"];
        [empDetailsArray addObject:_employeeInfo];
    }
    _employeesTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}
-(void)copyPlistFromBundleToDocumentDirectory
{
   NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"EmployeeDetails" ofType:@"plist"];
    [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:plistPath error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma Table View delegate methods
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [empDetailsArray count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EmployeeNameCell";
    //Creating the instance of EmployeeNameViewCell
    EmployeeNameViewCell *cell = (EmployeeNameViewCell *)[_employeesTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //Populating the table view cell with employee details
    self.employeeInfo = empDetailsArray[indexPath.row];
    cell.emplyeeNameLabel.text = _employeeInfo.employeeName;
    cell.employeeImage.clipsToBounds=YES;
    cell.employeeImage.image = [UIImage imageNamed:_employeeInfo.employeeImage];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"ShowEmployeeDetails" sender:self];
}
#pragma prepare for segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     self.employeeInfo = empDetailsArray[selectedIndex];
     EmplyeeInfoViewController *destViewController = (EmplyeeInfoViewController*)segue.destinationViewController;
    destViewController.employee = self.employeeInfo;
    destViewController.selectedEmployeeIndex = *(&(selectedIndex));
}
- (IBAction)refreshButton:(id)sender
{
    [self getLatestDataFromPlst];
    [self.employeesTableView reloadData];
}
-(void)getLatestDataFromPlst
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsPath = [paths objectAtIndex:0];
    plistPath = [documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist"];
    if ([[NSFileManager defaultManager]fileExistsAtPath:plistPath])
    {
        [empDetailsArray removeAllObjects];
        [detailsFromPlistArray removeAllObjects];
        detailsFromPlistArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    for(int i = 0; i < detailsFromPlistArray.count; i++)
    {
        NSDictionary *empDetailsDictionary = detailsFromPlistArray[i];
        _employeeInfo = [[EmployeeInfo alloc]init];
        _employeeInfo.employeeName = empDetailsDictionary[@"Name"];
        _employeeInfo.employeeImage = empDetailsDictionary[@"Photo"];
        _employeeInfo.employeeID = empDetailsDictionary[@"ID"];
        _employeeInfo.employeeDesignation = empDetailsDictionary[@"Desingation"];
        _employeeInfo.dateOfBirth = empDetailsDictionary[@"DOB"];
        [empDetailsArray addObject:_employeeInfo];
    }
}
@end
