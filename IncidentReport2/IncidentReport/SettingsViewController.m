//
//  SettingsViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/14/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "SettingsViewController.h"
#import "DocPath.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize nameField;
@synthesize hospitalField;
@synthesize phoneField;
@synthesize emailField;
@synthesize roleField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    NSString *path = [DocPath getPath].path;
    NSLog(@"%@",path);
    dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    [nameField setText:[dict valueForKey:@"Name"]];
    [emailField setText:[dict valueForKey:@"Email"]];
    [phoneField setText:[dict valueForKey:@"Phone #"]];
    [hospitalField setText:[dict valueForKey:@"Hospital"]];
    [roleField setText:[dict valueForKey:@"Role"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)fieldChanged:(id)sender {
    
    if([sender tag] == 1)
        [dict setValue:nameField.text forKey:@"Name"];
    if([sender tag] == 2)
        [dict setValue:emailField.text forKey:@"Email"];
    if([sender tag] == 3)
        [dict setValue:phoneField.text forKey:@"Phone #"];
    if([sender tag] == 4)
        [dict setValue:hospitalField.text forKey:@"Hospital"];
    if([sender tag] == 5)
        [dict setValue:roleField.text forKey:@"Role"];
    
    NSString *docPath = [DocPath getPath].path;
    
    [dict writeToFile:docPath atomically:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}


@end
