//
//  PreOptimized.swift
//  
//
//  Created by Jamie Chu on 10/26/19.
//

import Foundation

private extension String {
    var halvedStrings: (start: String, end: String)? {
        guard isHalvable else { return nil }
        return (
            start: String(self[startIndex..<halfIndex]),
            end: String(self[halfIndex..<endIndex])
        )
    }
    
    private var halfIndex: Index {
        return index(startIndex, offsetBy: count / 2)
    }
    
    private var isHalvable: Bool {
        return count % 2 == 0
    }
}

// Complete the anagram function below.
func anagram(s: String) -> Int {
    
    guard let halves = s.halvedStrings else { return -1 }
    func constructFrequencyDistribution(from inputString: String) -> [Int] {
        
        func characterToInt(_ character: Character) -> Int {
            return Int(character.asciiValue!) - 97
        }
        
        var counter = Array(repeating: 0, count: 26)
        
        inputString.forEach { value in
            counter[characterToInt(value)] += 1
        }
        
        return counter
    }
    
    let zipped = zip(
        constructFrequencyDistribution(from: halves.start),
        constructFrequencyDistribution(from: halves.end)
    )
    
    let numberOfNumbersRequired = zipped.reduce(0) { counter, next in
        let difference = abs(next.0 - next.1)
        return counter + difference
    }
    
    return numberOfNumbersRequired/2
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }
    
    let result = anagram(s: s)
    
    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
