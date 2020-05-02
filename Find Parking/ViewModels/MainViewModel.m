//
//  MainViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "MainViewModel.h"
#import "Connection.h"
#import "Location.h"
#import "Utils.h"

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

- (void)loadNearbyParkings:(CLLocation *)clLocation {
    Location *location = [[Location alloc] init];
    [location setLatitude:clLocation.coordinate.latitude];
    [location setLongitude:clLocation.coordinate.longitude];
    
    NSArray * temp = [[[Connection alloc] init] loadNearbyParkingsWithLocation:location andRadius:300];
    
    temp = [temp sortedArrayUsingComparator:^NSComparisonResult(Parking *obj1, Parking *obj2) {
        int dist1 = [Utils distanceBetweenStartedLocation:[obj1 location] andFinalLocation: location];
        int dist2 = [Utils distanceBetweenStartedLocation:[obj2 location] andFinalLocation: location];
        
        if(dist2 < dist1) {
            NSLog([NSString stringWithFormat:@"%@ - %i", obj2.name, dist2]);
            return dist2;
        } else {
            NSLog([NSString stringWithFormat:@"%@ - %i", obj1.name, dist1]);
            return dist1;
        }
    }];
    
    [self setParkings:temp];
}

- (Parking *)parkingAtIndexPath:(NSIndexPath *)indexPath {
    return [[self parkings] objectAtIndex:indexPath.row];
}

@end
