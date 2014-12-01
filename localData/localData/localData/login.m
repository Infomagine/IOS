//
//  login.m
//  localData
//
//  Created by Archit Rai Saxena on 15/11/2014.
//  Copyright (c) 2014 vksoft. All rights reserved.
//
#import "login.h"
#import<CoreData/CoreData.h>
@interface login ()
{
  //  NSArray *specialName=[NSArray arrayWithObjects: @"",@" thousand",@" million",@" billion",@"trillion",@"quadrillion",@"quintillion",nil];
   // NSArray *tensNames=[NSArray arrayWithObjects: @"",@" ten",@" twenty",@" thirty",@" fourty",@" fifty",@" sixty",@"seventy",@" eighty",@" ninety",nil];
//NSArray *numName=[NSArray arrayWithObjects:@""," one"," two"," three"," four"," five"," six"," seven"," eight"," nine","ten"," eleven", " twelve"," thirteen"," fourteen"," fifteen"," sixteen", " seventeen"," eighteen"," nineteen", nil];
    
}

@property(strong)NSMutableArray *reg;

@end

@implementation login
+ (NSArray *)specialName
{     static NSArray *_specialName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _specialName = @[@"",@" thousand",@" million",@" billion",@" trillion",@" quadrillion",@" quintillion"];
    });
    return _specialName;
}
+ (NSArray *)tensNames
{     static NSArray *_tensNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tensNames = @[@"",@" ten",@" twenty",@" thirty",@" fourty",@" fifty",@" sixty",@"seventy",@" eighty",@" ninety"];
    });
    return _tensNames;
}
+ (NSArray *)numName
{     static NSArray *_numName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _numName = @[@"",@" one",@" two",@" three",@" four",@" five",@" six",@" seven",@" eight",@" nine",@"ten",@" eleven",@" twelve",@" thirteen",@" fourteen",@" fifteen",@" sixteen",@" seventeen",@" eighteen",@" nineteen"];
    });
    return _numName;
}
-(NSString*)convertLessThanOneThousand:(int) number
{
    NSArray *numNames = [[self class] numName];
    NSArray *tensNames=[[self class] tensNames];
  //  NSLog(@"array %@",numNames);

    NSString* current;
    
    if (number % 100 < 20){
        current = numNames[number % 100];
        number /= 100;
    }
    else {
        current = numNames[number % 10];
        number /= 10;
        
        //current = tensNames[number % 10] + current;
        current=[NSString stringWithFormat:@"%@ %@",tensNames[number % 10],current];
        number /= 10;
    }
    if (number == 0) return current;
  //  return numNames[number] + " hundred" + current;
    NSString *crntReturn=[NSString stringWithFormat:@"%@ %@ %@",numNames[number],@"hundred",current];
    NSLog(@"first %@",numNames[number]);
    NSLog(@"second %@",current);
    NSLog(@"third %@",crntReturn);
    return crntReturn;
}
-( NSString*)converty:(int)number
{
 //   NSArray *numNames = [[self class] numName];
    //NSArray *tensNames=[[self class] tensNames];
    NSArray *specialNames=[[self class]specialName];
    if (number == 0) { return @"zero"; }
    
    NSString* prefix = @"";
    
    if (number < 0) {
        number = -number;
        prefix = @"negative";
    }
    
    NSString* current = @"";
    int place = 0;
    
    do {
        int n = number % 1000;
        if (n != 0){
            NSString* s = [self convertLessThanOneThousand:n];
            NSLog(@"prize %@",s);
            //current = s + specialNames[place] + current;
            current=[NSString stringWithFormat:@"%@ %@ %@",s,specialNames[place],current];
            NSLog(@"in loop %@",current);
        }
        place++;
        number /= 1000;
    } while (number > 0);
    NSLog(@"outr loop %@",current);
    NSString* rtrn=[NSString stringWithFormat:@"%@ %@",prefix,current];
    NSLog(@"result %@",rtrn);
   // return (prefix + current).trim();
    NSString *trimmedString = [rtrn stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    return trimmedString;

}
-(IBAction)convert:(id)sender
{
    NSString *number=self.number.text;
    NSLog(@"number %@",number);
    int N=[self.number.text intValue];
    [self.word setText:[self converty:N]];
    
    [self.word setBackgroundColor:[UIColor grayColor]];
   // self.word.text= [self converty:N];
    NSLog(@"press %@",[self converty:N]);

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   NSArray *titles = [[self class] specialName];
    NSLog(@"array %@",titles);

    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
-(void)fetchRegistration
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Registration"];
    self.reg = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
   // NSLog(@"data %@",_reg);
    NSString *name=self.name.text;
    NSString *password=self.pass.text;
    for(int i=0;i<self.reg.count;i++)
    {
        
        
     NSManagedObject *device = [self.reg objectAtIndex:i];
        NSLog(@"user %@ ,%@",[device valueForKey:@"name"],[device valueForKey:@"password"]);
        NSString *n=[device valueForKey:@"name"];
        NSString *p=[device valueForKey:@"password"];
    if([name isEqualToString:n ] && [password isEqualToString:p])
        {
            NSLog(@"login successfully");
            NSLog(@"index no = %d",i);
            [self performSegueWithIdentifier:@"xxx" sender:nil];
            
        }
        else
        {
            NSLog(@"login failed");
        }
    }
    NSLog(@"login failed please do regiter first");
    NSLog(@"info %@ %@",self.name.text,self.pass.text);
   // , [device valueForKey:@"version"]]];
    //[cell.detailTextLabel setText:[device valueForKey:@"company"]];
}
-(IBAction)login:(id)sender
{

    [self fetchRegistration];
    NSString *name=self.name.text;
    NSString *password=self.pass.text;
    NSLog(@"name %@",name);
    NSLog(@"pass %@",password);
}


@end
