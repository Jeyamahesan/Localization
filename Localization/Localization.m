//
//  Localization.m
//  Trader
//
//  Created by Jey on 11/21/14.
//  Copyright (c) 2014 Pride Holding. All rights reserved.
//

#import "Localization.h"

@implementation Localization

+ (NSString *)stringforSelectedLanguage:(NSInteger)selectedLanguage forKey:(NSString *)key
{
    NSString *path = nil;
    
    switch (selectedLanguage)
    {
        case AppLanguageEnglish:
            path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
            break;
            
        case AppLanguageFrench:
            path = [[NSBundle mainBundle] pathForResource:@"fr" ofType:@"lproj"];
            break;
            
        case AppLanguageTamil:
            path = [[NSBundle mainBundle] pathForResource:@"ta" ofType:@"lproj"];
            break;
            
        default:
            path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
            break;
    }
    
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
    NSString* str = [languageBundle localizedStringForKey:key value:@"" table:nil];
    return str;
}

@end
