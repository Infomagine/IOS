//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by Simon on 10/12/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
//add a new properties in the DeviceDetailViewController.h for saving the selected device:
@property (strong) NSManagedObject *device;

@end
