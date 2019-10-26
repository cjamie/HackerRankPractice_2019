//
//  PreOptimized.swift
//  
//
//  Created by Jamie Chu on 10/26/19.
//

import Foundation

// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    
    func makeOccuranceCache(from stringArr: [String]) ->[String: Int] {
        var _cache: [String: Int] = [:]
        stringArr.forEach { string in
            _cache[string] = (_cache[string] ?? 0) + 1
        }
        return _cache
    }
    
    let magazineCache = makeOccuranceCache(from: magazine)
    let noteRequirement = makeOccuranceCache(from: note)
    
    
    func checkFor(req: [String: Int], in arr2: [String: Int]) -> Bool {
        for element in req {
            if let magValue = arr2[element.key], magValue >= element.value {
                continue
            } else {
                return false
            }
        }
        return true
    }
    print(checkFor(req: noteRequirement, in: magazineCache) ? "Yes" : "No")
    
}

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let magazineTemp = readLine() else { fatalError("Bad input") }
let magazine: [String] = magazineTemp.split(separator: " ").map {
    String($0)
}

guard magazine.count == m else { fatalError("Bad input") }

guard let noteTemp = readLine() else { fatalError("Bad input") }
let note: [String] = noteTemp.split(separator: " ").map {
    String($0)
}

guard note.count == n else { fatalError("Bad input") }

checkMagazine(magazine: magazine, note: note)
