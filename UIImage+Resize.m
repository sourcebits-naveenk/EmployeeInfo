//
//  UIImage+Resize.m
//  EmployeeInfo
//
//  Created by Naveen Katari on 19/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

+ (UIImage*)imageWithImage:(UIImage *)image
              scaledToSize:(CGSize)newSize
{
    
    float heightToWidthRatio = image.size.height / image.size.width;
    float scaleFactor = 1;
    if(heightToWidthRatio > 0) {
        scaleFactor = newSize.height / image.size.height;
    } else {
        scaleFactor = newSize.width / image.size.width;
    }
    
    CGSize newSize2 = newSize;
    newSize2.width = image.size.width * scaleFactor;
    newSize2.height = image.size.height * scaleFactor;
    UIGraphicsBeginImageContext(newSize2);
    [image drawInRect:CGRectMake(0,0,newSize2.width,newSize2.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
