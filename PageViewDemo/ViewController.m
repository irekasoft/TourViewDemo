//
//  ViewController.m
//  PageViewDemo
//
//  Created by Hijazi on 11/7/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//
// commit

#import "ViewController.h"

@interface ViewController () {
    BOOL hasOpened;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // remove this for production app
    [defaults setBool:NO forKey:@"HasSeenTour"];

    
    BOOL hasSeenTour = [defaults boolForKey:@"HasSeenTour"];
    
    if (hasOpened == NO && hasSeenTour == NO) {
        [self viewTour:nil];
        hasOpened = YES;

        // To make tour show only one in the
        // first time
        [defaults setBool:YES forKey:@"HasSeenTour"];
        [defaults synchronize];
        //
    }
    

}


- (IBAction)viewTour:(id)sender {

    UIStoryboard *tourStoryboard = [UIStoryboard storyboardWithName:@"Tour" bundle:nil];
    TourVC *tourVC = [tourStoryboard instantiateInitialViewController];
    [self presentViewController:tourVC animated:YES completion:nil];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
