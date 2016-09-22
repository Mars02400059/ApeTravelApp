//
//  HomeViewController.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "HomeOneTableViewCell.h"


static NSString *const cellIndetofier = @"cell";

@interface HomeViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, retain) NSMutableArray *tableViewArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
    
    
    
}

- (void)createSubView {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 50) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
#warning 高度需要自适应
//    tableView.rowHeight = 370;
    /// 第二种高度
    tableView.rowHeight = 380;
    [self.view addSubview:tableView];
    self.tableViewArray = [NSMutableArray array];
    // 网络请求 + 解析数据
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://open.qyer.com/qyer/home/home_feed?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=A1000052A2BCDD&track_app_version=7.0.2&track_app_channel=baidu&track_device_info=PD1524B&track_os=Android5.1&app_installtime=1474192132493&page=1";
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dataDic = [responseObject objectForKey:@"data"];
        NSDictionary *feedDic = [dataDic objectForKey:@"feed"];
        NSArray *entryArray = [feedDic objectForKey:@"entry"];
        for (NSDictionary *entryDic in entryArray) {
            HomeModel *homeModel = [[HomeModel alloc] initWithDic:entryDic];
            [_tableViewArray addObject:homeModel];
        }
        
        [tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error : %@", error);
    }];
    

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableViewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeModel *homeModel = _tableViewArray[indexPath.row];
    
    
    HomeOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetofier];
    if (nil == cell) {
        cell = [[HomeOneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetofier];
    }
    cell.homeModel = homeModel;
    
    NSLog(@"%@", homeModel.author);
    
    return cell;
    
//    if (1 == homeModel.type && 0 == homeModel.author.count) {
//        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetofier];
//        if (nil == cell) {
//            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetofier];
//        }
//        cell.homeModel = homeModel;
//        return cell;
//    } else {
//        HomeOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetofier];
//        if (nil == cell) {
//            cell = [[HomeOneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetofier];
//        }
//        cell.homeModel = homeModel;
//        return cell;
//    }
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
