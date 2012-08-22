//
//  JSViewController.h
//  TestingArabic
//
//  Created by MSP_MacBookPro on 19/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *txtName;
@property (retain, nonatomic) IBOutlet UITextField *txtAdress;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *requestIndicator;
- (IBAction)btnSubmitClicked:(UIButton *)sender;
@end
