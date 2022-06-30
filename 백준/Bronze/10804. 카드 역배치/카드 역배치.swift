import Foundation

var card: [Int] = Array(1...20)

for _ in 0..<10 {
    let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a:Int = input[0], b: Int = input[1]
    card.replaceSubrange(a-1...b-1, with: card[a-1...b-1].reversed())
}

for c in card {
    print(c, terminator: " ")
}
