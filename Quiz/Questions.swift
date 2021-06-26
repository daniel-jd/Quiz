//
//  Questions.swift
//  Quiz
//
//  Created by Daniel Yamrak on 26.06.2021.
//

import UIKit

struct Question {
    let question: String
    let v1: String
    let v2: String
    let v3: String
    let v4: String
    let rightAnswer: String
}

let question1 = Question(question: "Какого цвета небо?",
                         v1: "Красное", v2: "Голубое", v3: "Желтое", v4: "Черное",
                         rightAnswer: "Голубое")
let question2 = Question(question: "Кто был напарником Лисы Алисы?",
                         v1: "Буратино", v2: "Папа Карло", v3: "Кот Базилио", v4: "Дуримар",
                         rightAnswer: "Кот Базилио")
let question3 = Question(question: "Что находится напротив Севера?",
                         v1: "Юг", v2: "Запад", v3: "Восток", v4: "Ничего",
                         rightAnswer: "Юг")
let question4 = Question(question: "Кто не работает - тот не...?",
                         v1: "Спит", v2: "Пьёт", v3: "Ест", v4: "Думает",
                         rightAnswer: "Ест")

let questions = [question1, question2, question3, question4]
