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
@property (weak, nonatomic) IBOutlet UILabel *empNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *empIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *empDesgnationLabel;
@property (weak, nonatomic) IBOutlet UILabel *empDOBLabel;
@property (strong, nonatomic) EmployeeInfo *employee;
@end
