//
//  ViewController.h
//  EmployeeInfo
//
//  Created by Naveen Katari on 18/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeInfo.h"
#import "EmployeeNameViewCell.h"

@interface EmployeeDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *employeesTableView;
@property (strong, nonatomic) EmployeeInfo *employeeInfo;



@end

