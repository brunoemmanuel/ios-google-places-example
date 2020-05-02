//
//  DetailsViewController.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsViewModel.h"

@interface DetailsViewController ()

@property (nonatomic, strong) DetailsViewModel *viewModel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[DetailsViewModel alloc] init];
    
    [RACObserve(self, viewModel.name) subscribeNext:^(NSString *value) {
        [[self labelName] setText:value];
    }];
    
    [RACObserve(self, viewModel.rating) subscribeNext:^(NSString *value) {
        [[self labelRating] setText:value];
    }];
    
    [RACObserve(self, viewModel.address) subscribeNext:^(NSString *value) {
        [[self labelAddress] setText:value];
    }];
    
    [RACObserve(self, viewModel.website) subscribeNext:^(NSString *value) {
        [[self labelUrl] setText:value];
    }];
    
    [RACObserve(self, viewModel.phone) subscribeNext:^(NSString *value) {
        [[self labelPhone] setText:value];
    }];
    
    [_mapView setZoomEnabled:NO];
    [_mapView setScrollEnabled:NO];
    [_mapView setUserInteractionEnabled:NO];
    
    MKCoordinateRegion region;
    region.center.latitude = _parking.location.latitude;
    region.center.longitude = _parking.location.longitude;
    region.span.latitudeDelta = 0.005;
    region.span.longitudeDelta = 0.005;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] initWithCoordinate:region.center];
    [_mapView addAnnotation:annotation];
    
    [_mapView setRegion:region animated:YES];
    
    [_viewModel setName:_parking.name];
    
    [_viewModel loadParkingDetailsWithPlaceId:_parking.placeId];
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
