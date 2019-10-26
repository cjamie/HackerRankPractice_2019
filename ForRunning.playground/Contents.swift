import Foundation

// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    
    
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
