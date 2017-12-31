//
//  PlayingCard.swift
//  PlayingCard_Draw
//
//  Created by Chris William Sehnert on 12/21/17.
//  Copyright © 2017 InSehnDesigns. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank) \(suit)" }
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(rawValue)"}
        
        case hearts = "❤️"
        case spades = "♠️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.hearts, .spades, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "A"
            case .face(let kind): return kind
            case .numeric: return "\(order)"
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
        
    }
}

























