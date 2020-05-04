//
//  Find_ParkingUITests.m
//  Find ParkingUITests
//
//  Created by Bruno Rodrigues on 30/04/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DefaultUITests : XCTestCase

@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation DefaultUITests

- (void)setUp {
    self.continueAfterFailure = NO;
    
    _app = [[XCUIApplication alloc] init];
    NSMutableArray<NSString *> *arguments = [[_app launchArguments] mutableCopy];
    [arguments addObject:@"UI-TESTING"];
    [_app setLaunchArguments:arguments];
    
    [_app launch];
}

- (void)tearDown {
    _app = nil;
}

- (void)testItemListTappedAndOpenDetails {
    XCUIElement *tableView = _app.tables[@"MainTableView"];
    XCUIElement *cell = [[tableView cells] elementBoundByIndex:0];
    [cell tap];
    
    XCUIElement *label = [[_app staticTexts] objectForKeyedSubscript:@"LabelName"];
    XCTAssertTrue([label.label isEqualToString:@"test-name"]);
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end

