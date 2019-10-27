import Foundation

//https://stackoverflow.com/questions/45504400/regex-match-pattern-of-alternating-characters
private let alternatingRegex = "^([a-z])(?!\\1)([a-z])(?:\\1\\2)*\\1?$"

extension String {
    var isAlternating: Bool {
        return matches(alternatingRegex)
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

let inputString = "beabeefeab"

// we need to change it so that we only include two of the characters
let characterSet = Array(Set(inputString))

// this will iterate though input string and only include the int
func process(first: Character, second: Character) -> Int? {
    // we can allow access to this through a proxy
    
    let value = inputString.reduce("") { counter, next in
        if next == first || next == second {
            return counter + String(next)
        } else {
            return counter
        }
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

print(maxCounter)
