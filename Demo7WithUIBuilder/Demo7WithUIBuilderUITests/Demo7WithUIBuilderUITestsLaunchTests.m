//
//  Demo7WithUIBuilderUITestsLaunchTests.m
//  Demo7WithUIBuilderUITests
//
//  Created by vfa on 8/17/22.
//

#import <XCTest/XCTest.h>

@interface Demo7WithUIBuilderUITestsLaunchTests : XCTestCase

@end

@implementation Demo7WithUIBuilderUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
