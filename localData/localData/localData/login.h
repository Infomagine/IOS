//
//  login.h
//  localData
//
//  Created by Archit Rai Saxena on 15/11/2014.
//  Copyright (c) 2014 vksoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface login : UIViewController
{
    NSArray *ara;
}
@property(nonatomic,weak) IBOutlet UITextField *name;
@property(nonatomic,weak) IBOutlet UITextField *pass;
@property(nonatomic,weak)IBOutlet UITextField *number;
@property(nonatomic,weak) IBOutlet UILabel *word;
-(IBAction)convert:(id)sender;

@end
