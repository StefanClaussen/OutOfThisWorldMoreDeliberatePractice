//
//  STCSpaceObject.h
//  Out of this world deliberate practice

#import <Foundation/Foundation.h>
#import "AstronomicalData.h"

@interface STCSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravity;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestingFact;
@property (strong, nonatomic) UIImage *spaceImage;

- (id)initWithData:(NSDictionary*)data andImage:(UIImage*)image;

@end
