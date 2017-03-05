//
//  RulesSingleton.h
//  FirstTestTask
//
//  Created by Alex Hafros on 05.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"

@interface RulesSingleton : NSObject

- (NSString *)returnStringWithRule:(ProductModel *)product count:(NSUInteger)count langPrefix:(NSString *)langPrefix;

+(RulesSingleton *)sharedInstance;

@end
