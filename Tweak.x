#import <UIKit/UIKit.h>

// Biến cờ để đảm bảo menu chỉ hiện 1 lần duy nhất khi mở app
static BOOL hasShownAlert = NO;

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig; // Giữ nguyên hoạt động gốc của ứng dụng

    if (!hasShownAlert) {
        hasShownAlert = YES;

        // Tạo menu thông báo
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thông báo"
                                                                       message:@"Tham gia server support dưới đây"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        // Tạo nút "Link sv"
        UIAlertAction *linkAction = [UIAlertAction actionWithTitle:@"Tham Gia Sv" 
                                                             style:UIAlertActionStyleDefault 
                                                           handler:^(UIAlertAction * _Nonnull action) {
            // Thay URL dưới đây bằng link server của bạn (Discord, Telegram, Zalo...)
            NSURL *url = [NSURL URLWithString:@"https://discord.gg/srEySrVXFg"];
            
            // Lệnh mở link trên iOS
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }];

        // Tạo nút "Oke" để đóng menu
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Oke" 
                                                           style:UIAlertActionStyleCancel 
                                                         handler:nil];

        // Thêm nút vào menu
        [alert addAction:linkAction];
        [alert addAction:okAction];

        // Hiển thị menu
        [self presentViewController:alert animated:YES completion:nil];
    }
}

%end
