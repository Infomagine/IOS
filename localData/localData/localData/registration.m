//
//  registration.m
//  localData
//
//  Created by Archit Rai Saxena on 14/11/2014.
//  Copyright (c) 2014 vksoft. All rights reserved.
//

#import "registration.h"
#include <CoreData/CoreData.h>
@interface registration ()

@end

@implementation registration
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.password.secureTextEntry=YES;
    // Do any additional setup after loading the view.
    //for hiding keyboard
   // [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Registration" inManagedObjectContext:context];
    [newDevice setValue:self.name.text forKey:@"name"];
    [newDevice setValue:self.password.text forKey:@"password"];
    [newDevice setValue:self.age.text forKey:@"age"];
    [newDevice setValue:self.email.text forKey:@"email"];
    [newDevice setValue:self.phoneno.text forKey:@"phone"];
   [newDevice setValue:self.dob.text forKey:@"dob"];
    NSLog(@"save success fully");
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
