//
//  WBAddressBook.m
//  WBAddressBook
//
//  Created by Ivan Trufanov on 08.01.15.
//  Copyright (c) 2015 Werbary. All rights reserved.
//

#import "ABHelper.h"

@implementation WBAddressBook

+ (void) performWithABAccess:(WBBlockSuccess)blockSuccess {
    [ABHelper performWithABAccess:blockSuccess onFail:nil];
}
+ (void) performWithABAccess:(WBBlockSuccess)blockSuccess onFail:(WBBlockFail)blockFail {
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    if (status == kABAuthorizationStatusDenied ||
        status == kABAuthorizationStatusRestricted) {
        if (blockFail) {
            blockFail(status);
        }
    } else if (status == kABAuthorizationStatusAuthorized) {
        blockSuccess();
    } else {
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error){
            if (granted){
                blockSuccess();
            } else {
                blockFail(ABAddressBookGetAuthorizationStatus());
            }
        });
    }
}

@end
