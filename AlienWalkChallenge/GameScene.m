//
//  GameScene.m
//  AlienWalkChallenge
//
//  Created by Kenneth Wilcox on 10/30/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "GameScene.h"
#import "Alien.h"

@interface GameScene()
@property (nonatomic) Alien *player;
@property (nonatomic) SKNode *world;
@end

@implementation GameScene

- (instancetype) initWithSize:(CGSize)size
{
  if (!(self = [super initWithSize:size]))
    return nil;
  
  // Setup world
  _world = [SKNode node];
  [self addChild:_world];
  
  // Setup player
  _player = [[Alien alloc] init];
  _player.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
  [_world addChild:_player];
  
  return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  //  for (UITouch *touch in touches) {
  [self.player setIsWalking:!self.player.isWalking];
  //  }
}

@end
