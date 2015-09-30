//
//  WBAddressBook.h
//  WBAddressBook
//
//  Created by Ivan Trufanov on 08.01.15.
//  Copyright (c) 2015 Werbary. All rights reserved.
//

@import UIKit;
@import AddressBook;

typedef void (^WBBlockSuccess)();
typedef void (^WBBlockFail)(ABAuthorizationStatus status);

@interface WBAddressBook : NSObject
+ (void) performWithABAccess:(WBBlockSuccess)blockSuccess;
+ (void) performWithABAccess:(WBBlockSuccess)blockSuccess onFail:(WBBlockFail)blockFail;
@end
