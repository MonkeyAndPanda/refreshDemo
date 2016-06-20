//
//  TableViewController.m
//  RefreshDemo
//
//  Created by 曹小猿 on 16/6/17.
//  Copyright © 2016年 曹小猿. All rights reserved.
//

#import "TableViewController.h"
#import "MJRefresh.h"
#import "MJRefreshActivityHeader.h"
@interface TableViewController ()
@property (nonatomic,strong)NSMutableArray *tableData;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  [self addData];
  
  [self setRefresh];
}
-(void)setRefresh{

  //MJRefreshStateHeader MJRefreshGifHeader MJRefreshNormalHeader
  self.tableView.header = [MJRefreshActivityHeader
 headerWithRefreshingBlock:^{
   
   [NSThread sleepForTimeInterval:1];
    [self afterRefresh];
    
  }];
  
  self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
    [NSThread sleepForTimeInterval:1];

    [self addData];
    [self.tableView reloadData];
    [self.tableView.footer endRefreshing];
  }];
  

  
  

}
-(void)afterRefresh{

  [self loadData];


  for (int i=0; i<10; i++) {
    [self.tableData insertObject:[NSString stringWithFormat:@"new%d",i] atIndex:0];

  }
  [self.tableView reloadData];
  //1000为新数据的总高，54是MJRefreshHeader的高
  [self.tableView setContentOffset:CGPointMake(0, 1000-54)];
  
//用scrollToRowAtIndexPath给人一种很突然的感觉
//  NSIndexPath * indexPath = [NSIndexPath indexPathForItem:9 inSection:0];
//  [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];

  [self.tableView.header endRefreshing];

  
}
-(void)loadData{
//

  
}
-(void)addData{
  if (self.tableData == nil) {
    self.tableData =[NSMutableArray array];
  }
  for (int i=0; i<10; i++) {
    [self.tableData addObject:[NSString stringWithFormat:@"%d",i]];
  }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

  return 100;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
