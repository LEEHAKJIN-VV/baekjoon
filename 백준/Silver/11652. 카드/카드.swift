import Foundation

let n: Int64 = Int64(readLine()!)!
var cardDict: [Int64:Int] = [:]

for _ in 0..<n {
    let cardNumber: Int64 = Int64(readLine()!)!
    let key = cardDict[cardNumber] ?? 0
    cardDict[cardNumber] = key + 1
}

let maxCard = cardDict.min(by: {
    return ($0.value == $1.value) ? $0.key <  $1.key : $0.value > $1.value
})

print(maxCard!.key)
