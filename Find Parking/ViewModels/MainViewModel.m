//
//  MainViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "MainViewModel.h"
#import "Connection.h"

@interface MainViewModel ()

@property (nonatomic, strong) NSArray *parkings;

@end

@implementation MainViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;

    _hasUpdated = [RACObserve(self, parkings) mapReplace:@(YES)];

    return self;
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section {
    return [_parkings count];
}

- (void)loadNearbyParkings:(CLLocation *)location {
    NSArray * temp = [[[Connection alloc] init] loadNearbyParkingsWithLatitude:location.coordinate.latitude andLongitude:location.coordinate.longitude andRadius:300];
    [self setParkings:temp];
}

- (Parking *)parkingAtIndexPath:(NSIndexPath *)indexPath {
    return [[self parkings] objectAtIndex:indexPath.row];
}

@end
