//
//  InfoViewController.m
//  TASK
//
//  Created by Admin on 31.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "InfoViewController.h"
#import "infoTableViewCell.h"
#import "UIColor+UIColor_RSSchool.h"
#import "DetailViewController.h"


@interface InfoViewController () <UITableViewDelegate,UITableViewDataSource,PHPhotoLibraryChangeObserver>

@property(strong, nonatomic) NSDateComponentsFormatter *formatter;

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation InfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableView = [UITableView new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Info";
    
   

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:[infoTableViewCell reuseId] bundle:nil] forCellReuseIdentifier:@"CellId"];
 
    [self.view addSubview:self.tableView];
    
     [self setupLoyaout];
    
    [self configureFormatter];
    
     __weak typeof(self) weakSelf = self;
      [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
          if (PHAuthorizationStatusAuthorized) {

              [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
              
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  PHFetchOptions *options = [[PHFetchOptions alloc] init];
                  options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
                  
                  weakSelf.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
                  
                  dispatch_async(dispatch_get_main_queue(), ^{
                      [weakSelf.tableView reloadData];
                  });
              });
          } else {
              
          }
      }];
    
    
    
    
}

- (void) setupLoyaout {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
  
   
        [NSLayoutConstraint activateConstraints:@[
            [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
            [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
            [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
            [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        ]];
   
    
}


- (void)dealloc
{
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}

#pragma mark - handle the table


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UIScreen.mainScreen.bounds.size.width * 0.2;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    infoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"forIndexPath:indexPath];
        
    self.imageManager = [[PHCachingImageManager alloc] init];
    PHAsset *asset = self.assetsFetchResults[indexPath.row];
    cell.representedAssetIdentifier = asset.localIdentifier;

    __weak typeof(cell) weakCell = cell;

    cell.imageRequestID = [self.imageManager requestImageForAsset:asset targetSize:cell.imageView.image.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info){
         dispatch_async(dispatch_get_main_queue(), ^{

             if ([cell.representedAssetIdentifier isEqualToString:asset.localIdentifier]) {
               weakCell.imageView.image = result;
               weakCell.titleLabel.text = [asset valueForKey:@"filename"];
             }
         });
     }];

    switch (asset.mediaType) {
        case PHAssetMediaTypeUnknown: {
            cell.iconView.image = [UIImage imageNamed:@"other"];
            cell.imageView.image = [UIImage imageNamed:@"icons8-minus-128"];
            cell.discriptionLabel.text = @"";
            break;
        }
        case PHAssetMediaTypeImage: {
            cell.iconView.image = [UIImage imageNamed:@"image"];
            cell.discriptionLabel.text = [NSString stringWithFormat:@"%lux%lu",(unsigned long)asset.pixelWidth, asset.pixelHeight];
            break;
        }
        case PHAssetMediaTypeVideo: {
            cell.iconView.image = [UIImage imageNamed:@"video"];
            cell.discriptionLabel.text = [NSString stringWithFormat:@"%lux%lu %@",(unsigned long)asset.pixelWidth, asset.pixelHeight, [self.formatter stringFromTimeInterval:asset.duration]];
            break;
        }
        case PHAssetMediaTypeAudio: {
            cell.iconView.image = [UIImage imageNamed:@"audio"];
            cell.imageView.image = [UIImage imageNamed:@"icons8-musical-100"];
            cell.discriptionLabel.text = [NSString stringWithFormat:@"%@", [self.formatter stringFromTimeInterval:asset.duration]];
            break;
        }
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.assetsFetchResults count];
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];

    [self.navigationController pushViewController:[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle] asset:asset] animated:YES];

}


- (void)configureFormatter {
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.unitsStyle = NSDateComponentsFormatterUnitsStylePositional;
    formatter.allowedUnits = (NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitHour);
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    self.formatter = formatter;
}


#pragma mark - handle the photo


- (void)photoLibraryDidChange:(nonnull PHChange *)changeInstance {
    
    PHFetchResultChangeDetails *tableChanges = [changeInstance changeDetailsForFetchResult:self.assetsFetchResults];
    if (tableChanges == nil) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{

        self.assetsFetchResults = [tableChanges fetchResultAfterChanges];
        
        UITableView *tableView = self.tableView;
        
        if (![tableChanges hasIncrementalChanges] || [tableChanges hasMoves]) {
           
            [tableView reloadData];
            
        } else {
           
            if (@available(iOS 11.0, *)) {
                [tableView performBatchUpdates:^{
                    NSIndexSet *removedIndexes = [tableChanges removedIndexes];
                    if ([removedIndexes count] > 0) {
                        [tableView deleteRowsAtIndexPaths:[self indexPathsFromIndexSet:removedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                    
                    NSIndexSet *insertedIndexes = [tableChanges insertedIndexes];
                    if ([insertedIndexes count] > 0) {
                        [tableView insertRowsAtIndexPaths:[self indexPathsFromIndexSet:insertedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                    
                    NSIndexSet *changedIndexes = [tableChanges changedIndexes];
                    if ([changedIndexes count] > 0) {
                        [tableView reloadRowsAtIndexPaths:[self indexPathsFromIndexSet:changedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                } completion:NULL];
            } else {
      
                NSIndexSet *removedIndexes = [tableChanges removedIndexes];
                if ([removedIndexes count] > 0) {
                    [tableView deleteRowsAtIndexPaths:[self indexPathsFromIndexSet:removedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                
                NSIndexSet *insertedIndexes = [tableChanges insertedIndexes];
                if ([insertedIndexes count] > 0) {
                    [tableView insertRowsAtIndexPaths:[self indexPathsFromIndexSet:insertedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                
                NSIndexSet *changedIndexes = [tableChanges changedIndexes];
                if ([changedIndexes count] > 0) {
                    [tableView reloadRowsAtIndexPaths:[self indexPathsFromIndexSet:changedIndexes] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
            }
        }
    });
}


- (NSArray *)indexPathsFromIndexSet:(NSIndexSet *)indexSet {
    NSMutableArray *paths = [[NSMutableArray alloc] init];
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop) {
        [paths addObject:[NSIndexPath indexPathForRow:index inSection:0]];
    }];
    return paths;
}


@end
