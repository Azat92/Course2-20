//
//  ViewController.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "FilmsTableViewCell.h"
#import "Film.h"
#import "DetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()
@property (nonatomic, strong) NSArray <Film *> *films;
@end

@implementation ViewController

- (void)viewDidLoad {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [super viewDidLoad];
    
   
    [self.tableView registerNib:[UINib nibWithNibName:@"FilmsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FilmsTableViewCell"];
    [[NetManager sharedInstance] loadRequestWithPath:@"http://api.kinopoisk.cf/getTodayFilms" completion:^(id data, NSError *error) {
        if (data) {
            self.films = [MTLJSONAdapter modelsOfClass:[Film class] fromJSONArray:[data valueForKeyPath:@"filmsData"] error:nil];
            [self.tableView reloadData];
             [hud hide:YES afterDelay:0.3];
        }
    }];
}

- (IBAction)returnToListVC:(UIStoryboardSegue *)sender {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 102;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"FilmsTableViewCell";
    FilmsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = self.films[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
    UINavigationController *nvc =(UINavigationController *) [self presentedViewController];
    DetailViewController *dvc =(DetailViewController *)nvc.viewControllers.lastObject;
    dvc.model = self.films[indexPath.row];
    
}

@end
