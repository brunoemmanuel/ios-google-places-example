//
//  MainViewController.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewModel.h"
#import "DetailsViewController.h"

@interface MainViewController ()

@property (nonatomic, strong, readonly) MainViewModel *viewModel;

@end

@implementation MainViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"ParkingTableViewCell"];
    
    _viewModel = [[MainViewModel alloc] init];
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager requestWhenInUseAuthorization];
    
    [[self.viewModel.hasUpdated deliverOnMainThread]  subscribeNext:^(id _) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

#pragma mark UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ParkingTableViewCell" forIndexPath:indexPath];
    
    Parking *parking = [self.viewModel parkingAtIndexPath:indexPath];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [NSString stringWithFormat:@"%@", parking.name];
    
    [[cell imageView] setImage:[UIImage imageNamed:@"icon-parking.png"]];
    [cell setNeedsLayout];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfRowsInSection:section];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [viewController setParking:[_viewModel parkingAtIndexPath:indexPath]];
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [_viewModel loadNearbyParkings:[locations objectAtIndex:0]];
}

@end
