//
//  ViewController.h
//  CPAlert
//
//  Created by Student P_07 on 24/09/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kAllElementHeight 50.0
#define kHorizontalPadding 30.0
#define kVerticalPadding 20.0

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    
    CGFloat *screenHeight;
    CGFloat *screenWidth;
    UITextField *nameTextField;
    UITextField *ageTextField;
    UIButton *showAlertOne;
    UIButton *showAlertTwo;
    
    
    
    
    
}

@end

