//
//  ViewController.m
//  PageViewDemo
//
//  Created by Hijazi on 11/7/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import "TourVC.h"

@interface TourVC ()
@property (weak, nonatomic) IBOutlet UIButton *btn_skip;
@property (weak, nonatomic) IBOutlet UIButton *btn_done;

@end

@implementation TourVC

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    


    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Tour" ofType:@"plist"];

    self.tourArray = [NSArray arrayWithContentsOfFile:path];

    // start from 0
    pageIndex = 0;
    
    // Create page view controller

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentVC *startingViewController = [self viewControllerAtIndex:pageIndex];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view insertSubview:_pageViewController.view atIndex:0];
    [self.pageViewController didMoveToParentViewController:self];
    
    
    //
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    
    self.pageControl.numberOfPages = [self.tourArray count];

}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index  = ((PageContentVC *) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentVC*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.tourArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentVC *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.tourArray count] == 0) || (index >= [self.tourArray count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentVC *pageContentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentVC"];
    pageContentVC.imageFile = self.tourArray[index][@"image"];
    pageContentVC.titleText = self.tourArray[index][@"title"];
    pageContentVC.body = self.tourArray[index][@"body"];
    pageContentVC.pageIndex = index;
    pageIndex = index;
    
    return pageContentVC;
}

#pragma mark - UIPageViewControllerDataSource
// A page indicator will be visible if both methods are implemented, transition style is 'UIPageViewControllerTransitionStyleScroll', and navigation orientation is 'UIPageViewControllerNavigationOrientationHorizontal'.
// Both methods are called in response to a 'setViewControllers:...' call, but the presentation index is updated automatically in the case of gesture-driven navigation.

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    
    return [self.tourArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    
    
    return pageIndex;
}

#pragma mark - actions

- (IBAction)skip:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)done:(id)sender {
    
    
    
    if (pageIndex == [self.tourArray count]-1) {

        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        
        PageContentVC *startingViewController = [self viewControllerAtIndex:++pageIndex];
        
        NSArray *viewControllers = @[startingViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
        [self prepareForDone];
        
    }
    
   
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    
    [self prepareForDone];

    
    
}

- (void)prepareForDone{
    
    pageIndex = [self standardPageControl].currentPage;
    self.pageControl.currentPage = pageIndex;
    
    if (pageIndex == [self.tourArray count]-1) {
        [self.btn_done setTitle:@"Done" forState:UIControlStateNormal];
    }else{
        [self.btn_done setTitle:@"Next" forState:UIControlStateNormal];
        
    }
    
}

#pragma mark -

- (UIPageControl *)standardPageControl{
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    return thisControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
