//
//  JSViewController.m
//  TestingArabic
//
//  Created by MSP_MacBookPro on 19/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSViewController.h"
#import "ASIFormDataRequest.h"

@interface JSViewController ()

@end

@implementation JSViewController
@synthesize txtName;
@synthesize txtAdress;
@synthesize requestIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [requestIndicator setHidden:YES];
    [requestIndicator setHidesWhenStopped:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtName:nil];
    [self setTxtAdress:nil];
    [self setRequestIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [txtName release];
    [txtAdress release];
    [requestIndicator release];
    [super dealloc];
}
- (IBAction)btnSubmitClicked:(UIButton *)sender {
    
    [requestIndicator setHidden:NO];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost/TestArabic/insert.php"]];
    
    [request setRequestMethod:@"POST"];
    [request setPostValue:txtName.text forKey:@"name"];
    [request setPostValue:txtAdress.text forKey:@"address"];
    [request setDidFailSelector:@selector(requestFailed:)];
    [request setDidFinishSelector:@selector(requestFinished:)];
    [request setDelegate:self];
    [request startAsynchronous];
    [request release];
    
    [txtName resignFirstResponder];
    [txtAdress resignFirstResponder];
    
}


-(void)requestFailed:(ASIFormDataRequest *)request{
    [requestIndicator stopAnimating];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[request.error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alert show];
    [alert release];
    

}

-(void)requestFinished:(ASIFormDataRequest *)request{
    [requestIndicator stopAnimating];
    
    NSLog(@"req %@",request.responseString);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:request.responseString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alert show];
    [alert release];
    
    
   
}



@end
