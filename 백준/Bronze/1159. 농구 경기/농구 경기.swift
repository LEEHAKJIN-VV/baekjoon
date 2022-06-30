import Foundation

let n: Int = Int(readLine()!)!
var playerDict: [String:Int] = [:] // [성:나온 횟수]

for _ in 0..<n {
    let player: String = String(readLine()!.prefix(1))
    let count: Int = playerDict[player] ?? 0
    playerDict[player] = count + 1
}

let enterPlayer = playerDict.filter{
    p in
    p.value >= 5
}
if enterPlayer.count < 1 {
    print("PREDAJA")
} else {
    for name in enterPlayer.keys.sorted() {
        print(name, terminator: "")
    }
}

