//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Max Tkach on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents {
    NSUInteger totalPrice = 0;
    for (FISItem *item in self.items) {
        totalPrice += item.priceInCents;
    }
    return totalPrice;
}

-(void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item {
    for (NSUInteger i = 0; i < self.items.count; i++) {
        if ([item isEqual:self.items[i]]) {
            [self.items removeObjectAtIndex:i];
            return;
        }
    }
}

-(void)removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc {
    NSArray *sorted = [self.items sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(FISItem *)a name];
        NSString *second = [(FISItem *)b name];
        return [first compare:second];
    }];
    self.items = [sorted mutableCopy];
}

-(void)sortItemsByNameDesc {
    NSArray *sorted = [self.items sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(FISItem *)a name];
        NSString *second = [(FISItem *)b name];
        return [second compare:first];
    }];
    self.items = [sorted mutableCopy];
}

-(void)sortItemsByPriceInCentsAsc {
    NSArray *sorted = [self.items sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *first = @([(FISItem *)a priceInCents]);
        NSNumber *second = @([(FISItem *)b priceInCents]);
        return [first compare:second];
    }];
    self.items = [sorted mutableCopy];
}

-(void)sortItemsByPriceInCentsDesc {
    NSArray *sorted = [self.items sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *first = @([(FISItem *)a priceInCents]);
        NSNumber *second = @([(FISItem *)b priceInCents]);
        return [second compare:first];
    }];
    self.items = [sorted mutableCopy];
}

-(NSArray *)allItemsWithName:(NSString *)name {
    NSMutableArray *itemsWithName = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {
        if ([item.name isEqualToString:name]) {
            [itemsWithName addObject:item];
        }
    }
    return itemsWithName;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minimumPrice {
    NSMutableArray *itemsWithMinimumPrice = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {
        if (item.priceInCents >= minimumPrice) {
            [itemsWithMinimumPrice addObject:item];
        }
    }
    return itemsWithMinimumPrice;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maximumPrice {
    NSMutableArray *itemsWithMaximumPrice = [[NSMutableArray alloc] init];
    for (FISItem *item in self.items) {
        if (item.priceInCents <= maximumPrice) {
            [itemsWithMaximumPrice addObject:item];
        }
    }
    return itemsWithMaximumPrice;
}





@end
