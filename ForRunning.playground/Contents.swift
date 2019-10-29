import Foundation

extension String {
    
}


extension Character {
    var isASCIIShiftable: Bool {
        guard let value = asciiValue else {
            return false
        }
        
        let acceptableRanges: [Range<Int>] = [(97...122), (65...90)]
        return acceptableRanges.contains(where: { range in
            range.contains(<#T##element: Int##Int#>)
        })
    }
}

let characters: [Character] = ["a", "z", "A", "Z"]

characters.forEach {
    print("-=- \($0) \($0.asciiValue)")
}
