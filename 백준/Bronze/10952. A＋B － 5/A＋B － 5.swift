import Foundation

while true {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a: Int = inputs[0], b: Int = inputs[1]
    
    if a == 0 && b == 0 {
        break
    }
    print(a+b)
}