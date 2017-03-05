//
//  RulesSingleton.m
//  FirstTestTask
//
//  Created by Alex Hafros on 05.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import "RulesSingleton.h"

@implementation RulesSingleton

static RulesSingleton * sharedInstance = NULL;
+(RulesSingleton *)sharedInstance {
    if (!sharedInstance || sharedInstance == NULL) {
        sharedInstance = [RulesSingleton new];
    }
    return sharedInstance;
}

static NSString * const kOneRule = @"one";
static NSString * const kFewRule = @"few";
static NSString * const kManyRule = @"many";


static NSString * RussianRuleForCount(NSUInteger count) {
    
    NSUInteger plural=(count%10==1 && count%100!=11 ? 0 : count%10>=2 && count%10<=4 && (count%100<10 || count%100>=20) ? 1 : 2);
    
    switch (plural) {
        case 0:
            return kOneRule;
            break;
        case 1:
            return kFewRule;
            break;
            
            break;
        default:
            break;
    }
    return kManyRule;
}

static NSString * EnglishRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kOneRule;
        default:
            return kManyRule;
    }
}

static NSString * StringWithLangAndRule(NSString* lang, NSString* str, NSUInteger count){
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"products" ofType:@"plist"]];
    
    if ([lang isEqualToString:@"en"]) {
        return [[[dictionary objectForKey:lang] objectForKey:str] objectForKey:EnglishRuleForCount(count)];
        //return TTTEnglishPluralRuleForCount(count);
    }
    else if ([lang isEqualToString:@"ru"]){
        return [[[dictionary objectForKey:lang] objectForKey:str] objectForKey:RussianRuleForCount(count)];
        //return TTTRussianPluralRuleForCount(count);
    }
    else{
        return nil;
    }
    
}

- (NSString *)returnStringWithRule:(ProductModel *)product count:(NSUInteger)count langPrefix:(NSString *)langPrefix{
    
    
    
    return StringWithLangAndRule(langPrefix, product.name, count);
}

@end
