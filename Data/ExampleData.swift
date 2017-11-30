//
//  ExampleData.swift
//  SSUSchedulePlanner
//
//  Created by Ivan Lim on 11/14/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed

    }
}

public var sectionsData: [Section] = [
    Section(name: "CS Core Classes", items: [
        Item(name: "CS 115", detail: ""),
        Item(name: "CS 210", detail: ""),
        Item(name: "CS 215", detail: ""),
        Item(name: "CS 242", detail: ""),
        Item(name: "CS 252", detail: ""),
        Item(name: "CS 315", detail: ""),
        Item(name: "CS 355", detail: ""),
        Item(name: "CS 370", detail: ""),
        Item(name: "CS 450", detail: ""),
        Item(name: "CS 454", detail: ""),
        Item(name: "CS 460", detail: ""),
        Item(name: "CS 470", detail: ""),
        ]),
    Section(name: "General Education", items: [
        Item(name: "C1: Critcal Thinking", detail: ""),
        ]),
    Section(name: "Other", items: [
        Item(name: "WEPT", detail: ""),
        ])
]

public var termData: [Section] = [
    Section(name: "Fall 2017", items: [
        Item(name: "CS 115", detail: ""),
        Item(name: "CALC 161", detail: ""),
        Item(name: "PHIL 120", detail: ""),
        Item(name: "SPAN 101", detail: ""),
        ]),
    Section(name: "Spring 2018", items: [
        Item(name: "CS 215", detail: ""),
        Item(name: "CS 210", detail: ""),
        Item(name: "CS 242", detail: ""),
        Item(name: "CALC 211", detail: ""),
        ])
]



