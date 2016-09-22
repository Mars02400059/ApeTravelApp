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
#import "HomeTwoTableViewCell.h"
#import "HomeThreeTableViewCell.h"




@interface HomeViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) NSMutableArray *tableViewArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
    
    
    
}

- (void)createSubView {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 50) style:UITableViewStylePlain];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
#warning 高度需要自适应
    
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

/// 调节高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    /// 第一种高度
//    tableView.rowHeight = 370;
//    /// 第二种高度
//    tableView.rowHeight = 380;
//    /// 第三种高度
//    tableView.rowHeight = 370.f;
//    /// 第四种高度
//    tableView.rowHeight = 420;
    HomeModel *homeModel = _tableViewArray[indexPath.row];
    if (1 == homeModel.type && 0 == homeModel.author.count) {
        return 370.f;
    } else if (2 == homeModel.type) {
        return 370.f;
    } else if (3 == homeModel.type) {
        return 420.f;
    } else {
        return 380.f;
    }
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableViewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeModel *homeModel = _tableViewArray[indexPath.row];
    
//    static NSString *const cell2Indetofier = @"cell2";
//    HomeTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell2Indetofier];
//    if (nil == cell) {
//        cell = [[HomeTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell2Indetofier];
//    }
//    cell.homeModel = homeModel;
//    return cell;
    
#if 1
    if (1 == homeModel.type && 0 == homeModel.author.count) {
        static NSString *const cell1Indetofier = @"cell1";
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1Indetofier];
        if (nil == cell) {
            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell1Indetofier];
        }
        cell.homeModel = homeModel;
        return cell;
    } else if (2 == homeModel.type) {
        static NSString *const cell2Indetofier = @"cell2";
        HomeTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell2Indetofier];
        if (nil == cell) {
            cell = [[HomeTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell2Indetofier];
        }
        cell.homeModel = homeModel;
        return cell;
    } else if (3 == homeModel.type) {
        static NSString *const cell3Indetofier = @"cell3";
        HomeThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell3Indetofier];
        if (nil == cell) {
            cell = [[HomeThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell3Indetofier];
        }
        cell.homeModel = homeModel;
        
        return cell;
    }  else {
        static NSString *const cell4Indetofier = @"cell4";
        HomeOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell4Indetofier];
        if (nil == cell) {
            cell = [[HomeOneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell4Indetofier];
        }
        cell.homeModel = homeModel;
        return cell;
    }
#endif
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
