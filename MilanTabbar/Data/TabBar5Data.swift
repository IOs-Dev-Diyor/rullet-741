//
//  TabBar5Data.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 19/04/24.
//

import Foundation

struct TabBar5Data {
    var title: String = ""
    var backImageName: String = ""
    var level: String = ""
    var cardIcon: String = ""
    var descTitle: String = ""
    var desc: String = ""
    
    static func getTabBar5Data() -> [TabBar5Data] {
        [
            TabBar5Data(title: "QUIZ #1. Beginner’s luck",
                        backImageName: "quizimage1",
                        level: "8 questions - EASY",
                        cardIcon: "cardIcon1",
                        descTitle: "Welcome to Roulette Beginner’s luck Quiz!",
                        desc: """
Test your knowledge and expertise in the exciting world of roulette with our series of quizzes. Whether you're a beginner looking to learn the basics or a seasoned player seeking to challenge yourself, we've got quizzes tailored to different skill levels
"""),
            TabBar5Data(title: "QUIZ #2. are you a pro?",
                        backImageName: "quizimage2",
                        level: "6 questions - MEDIUM",
                        cardIcon: "cardIcon2",
                        descTitle: "Welcome to Roulette\nare you a pro Quiz!",
                        desc: """
Test your knowledge and expertise in the exciting world of roulette with our series of quizzes. Whether you're a beginner looking to learn the basics or a seasoned player seeking to challenge yourself, we've got quizzes tailored to different skill levels
"""),
            TabBar5Data(title: "QUIZ #3. You know everything",
                        backImageName: "quizimage3",
                        level: " questions - HARD",
                        cardIcon: "cardIcon3",
                        descTitle: "Welcome to Roulette\nYou know everything quiz!",
                        desc: """
Test your knowledge and expertise in the exciting world of roulette with our series of quizzes. Whether you're a beginner looking to learn the basics or a seasoned player seeking to challenge yourself, we've got quizzes tailored to different skill levels
"""),
     
        ]
    }
}
