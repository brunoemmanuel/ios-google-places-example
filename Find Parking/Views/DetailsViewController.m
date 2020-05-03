//
//  DetailsViewController.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsViewModel.h"
#import "Utils.h"

@interface DetailsViewController ()

@property (nonatomic, strong) DetailsViewModel *viewModel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[DetailsViewModel alloc] init];
    
    [[_viewModel nameUpdated] subscribeNext:^(id x) {
        [[self labelName] setText:[[self viewModel] parkingName]];
    }];
    
    [[_viewModel addressUpdated] subscribeNext:^(id x) {
        [[self labelAddress] setText:[[self viewModel] parkingAddress]];
    }];
    
    [[_viewModel ratingUpdated] subscribeNext:^(id x) {
        [[self labelRating] setText:[[self viewModel] parkingRating]];
    }];
    
    [[_viewModel websiteUpdated] subscribeNext:^(id x) {
        [[self labelUrl] setText:[[self viewModel] parkingWebsite]];
    }];
    
    [[_viewModel phoneUpdated] subscribeNext:^(id x) {
        [[self labelPhone] setText:[[self viewModel] parkingPhone]];
    }];
    
    [[_viewModel locationUpdated] subscribeNext:^(id x) {
        Location *location = [[self viewModel] parkingLocation];
        if(location != nil) {
            MKCoordinateRegion region;
            region.center.latitude = location.latitude;
            region.center.longitude = location.longitude;
            region.span.latitudeDelta = 0.005;
            region.span.longitudeDelta = 0.005;
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] initWithCoordinate:region.center];
            [[self mapView] addAnnotation:annotation];
            
            [[self mapView] setRegion:region animated:YES];
        }
    }];
    
    [[_viewModel errorUpdated]  subscribeNext:^(id _) {
        NSString *errorMessage = [[self viewModel] errorMessage];
        if(errorMessage != nil) {
            [Utils showAlertErrorWithError:errorMessage andParent:self];
        }
    }];
    
    [_mapView setZoomEnabled:NO];
    [_mapView setScrollEnabled:NO];
    [_mapView setUserInteractionEnabled:NO];
    
    
    [_viewModel loadParkingDetailsWithPlaceId:_placeId];
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
