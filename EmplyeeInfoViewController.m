//
//  EmplyeeInfoViewController.m
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmplyeeInfoViewController.h"

@interface EmplyeeInfoViewController ()
{
    NSDictionary *empDetailsDictionary;
}
@end

@implementation EmplyeeInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.employee.employeeName;
    
    //Fill employee details in respective text fields
    self.employeeNameTextField.text = self.employee.employeeName;
    self.empImage.image = [UIImage imageNamed:self.employee.employeeImage];
    self.employeeIDTextField.text = self.employee.employeeID;
    self.employeeDesignationTextField.text = self.employee.employeeDesignation;
    self.employeeDobTextField.text = self.employee.dateOfBirth;
    
    //Fill employee details in the labels
    self.employeeNameLabel.text = self.employee.employeeName;
    self.employeeIDLabel.text = self.employee.employeeID;
    self.employeeDesignationLabel.text = self.employee.employeeDesignation;
    self.employeeDobLabel.text = self.employee.dateOfBirth;
    
    //Hide all the text fields when page is loaded
    [self.employeeNameTextField setHidden:YES];
    [self.employeeDobTextField setHidden:YES];
    [self.employeeDesignationTextField setHidden:YES];
    [self.employeeIDTextField setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Update
- (IBAction)updateEmployeeDetailsButton:(id)sender
{
    //Hide the employee details labels and display text fields on click of update
    [self.employeeNameLabel setHidden:YES];
    [self.employeeNameTextField setHidden:NO];
    [self.employeeIDLabel setHidden:YES];
    [self.employeeDesignationTextField setHidden:NO];
    [self.employeeDesignationLabel setHidden:YES];
    [self.employeeIDTextField setHidden:NO];
    [self.employeeDobLabel setHidden:YES];
    [self.employeeDobTextField setHidden:NO];
}
#pragma mark - Save
- (IBAction)saveButton:(id)sender
{
    //Hide the employee details labels and display text fields on click of update
    [self.employeeNameLabel setHidden:NO];
    [self.employeeNameTextField setHidden:YES];
    [self.employeeIDLabel setHidden:NO];
    [self.employeeDesignationTextField setHidden:YES];
    [self.employeeDesignationLabel setHidden:NO];
    [self.employeeIDTextField setHidden:YES];
    [self.employeeDobLabel setHidden:NO];
    [self.employeeDobTextField setHidden:YES];
    NSMutableArray *detailsFromPlistArray ;
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist"];
   if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
         detailsFromPlistArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    }
        empDetailsDictionary = detailsFromPlistArray[self.selectedEmployeeIndex];
    [empDetailsDictionary setValue:self.employeeNameTextField.text forKey:@"Name"];
    [detailsFromPlistArray writeToFile:[documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist" ]atomically:YES];
    [empDetailsDictionary setValue:self.employeeIDTextField.text forKey:@"ID"];
    [detailsFromPlistArray writeToFile:[documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist" ]atomically:YES];
    [empDetailsDictionary setValue:self.employeeDobTextField.text forKey:@"DOB"];
    [detailsFromPlistArray writeToFile:[documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist" ]atomically:YES];
    [empDetailsDictionary setValue:self.employeeDesignationTextField.text forKey:@"Designation"];
    [detailsFromPlistArray writeToFile:[documentsPath stringByAppendingPathComponent:@"EmployeeDetails.plist" ]atomically:YES];
    self.employeeNameLabel.text = empDetailsDictionary[@"Name"];
    self.employeeIDLabel.text = empDetailsDictionary[@"ID"];
    self.employeeDobLabel.text = empDetailsDictionary[@"DOB"];
    self.employeeDesignationLabel.text = empDetailsDictionary[@"Designation"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
} */

@end
