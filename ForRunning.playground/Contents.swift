
import Foundation

let string1 = "abc"

extension String {
    var halvedStrings: (start: String, end: String) {
        return (
            start: String(self[startIndex..<halfIndex]),
            end: String(self[halfIndex..<endIndex])
        )
    }
    
    private var halfIndex: Index {
        return index(startIndex, offsetBy: count / 2)
    }
}

let halves = string1.halvedStrings
print(halves)
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

print((numberOfNumbersRequired + 1)/2)
