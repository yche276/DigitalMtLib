//
//  TextViewController.m
//  DigitalMtLib
//
//  Created by Victor Chen on 4/9/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "TextViewController.h"
#import "UIDevice+Info.h"

@interface TextViewController (){
    
}
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString *text;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textView.selectable = NO;
    self.textView.editable = NO;
    self.textView.text = self.text;
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

-(void)setupText:(NSString *)prmText{
    NSLog(@"prmText = %@", prmText);
    self.text = prmText;
}

@end
