import Foundation

let n: Int = Int(readLine()!)! // 정수 개수

for value in 1...9 {
    var mulValue: Int = n * value
    print("\(n) * \(value) = \(mulValue)")
}
