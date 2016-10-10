//
//  ViewController.m
//  CPAlert
//
//  Created by Student P_07 on 24/09/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor colorWithRed:0.7 green:0.4 blue:0.6 alpha:1];
    
    
    //name text field
    
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(2*kHorizontalPadding, 100, 300, kAllElementHeight)];
    nameTextField.textColor= [UIColor blackColor];
    nameTextField.backgroundColor=[UIColor whiteColor];
    nameTextField.borderStyle=UITextBorderStyleBezel;
    nameTextField.borderStyle=UITextBorderStyleRoundedRect;
    nameTextField.layer.borderWidth=1;
    [nameTextField setPlaceholder:@"Enter name"];
    nameTextField.delegate=self;
    [self.view addSubview:nameTextField];
    
    
    // first alert button press
    
    
    showAlertOne= [[UIButton alloc]initWithFrame: CGRectMake(3.7*kHorizontalPadding, 100+kAllElementHeight+kVerticalPadding, 200, kAllElementHeight)];
    showAlertOne.backgroundColor = [UIColor blackColor];
    

    [showAlertOne setTitle:@"ShowAlert" forState:UIControlStateNormal];
    showAlertOne.titleLabel.font = [UIFont systemFontOfSize:20];
    showAlertOne.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    //[showAlertOne titleColorForState:[UIControlStateNormal]];
    showAlertOne.tintColor=[UIColor whiteColor];
    [showAlertOne addTarget:self action:@selector(showAlertFirst) forControlEvents:UIControlEventTouchUpInside];
    showAlertOne.layer.cornerRadius=kAllElementHeight/5;
    [self.view addSubview:showAlertOne];
    
    
    
    //age text field
    
    ageTextField =[[UITextField alloc]initWithFrame:CGRectMake(2*kHorizontalPadding, 100+(2*kAllElementHeight)+2*kVerticalPadding, 300, kAllElementHeight)];
    ageTextField.backgroundColor=[UIColor whiteColor];
    ageTextField.textColor=[UIColor blackColor];
    ageTextField.keyboardType = UIKeyboardTypeNumberPad;
    ageTextField.borderStyle=UITextBorderStyleBezel;
    ageTextField.borderStyle=UITextBorderStyleRoundedRect;
    ageTextField.layer.borderWidth=1;
    [ageTextField setPlaceholder:@"Enter age"];
    ageTextField.delegate=self;
    [self.view addSubview:ageTextField];
    
    
    //age alert button
    
    showAlertTwo=[[UIButton alloc]initWithFrame:CGRectMake(3.7*kHorizontalPadding, 100+(3*kAllElementHeight)+(3*kVerticalPadding), 200, kAllElementHeight)];
    showAlertTwo.backgroundColor = [UIColor blackColor];
        [showAlertTwo setTitle:@"ShowAlert" forState:UIControlStateNormal];
    showAlertTwo.titleLabel.font = [UIFont systemFontOfSize:20];
    showAlertTwo.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    

    //[showAlertOne titleColorForState:[UIControlStateNormal]];
    showAlertTwo.tintColor=[UIColor whiteColor];
    [showAlertTwo addTarget:self action:@selector(showAlertSecond) forControlEvents:UIControlEventTouchUpInside];
    showAlertTwo.layer.cornerRadius=kAllElementHeight/5;
    
    [self.view addSubview:showAlertTwo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// methods for all

-(BOOL) validateTextContent:(NSString *)content{
    
    if(content.length>0)
    {
        return YES;
        
    }
    else
    {
        return NO;
    }
}


-(void)nameShow:(NSString *)person{
    
    [self showAlertWithTitle:@"Hi!" message: [NSString stringWithFormat:@"Welcome %@",nameTextField.text]];
    
    
    
}

-(void) showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
        
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)errorShowForName:(NSString *)person{
    
    [self showAlertWithTitle:@"Warning..." message: [NSString stringWithFormat:@"Enter name first"]];
    
    
}
    
-(void)showAlertFirst{
    
    BOOL checkInput;
    NSString *inputText;
    inputText= nameTextField.text;
    checkInput= [ self validateTextContent:inputText];
    
    if(checkInput){
    
    [self nameShow:@"name"];
    }
    
    else{
        [self errorShowForName:@"error"];
    }
}


////////////////



-(void)ageShow:(NSString *)person{
    
    [self displayAlertWithTitle:nameTextField.text message: [NSString stringWithFormat:@"Your Age is %@ years old ",ageTextField.text]];
}

-(void) displayAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
        
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)errorShowForAge:(NSString *)person{
    
    [self displayAlertWithTitle:@"Warning..." message: [NSString stringWithFormat:@"Enter name & age"]];
    
    //[self displayAlertWithTitle:@"oops" message:@"Enter the name & age"];
}

-(void)showAlertSecond{
    BOOL checkInput;
    NSString *inputAge;
    inputAge= ageTextField.text;
    checkInput= [self validateTextContent:inputAge];
    
    if(checkInput){
        [self ageShow:@"age"];
    }
    
    else{
        [self errorShowForAge:@"error"];
    }
}

-(BOOL) resignFirstResponder:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
    
}




@end
