//
//  EmplyeeInfoViewController.m
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmplyeeInfoViewController.h"

@interface EmplyeeInfoViewController ()

@end

@implementation EmplyeeInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.employee.employeeName;
    self.empNameLabel.text = self.employee.employeeName;
    self.empImage.image = [UIImage imageNamed:self.employee.employeeImage];
    self.empIDLabel.text = self.employee.employeeID;
    self.empDesgnationLabel.text = self.employee.employeeDesignation;
    self.empDOBLabel.text = self.employee.dateOfBirth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
