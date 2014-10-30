//
//  GameScene.m
//  AlienWalkChallenge
//
//  Created by Kenneth Wilcox on 10/30/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
  SKSpriteNode *_character;
  SKAction *_walkAnimation;
  SKAction *_climbAnimation;
  BOOL _walking;
}

- (instancetype) initWithSize:(CGSize)size
{
  if (!(self = [super initWithSize:size]))
    return nil;
  
  SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Alien"];
  _character = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"alienGreen_walk1"]];
  _character.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
  [self addChild:_character];
  
  NSArray *walkFrames = @[[atlas textureNamed:@"alienGreen_walk1"],
                          [atlas textureNamed:@"alienGreen_walk2"]];
  _walkAnimation = [SKAction repeatActionForever:[SKAction animateWithTextures:walkFrames timePerFrame:0.15 resize:NO restore:NO]];
  
  NSArray *climbFrames = @[[atlas textureNamed:@"alienGreen_climb1"],
                           [atlas textureNamed:@"alienGreen_climb2"]];
  _climbAnimation = [SKAction repeatActionForever:[SKAction animateWithTextures:climbFrames timePerFrame:0.15 resize:NO restore:NO]];
  
  [_character runAction:_walkAnimation];
  _walking = YES;
  
  return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  _walking = !_walking;
  if (_walking) {
    [_character runAction:_walkAnimation];
  } else {
    [_character runAction:_climbAnimation];
  }
}

@end
