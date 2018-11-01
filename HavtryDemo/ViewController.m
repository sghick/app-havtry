//
//  ViewController.m
//  HavtryDemo
//
//  Created by 丁治文 on 2018/7/19.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>
#import <SMRLogScreen/SMRLogScreen.h>

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
    [SMRLogScreen addLine:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] linebreak:YES groupLabel:@"AdBanner"];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [SMRLogScreen addLine:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] linebreak:YES groupLabel:@"AdBanner"];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [SMRLogScreen addLine:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] linebreak:YES groupLabel:@"AdBanner"];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    [SMRLogScreen addLine:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] linebreak:YES groupLabel:@"AdBanner"];
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    [SMRLogScreen addLine:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)] linebreak:YES groupLabel:@"AdBanner"];
}


@end
