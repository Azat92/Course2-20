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
#import "DetailViewController.h"
#import "Film.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray <Film *> *films;
@property NSInteger selectedItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"FilmsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FilmsTableViewCell"];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [[NetManager sharedInstance] loadRequestWithPath:@"http://api.kinopoisk.cf/getTodayFilms" completion:^(id data, NSError *error) {
            if (data) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.films = [MTLJSONAdapter modelsOfClass:[Film class] fromJSONArray:[data valueForKeyPath:@"filmsData"] error:nil];
                    [self.tableView reloadData];
                    [hud hide:YES];
                    static dispatch_once_t onceToken;
                    dispatch_once(&onceToken, ^{
                        [self performSelector:@selector(showHint) withObject:nil afterDelay:0.1];
                    });
                });
            }
        }];
    });
}

- (void)showHint {
    [self performSegueWithIdentifier:@"toHitTableViewController" sender:self];
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
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedItem = indexPath.row;
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
        UINavigationController *nvc = [segue destinationViewController];
        DetailViewController *vc = [[nvc viewControllers] firstObject];
        vc.film = self.films[self.selectedItem];
    }
}

@end
