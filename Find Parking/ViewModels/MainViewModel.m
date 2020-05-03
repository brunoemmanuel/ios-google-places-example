//
//  MainViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "MainViewModel.h"
#import "Api.h"
#import "Location.h"
#import "Utils.h"

@interface MainViewModel ()

@property (nonatomic, strong) NSArray *parkings;

@end

@implementation MainViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    _parkings = [[NSMutableArray alloc] init];

    _dataListUpdated = [RACObserve(self, parkings) mapReplace:@(YES)];

    return self;
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section {
    return [_parkings count];
}

- (void)loadNearbyParkings:(CLLocation *)clLocation {
    Location *location = [[Location alloc] init];
    [location setLatitude:clLocation.coordinate.latitude];
    [location setLongitude:clLocation.coordinate.longitude];
    
    NSArray<Parking *> * result = [[[Api alloc] init] loadNearbyParkingsWithLocation:location andRadius:300];
    result = [result sortedArrayUsingComparator:^NSComparisonResult(Parking *obj1, Parking *obj2) {
        
        if(obj1.distance == obj2.distance) {
            return 0;
        } else if(obj1.distance > obj2.distance) {
            return 1;
        } else {
            return -1;
        }
    }];
    
    [self setParkings:result];
}

- (Parking *)parkingAtIndexPath:(NSIndexPath *)indexPath {
    return [[self parkings] objectAtIndex:indexPath.row];
}

@end
