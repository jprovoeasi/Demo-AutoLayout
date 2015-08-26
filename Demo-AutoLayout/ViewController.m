//
//  ViewController.m
//  Demo-AutoLayout
//
//  Created by Jonathan Provo on 17/08/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;
@property (assign, nonatomic) BOOL boolean;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animateConstraint:nil];
}

- (void)animateConstraint:(id)sender
{
    [UIView animateWithDuration:(arc4random_uniform(2) + 0.1) animations:^{
        self.constraint.constant = (self.boolean ? arc4random_uniform(200) : 0.0f);
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        self.boolean = !self.boolean;
        [self performSelector:@selector(animateConstraint:) withObject:nil afterDelay:0.2];
    }];
}

- (IBAction)didTapButton:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"modalSegue" sender:self];
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)segue
{
    
}

@end
