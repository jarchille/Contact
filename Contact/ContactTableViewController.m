//
//  ContactTableViewController.m
//  Contact
//
//  Created by Jonathan Archille on 12/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTownTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (nonatomic, retain) UIPickerView *statePickerView;

@end

@implementation ContactTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *states = [[NSArray alloc] initWithObjects: @"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    [self.statePickerView setDelegate:self];
    [self.statePickerView setDataSource:self];
    [self.statePickerView setShowsSelectionIndicator:YES];
    self.stateTextField.inputView = self.statePickerView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return states.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.stateTextField.text = states[row];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return states[row];
}


#pragma mark - Text Field

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    
    if (textField == self.nameTextField)
    {
        if (![self.nameTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.nameTextField becomeFirstResponder];
        }
    }
    else if (textField == self.streetAddressTextField)
    {
        // checks for presence of letters, digits, and 1 whitespace
        if (([self.streetAddressTextField.text rangeOfCharacterFromSet:NSCharacterSet.letterCharacterSet].location != NSNotFound)
            && ([self.streetAddressTextField.text rangeOfCharacterFromSet:NSCharacterSet.decimalDigitCharacterSet].location != NSNotFound)
            && [self.streetAddressTextField.text containsString:@" "])
        {
            returnValue = YES;
            [self.cityTownTextField becomeFirstResponder];
            
        }
    }
    else if (textField == self.cityTownTextField)
    {
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        if ([self.cityTownTextField.text rangeOfCharacterFromSet:set].location == NSNotFound) //evaluates as TRUE if no numerals present
        {
            returnValue = YES;
            [self.zipTextField becomeFirstResponder];
        }
    }
    else if (textField == self.zipTextField)
    {
        if ([self.zipTextField.text length] == 5)
        {
           if ([self.zipTextField.text rangeOfCharacterFromSet:NSCharacterSet.letterCharacterSet].location != NSNotFound)
           {
              returnValue = YES;
              [self.phoneTextField becomeFirstResponder];

           }
        }
    }
    else if (textField == self.phoneTextField)
    {
         if ([self.phoneTextField.text rangeOfCharacterFromSet:NSCharacterSet.letterCharacterSet].location != NSNotFound)
            {
                returnValue = YES;
                [self.phoneTextField resignFirstResponder];
            }
        
    }
    return returnValue;
}


@end
