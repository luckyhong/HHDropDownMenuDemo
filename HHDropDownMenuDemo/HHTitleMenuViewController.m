//
//  HHTitleMenuViewController.m
//  HHDropDownMenuDemo
//
//  Created by 韩继宏 on 16/3/29.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "HHTitleMenuViewController.h"

@implementation HHTitleMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -Tableview DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"同学";
            break;
        case 1:
            cell.textLabel.text = @"明星";
            break;
        case 2:
            cell.textLabel.text = @"亲人";
            break;
        default:
            break;
    }
    
    return cell;
}

@end
