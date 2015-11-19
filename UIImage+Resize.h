//
//  UIImage+Resize.h
//  EmployeeInfo
//
//  Created by Naveen Katari on 19/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

+ (UIImage*)imageWithImage:(UIImage *)image
              scaledToSize:(CGSize)newSize;

@end
