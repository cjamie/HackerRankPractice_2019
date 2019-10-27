//
//  PreOptimized.swift
//  
//
//  Created by Jamie Chu on 10/26/19.
//

import Foundation

private enum Constants {
    //https://stackoverflow.com/questions/45504400/regex-match-pattern-of-alternating-characters
    static let alternatingRegex = "^([a-z])(?!\\1)([a-z])(?:\\1\\2)*\\1?$"
}

extension String {
    var isAlternating: Bool {
        return matches(Constants.alternatingRegex)
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

// Complete the alternate function below.
func alternate(inputString: String) -> Int {
    
    // let inputString = "beabeefeab"
    
    // we need to change it so that we only include two of the characters
    let characterSet = Array(Set(inputString))
    
    // this will iterate though input string and only include the int
    func process(first: Character, second: Character) -> Int? {
        // we can allow access to this through a proxy
        
        let value = inputString.reduce("") { counter, next in
            return next == first || next == second
                ? counter + String(next)
                : counter
        }
        
        return value.isAlternating ? value.count : nil
    }
    
    var maxCounter = 0
    
    for i in stride(from: 0, to: characterSet.count, by: 1) {
        for j in stride(from: i+1, to: characterSet.count, by: 1) {
            if let newValue = process(first: characterSet[i], second: characterSet[j]) {
                maxCounter = max(maxCounter, newValue)
            }
        }
    }
    return maxCounter
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let l = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

let result = alternate(inputString: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
