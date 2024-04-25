//
//  QuizData.swift
//  Roulette741
//
//  Created by Diyorbek Xikmatullayev on 20/04/24.
//

import Foundation

struct QuizData {
    var question: String = ""
    var variants: [String] = []
    var answer: Int = 0
    
    static func getQuiz1Data() -> [QuizData] {
        [
            QuizData(question: "What are the two main types of odds in roulette?",
                    variants: [
                    "a) Inside and Outside odds",
                    "b) Red and Black odds",
                    "c) Even and Odd odds",
                    "d) High and Low odds",
                    ],
                    answer: 0),
            QuizData(question: """
    What does the term "inside odd" refer to in roulette?",
    """,
                    variants: [
                    "a) odds placed on specific numbers or small groups of numbers",
                    "b) odds placed on the outside edge of the odds layout",
                    "c) odds placed on red or black numbers",
                    "d) odds placed on odd or even numbers",
                    ],
                    answer: 0),
            QuizData(question: """
    Which number is typically considered the "unlucky" number in roulette?
    """,
                    variants: [
                    "a) 7",
                    "b) 13",
                    "c) 17",
                    "d) 22",
                    ],
                    answer: 1),
            QuizData(question: """
    What is the name of the green pocket on the roulette wheel?
    """,
                    variants: [
                    "a) zero",
                    "b) Double zero",
                    "c) Lucky 7",
                    "d) Blackout",
                    ],
                    answer: 0),
            QuizData(question: """
    In European roulette, how many pockets are there on the wheel?
    """,
                    variants: [
                    "a) 36",
                    "b) 37",
                    "c) 38",
                    "d) 39",
                    ],
                    answer: 0),
            QuizData(question: """
    What is the payout ratio for a winning straight-up odd in roulette?
    """,
                    variants: [
                    "a) 1:1",
                    "b) 2:1",
                    "c) 35:1",
                    "d) 50:1",
                    ],
                    answer: 2),
            QuizData(question: "What is the name of the odd that covers the entire row of numbers on the roulette table?",
                    variants: [
                    "a) Street odds",
                    "b) Corner odds",
                    "c) Split odds",
                    "d) Line odds",
                    ],
                    answer: 0),
            QuizData(question: """
    What is the purpose of the "dolly" on the roulette table?
    """,
                    variants: [
                    "a) To mark the winning number",
                    "b) To indicate where to place odds",
                    "c) To signal the end of odds",
                    "d) To distribute chips to players",
                    ],
                    answer: 0),

        ]
    }
    
    static func getQuiz2Data() -> [QuizData] {
        [
            QuizData(question: "What is the house edge on a single-zero roulette wheel?",
                    variants: [
                    "a) 2.7%",
                    "b) 5.26%",
                    "c) 7.89%",
                    "d) 10.53%",
                    ],
                    answer: 0),
            QuizData(question: "What is the difference between American & European roulette?",
                    variants: [
                    "a) The odds options available",
                    "b) The layout of the odds table",
                    "d) All of the above",
                    "d) The number of pockets on the wheel",
                    ],
                    answer: 3),
            QuizData(question: """
    What is the "en prison" rule in roulette?
    """,
                    variants: [
                    "a) A rule that allows players to take back half of their even-money odds if the ball lands on zero",
                    "b) A rule that allows players to place additional odds after the ball has been spun",
                    "c) A rule that doubles the payout for winning odds placed on specific numbers",
                    "d) A rule that prevents players from placing odds on certain sections of the roulette table",
                    ],
                    answer: 0),
            QuizData(question: "What is the name of the odd that covers five consecutive numbers on the roulette table?",
                    variants: [
                    "a) Street odds",
                    "b) Basket odds",
                    "c) Split odds",
                    "d) Line odds",
                    ],
                    answer: 1),
            QuizData(question: "What is the maximum number of players that can participate in a game of roulette?",
                    variants: [
                    "a) 4",
                    "b) 6",
                    "c) 8",
                    "d) There is no maximum limit",
                    ],
                    answer: 3),
            QuizData(question: "What is the maximum number of players that can participate in a game of roulette?",
                    variants: [
                    "a) 0, 1-36",
                    "b) 0, 00, 1-36",
                    "c) 00, 0, 1-36",
                    "d) 1-36, 0, 00",
                    ],
                    answer: 1),
        ]
    }
    
    static func getQuiz3Data() -> [QuizData] {
       [
        
        QuizData(question: "What is the Fibonacci odds system commonly used for in roulette?",
                variants: [
                "a) To determine odds sizes based on a mathematical sequence",
                "b) To predict winning numbers",
                "c) To track previous outcomes and adjust odds strategies accordingly",
                "d) To calculate the probability of specific outcomes",
                ],
                answer: 0),
        QuizData(question: "What is the name of the odd that covers four consecutive numbers on the roulette table?",
                variants: [
                "a) Corner odds",
                "b) Basket odds",
                "c) Split odds",
                "d) Line odds",
                ],
                answer: 0),
        QuizData(question: "What is the name of the odds strategy that involves doubling your odd after each loss?",
                variants: [
                "a) Paroli",
                "b) Labouchere",
                "c) Martingale",
                "d) D'Alembert",
                ],
                answer: 2),
        QuizData(question: """
What is the purpose of the "la partage" rule in roulette?
""",
                variants: [
                "a) A rule that allows players to take back half of their even-money odds if the ball lands on zero",
                "b) A rule that doubles the payout for winning odds placed on specific numbers",
                "c) A rule that requires players to place additional odds after the ball has been spun",
                "d) A rule that prevents players from placing odds on certain sections of the roulette table",
                ],
                answer: 2),
        QuizData(question: "What is the term for a odd that covers three consecutive numbers on the roulette table?",
                variants: [
                "a) Trio odds",
                "b) Street odds",
                "c) Split odds",
                "d) Corner odds",
                ],
                answer: 1),
        QuizData(question: "What is the name of the odds system that involves odds on both red and black numbers simultaneously?",
                variants: [
                "a) Red and Black",
                "b) Odd and Even",
                "c) The Labouchere System",
                "d) The Martingale System",
                ],
                answer: 0)
       ]
        
        
    }
}
