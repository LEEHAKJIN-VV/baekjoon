import Foundation

let intput: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
let n: Int = intput[0]
var k: Int = intput[1]

var coinType: [Int] = []
var count: Int = 0

for _ in 0..<n {
    coinType.append(Int(readLine()!)!)
}

while !coinType.isEmpty {
    let coin: Int = coinType.removeLast()
    count += k / coin
    k = k % coin
}

print(count)
