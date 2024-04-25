//
//  ShopData.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 22/04/24.
//

import Foundation

struct ShopData {
    var title: String = ""
    var imageNames: [String] = []
    var price: Int = 0
    
    static func getShopData() -> [ShopData] {
        [
            ShopData(title: "pack #1",
                     imageNames: [
                     "coin1.1",
                     "coin1.2",
                     "coin1.3",
                     "coin1.4"],
                     price: 50),
            ShopData(title: "pack #2",
                     imageNames: [
                     "coin2.1",
                     "coin2.2",
                     "coin2.3",
                     "coin2.4"],
                     price: 75),
            ShopData(title: "pack #3",
                     imageNames: [
                     "coin3.1",
                     "coin3.2",
                     "coin3.3",
                     "coin3.4"],
                     price: 100),
            ShopData(title: "pack #4",
                     imageNames: [
                     "coin4.1",
                     "coin4.2",
                     "coin4.3",
                     "coin4.4"],
                     price: 200),
            ShopData(title: "pack #5",
                     imageNames: [
                     "coin5.1",
                     "coin5.2",
                     "coin5.3",
                     "coin5.4"],
                     price: 300)
        ]
    }
}
