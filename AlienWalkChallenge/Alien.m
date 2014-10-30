//
//  Alien.m
//  AlienWalkChallenge
//
//  Created by Kenneth Wilcox on 10/30/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "Alien.h"

@interface Alien()
@property (nonatomic) NSMutableArray *alienAnimations;
@end

@implementation Alien

- (id) init
{
  if (!(self = [super initWithImageNamed:@"alienGreen_walk1"]))
    return nil;
  
  _alienAnimations = [[NSMutableArray alloc] init];
  NSString *path = [[NSBundle mainBundle] pathForResource:@"AlienAnimations" ofType:@"plist"];
  NSDictionary *animations = [NSDictionary dictionaryWithContentsOfFile:path];
  for (NSString *key in animations) {
    [self.alienAnimations addObject:[self animationFromArray:animations[key] withDuration:0.3]];
  }
  
  [self setIsWalking:YES];
  
  return self;
}

- (void)setIsWalking:(BOOL)isWalking
{
  _isWalking = isWalking;
  if (isWalking) {
    [self runAction:self.alienAnimations[1]];
  } else {
    [self runAction:self.alienAnimations[0]];
  }
}

- (SKAction *)animationFromArray:(NSArray *)textureNames withDuration:(CGFloat)duration
{
  NSMutableArray *frames = [[NSMutableArray alloc] init];
  SKTextureAtlas *planesAtlas = [SKTextureAtlas atlasNamed:@"Alien"];
  
  for (NSString *textureName in textureNames) {
    [frames addObject:[planesAtlas textureNamed:textureName]];
  }
  
  CGFloat frameTime = duration / (CGFloat)frames.count;
  return [SKAction repeatActionForever:[SKAction animateWithTextures:frames timePerFrame:frameTime resize:NO restore:NO]];
}

@end
