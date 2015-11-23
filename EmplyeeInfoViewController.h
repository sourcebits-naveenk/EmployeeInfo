//
//  EmplyeeInfoViewController.h
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeInfo.h"

@interface EmplyeeInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *empImage;
@property (weak, nonatomic) IBOutlet UITextField *employeeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeDesignationTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeDobTextField;
@property (weak, nonatomic) IBOutlet UILabel *employeeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeDesignationLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeDobLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) EmployeeInfo *employee;
@property (nonatomic) NSInteger selectedEmployeeIndex;

@end
