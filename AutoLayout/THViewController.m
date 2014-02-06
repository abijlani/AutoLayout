//
//  THViewController.m
//  AutoLayout
//
//  Created by Workshop on 2/4/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "THViewController.h"

@interface THViewController ()

@end

@implementation THViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self addConstraints];
}

- (void) addConstraints {
    
    [self.view removeConstraints:self.view.constraints];
    
    
    UILabel *firstName = self.firstName;
    UILabel *lastName = self.lastName;
    UIImageView *imageView = self.imageView;
    UITextView *comment = self.textView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(firstName,lastName,imageView,comment);
    
    NSDictionary *metrics = @{@"width": @160.0, @"horizontalSpacing":@15.0, @"verticalSpacing":@10};
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            @"H:|-[imageView(100)]-horizontalSpacing-[firstName(>=width)]-|"
                                                                   options:NSLayoutFormatAlignAllTop
                                                                   metrics:metrics
                                                                     views:views];
    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[lastName(>=width)]-|"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];

    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[comment(>=width)]-|"
                                                           options:NSLayoutFormatAlignAllBottom
                                                           metrics:metrics
                                                             views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"V:|-50-[firstName]-verticalSpacing-[lastName]-verticalSpacing-[comment]"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];


    [self.view addConstraints:constraints];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











