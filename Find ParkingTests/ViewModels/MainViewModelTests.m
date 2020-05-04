//
//  MainViewModelTests.m
//  Find ParkingTests
//
//  Created by Bruno Rodrigues on 04/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Api.h"
#import "NearbyParkingsResponse.h"
#import "Parking.h"
#import "MainViewModel.h"
#import "Location.h"
#import "Utils.h"

#pragma mark - Mocks

@interface MockApi : Api

-(NearbyParkingsResponse *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius;

@end

@implementation MockApi

-(NearbyParkingsResponse *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius {
    NearbyParkingsResponse *response = [[NearbyParkingsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"NearbyParkingsResponseMock"]];
    
    return response;
}

@end

#pragma mark - Test Class

@interface MainViewModelTests : XCTestCase

@property (nonatomic, strong) MockApi *mockApi;
@property (nonatomic, strong) MainViewModel *viewModel;
@property (nonatomic, strong) Location *location;

@end

@implementation MainViewModelTests

- (void)setUp {
    _mockApi = [[MockApi alloc] init];
    _viewModel = [[MainViewModel alloc] initWithApi:_mockApi];
}

- (void)tearDown {
    _mockApi = nil;
}

- (void)testReturnedDataAfterLoad {
    Location *location = [[Location alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"LocationMock"]];
    [_viewModel loadNearbyParkings:location];
    XCTAssertEqual([_viewModel numberOfRowsInSection:0], 2);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
