//
//  Questions.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

struct Question {
    let question: String
    var answers: [String]
    let rightAnswer: Int
}

private let question1 = Question(question: "Какого цвета небо?",
                         answers: ["Красное", "Голубое", "Желтое", "Черное"],
                         rightAnswer: 1)
private let question2 = Question(question: "Кто был напарником Лисы Алисы?",
                         answers: ["Буратино", "Папа Карло", "Кот Базилио", "Дуримар"],
                         rightAnswer: 2)
private let question3 = Question(question: "Что находится напротив Севера?",
                         answers: ["Юг", "Запад", "Восток", "Ничего"],
                         rightAnswer: 0)
private let question4 = Question(question: "Кто не работает - тот не ... ?",
                         answers: ["Спит", "Пьёт", "Ест", "Думает"],
                         rightAnswer: 2)

var questions = [question1, question2, question3, question4]
