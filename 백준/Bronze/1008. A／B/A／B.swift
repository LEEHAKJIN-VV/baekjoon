import Foundation

let inputs = readLine()!.split(separator: " ").map{Double(String($0))!}
let a: Double = inputs[0], b: Double = inputs[1]

print(a/b)