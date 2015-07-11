//
//  ViewController.h
//  PageViewDemo
//
//  Created by Hijazi on 11/7/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentVC.h"

@interface TourVC : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    
    // bookeeping
    NSUInteger pageIndex;
    
}

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *tourArray;




@end

