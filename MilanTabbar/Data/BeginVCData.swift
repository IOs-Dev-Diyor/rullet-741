//
//  BeginVCData.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 16/04/24.
//

import Foundation

struct BeginVCData {
    var named: String = ""
    var title: String = ""

   static func getData() -> [BeginVCData] {
        [
            BeginVCData(named: "begin1",
                        title: "find out all about Croupiers"),
            BeginVCData(named: "begin2",
                        title: "learn roulette effective strategies"),
            BeginVCData(named: "begin3",
                        title: "Maximize Roulette Experience: Essential Tips & Tricks"),
            BeginVCData(named: "begin4",
                        title: "try our roulette simulator"),
            BeginVCData(named: "begin5",
                        title: "try your knowledge with our quizzes"),
        ]
    }
}
