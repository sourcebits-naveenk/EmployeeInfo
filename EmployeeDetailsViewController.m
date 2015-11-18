//
//  ViewController.m
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmployeeDetailsViewController.h"

@interface EmployeeDetailsViewController ()

{
    NSMutableArray *detailsFromPlistArray;
}

@end

@implementation EmployeeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Registering the Nib
    [_employeesTableView registerNib:[UINib nibWithNibName:@"EmployeeNameViewCell" bundle:nil] forCellReuseIdentifier:@"EmployeeNameCell"];
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"EmployeeDetails" ofType:@"plist"];
    detailsFromPlistArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    _employeesTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [detailsFromPlistArray count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EmployeeNameCell";
    EmployeeNameViewCell *cell = (EmployeeNameViewCell *)[_employeesTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *dic = detailsFromPlistArray[indexPath.row];
    _employeeInfo = [[EmployeeInfo alloc]init];
    _employeeInfo.employeeName = dic[@"Name"];
    _employeeInfo.employeeImage = dic[@"Photo"];
    cell.emplyeeNameLabel.text =_employeeInfo.employeeName;
    cell.employeeImage.image = [UIImage imageNamed:_employeeInfo.employeeImage];
    return cell;
}


@end
