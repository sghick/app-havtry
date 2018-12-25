//
//  ViewController.m
//  HavtryDemo
//
//  Created by 丁治文 on 2018/7/19.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>
#import "SMRLogSys.h"

@interface ViewController ()<ADBannerViewDelegate>

@property (strong, nonatomic) ADBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.bannerView];
    self.bannerView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
    self.bannerView.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ADBannerView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        _bannerView.delegate = self;
    }
    return _bannerView;
}


#pragma mark - ADBannerViewDelegate
- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    SMRLog0(@"", @"AdBanner");
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    SMRLog0(@"", @"AdBanner");
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    SMRLog0(@"", @"AdBanner");
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    SMRLog0(@"", @"AdBanner");
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    SMRLog0(@"", @"AdBanner");
}


@end
