import Foundation

let t: Int = Int(readLine()!)!

let computerOrder: [[Int]] = [
    [1],[6,2,4,8],[1,3,9,7],[6,4],[5],
    [6],[1,7,9,3],[6,8,4,2],[1,9],[10]
]

for _ in 0..<t {
    let input: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    var a: Int = input[0], b = input[1]

    if a < 10 {
        a -= 1
    } else if a > 10 && a < 100 && a % 10 != 0{
        a = a % 10
        a -= 1
    } else {
        a = 9
    }

    print(computerOrder[a][b % computerOrder[a].count])
}




