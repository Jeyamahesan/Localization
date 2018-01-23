//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Jey on 8/26/16.
//  Copyright © 2016 Jey. All rights reserved.
//

#import "ViewController.h"
#import "Localization.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

@interface ViewController () <UIActionSheetDelegate>
{
    IBOutlet UITableView *infoTableView;
    IBOutlet UIButton *changeLanguageButton;
    
    NSUInteger currentLanguage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentLanguage = AppLanguageEnglish;
    
    [changeLanguageButton setTitle:[Localization stringforSelectedLanguage:currentLanguage forKey:@"10"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)titles
{
    NSArray *titles = [NSArray arrayWithObjects:
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"01"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"02"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"03"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"04"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"05"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"06"],
                       [Localization stringforSelectedLanguage:currentLanguage forKey:@"07"], nil];
    
    return titles;
}

- (NSArray *)information
{
    NSArray *info = [NSArray arrayWithObjects:
                     [Localization stringforSelectedLanguage:currentLanguage forKey:@"12"],
                     [Localization stringforSelectedLanguage:currentLanguage forKey:@"09"],
                     @"8.4/10",
                     @"1 July 2016",
                     [Localization stringforSelectedLanguage:currentLanguage forKey:@"13"],
                     [NSString stringWithFormat:@"%@, %@",[Localization stringforSelectedLanguage:currentLanguage forKey:@"13"],[Localization stringforSelectedLanguage:currentLanguage forKey:@"14"]],
                     @"http://www.imdb.com/title/tt5849148/", nil];
    
    return info;
}

- (UIColor *)neroColor
{
    return UIColorFromRGB(0x1D1D1D);
}

- (IBAction)changeLanguage:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[Localization stringforSelectedLanguage:currentLanguage forKey:@"10"]
                                                             delegate:self
                                                    cancelButtonTitle:[Localization stringforSelectedLanguage:currentLanguage forKey:@"11"]
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"English", @"French", @"Tamil", nil];
    
    [actionSheet showInView:self.view];
}

- (void)refresh
{
    [infoTableView reloadData];
    
    [changeLanguageButton setTitle:[Localization stringforSelectedLanguage:currentLanguage forKey:@"10"] forState:UIControlStateNormal];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self titles].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [Localization stringforSelectedLanguage:currentLanguage forKey:@"08"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @autoreleasepool
    {
        @try
        {
            static NSString *cellIdentifier = @"Cell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                
                cell.backgroundColor = [self neroColor];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.detailTextLabel.textColor = [UIColor lightTextColor];
            }
            
            cell.textLabel.text = [[self information] objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [[self titles] objectAtIndex:indexPath.row];
            
            return cell;
        }
        @catch (NSException *exception)
        {
            
        }
    }
}

#pragma mark - UIActionsheet Delegete

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    @try
    {
        if(buttonIndex != actionSheet.cancelButtonIndex)
        {
            currentLanguage = buttonIndex;
            [self refresh];
        }
    }
    @catch (NSException *exception)
    {
        
    }
}

@end
