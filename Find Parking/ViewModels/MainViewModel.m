//
//  MainViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "MainViewModel.h"
#import "Utils.h"
#import "NearbyParkingsResponse.h"

@interface MainViewModel ()

@property (nonatomic, strong) NSArray *parkings;
@property (nonatomic, strong) NSString *errorMessage;
@property (nonatomic, strong) Api *api;

@end

@implementation MainViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    [self initialize];
    
    _api = [[Api alloc] init];

    return self;
}

- (instancetype)initWithApi:(Api *)api {
    self = [super init];
    if (!self) return nil;
    
    [self initialize];
    
    _api = api;
    
    return self;
}

- (void)initialize {
    _parkings = [[NSMutableArray alloc] init];

    _dataListUpdated = [RACObserve(self, parkings) mapReplace:@(YES)];
    _errorUpdated = [RACObserve(self, errorMessage) mapReplace:@(YES)];
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section {
    return [_parkings count];
}

- (void)loadNearbyParkings:(Location *)location {
    NearbyParkingsResponse * result = [_api loadNearbyParkingsWithLocation:location andRadius:300];
    if(result.error != nil) {
        [self setErrorMessage:result.error];
    } else {
        NSArray *temp = [NSArray array];
        for(int i = 0; i < result.parkings.count; i++) {
            int distance = [Utils distanceBetweenStartedLocation:[[result.parkings objectAtIndex:i] location] andFinalLocation: location];
            [[result.parkings objectAtIndex:i] setDistance:distance];
        }
        
        temp = [result.parkings sortedArrayUsingComparator:^NSComparisonResult(Parking *obj1, Parking *obj2) {
            
            if(obj1.distance == obj2.distance) {
                return 0;
            } else if(obj1.distance > obj2.distance) {
                return 1;
            } else {
                return -1;
            }
        }];
        
        [self setParkings:temp];
    }
}

- (Parking *)parkingAtIndexPath:(NSIndexPath *)indexPath {
    return [[self parkings] objectAtIndex:indexPath.row];
}

@end
