//
//  PageContentVC.m
//  PageViewDemo
//
//  Created by Hijazi on 11/7/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import "PageContentVC.h"

@interface PageContentVC ()

@end

@implementation PageContentVC

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.img_bg.image = [UIImage imageNamed:self.imageFile];
    self.lbl_title.text = self.titleText;
    self.tv_body.text = self.body;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
