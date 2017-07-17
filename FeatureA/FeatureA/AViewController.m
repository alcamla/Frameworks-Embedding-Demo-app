//
//  AViewController.m
//  FeatureA
//
//  Created by Eugene on 7/6/17.
//  Copyright © 2017 Techery, LLC. All rights reserved.
//

#import "AViewController.h"
#import <DTDemoDomain/DTDemoDomain.h>
#import <CRDI/CRDIInjector.h>

@interface AViewController ()

@property (nonatomic, strong) id <DTFeatureBCoordinatorProtocol> ioc_featureBCoordinator;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[CRDIInjector defaultInjector] injectTo:self];

    self.navigationItem.title = @"A View Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show Details" style:UIBarButtonItemStylePlain target:self action:@selector(showDetailsButtonPressed:)];

    UIImage *image = [UIImage imageNamed:@"Cover_Placeholder" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(80, 80, 260, 260);
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDetailsButtonPressed:(id)sender {
    DTFeatureModel *model = [DTFeatureModel new];
    UIViewController *vc = [self.ioc_featureBCoordinator featureBDetailsViewControllerWithModel:model];
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
