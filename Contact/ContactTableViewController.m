//
//  ContactTableViewController.m
//  Contact
//
//  Created by Jonathan Archille on 12/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTownTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;


@end

@implementation ContactTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    
    if (textField == self.nameTextField)
    {
        if (![self.nameTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.streetAddressTextField becomeFirstResponder];
            NSLog(@"first works");
        }
    }
    else if (textField == self.streetAddressTextField)
    {
        if (([self.streetAddressTextField.text rangeOfCharacterFromSet:NSCharacterSet.letterCharacterSet].location != NSNotFound)
            && ([self.streetAddressTextField.text rangeOfCharacterFromSet:NSCharacterSet.decimalDigitCharacterSet].location != NSNotFound)
            && [self.streetAddressTextField.text containsString:@" "]) // string contains letters and numbers and 1 whitespace
        {
            returnValue = YES;
            [self.cityTownTextField becomeFirstResponder];
            NSLog(@"Yay");
        }
        
    }
    
    return returnValue;
}


@end
