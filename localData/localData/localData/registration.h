//
//  registration.h
//  localData
//
//  Created by Archit Rai Saxena on 14/11/2014.
//  Copyright (c) 2014 vksoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registration : UIViewController
@property(nonatomic,weak)IBOutlet UITextField *name;
@property(nonatomic,weak)IBOutlet UITextField *age;
@property(nonatomic,weak)IBOutlet UITextField *password;
@property(nonatomic,weak)IBOutlet UITextField *email;
@property(nonatomic,weak)IBOutlet UITextField *phoneno;
@property(nonatomic,weak)IBOutlet UITextField *dob;
-(IBAction)save:(id)sender;

@end
