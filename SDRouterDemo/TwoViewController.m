//
//  TwoViewController.m
//  MethodTest
//
//  Created by as_one on 2017/7/15.
//  Copyright © 2017年 as_one. All rights reserved.
//

#import "TwoViewController.h"
#import "SDRouter.h"
#import "SDConstant.h"
#import "SDWebView.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

+ (void)load {
    [[SDRouter shareRutor] addPaten:TwoController callback:^(SDRouterContext *context) {
        NSDictionary *dict = context.paramters;
        TwoViewController *twoVc = [TwoViewController new];
        twoVc.navigationItem.title = dict[@"title"];
        [context.topNavigationController pushViewController:twoVc animated:YES];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SDWebView *webView = [[SDWebView alloc] initWithFrame:self.view.bounds];
    [webView loadLocalHTMLWithFileName:@"source"];
    [self.view addSubview:webView];
    webView.urlBlock = ^(NSString *urlString) {
        if ([urlString rangeOfString:AppSchema].location != NSNotFound) {
            [[SDRouter shareRutor] rutor:[NSURL URLWithString:urlString]];
        }
    };

}





@end
