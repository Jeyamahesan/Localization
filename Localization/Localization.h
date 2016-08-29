//
//  Localization.h
//  Trader
//
//  Created by Jey on 11/21/14.
//  Copyright (c) 2014 Pride Holding. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AppLanguage)
{
    AppLanguageEnglish = 0,
    AppLanguageFrench = 1,
    AppLanguageTamil = 2,
};

@interface Localization : NSObject

+ (NSString *)stringforSelectedLanguage:(NSInteger)selectedLanguage forKey:(NSString *)key;

@end
