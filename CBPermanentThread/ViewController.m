//
//  ViewController.m
//  CBPermanentThread
//
//  Created by walben on 2019/11/7.
//  Copyright © 2019 LB. All rights reserved.
//

#import "ViewController.h"
#import "CCViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click:(id)sender {
    
    [self presentViewController:[CCViewController new] animated:YES completion:nil];
    
}

@end
