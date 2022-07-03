let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let a: Int = input[0], b: Int = input[1]
let minSum: Int = cheangeNumber(a, "min") + cheangeNumber(b, "min")
let maxSum: Int = cheangeNumber(a, "max") + cheangeNumber(b, "max")

print(minSum, maxSum)

// 5 -> 6 6 -> 5
func cheangeNumber(_ num: Int, _ method: String) -> Int {
    let minNum: String = String(num)
    var result: String = ""
    var changeDict: [Character:String] = [:]
    
    if method == "min" {
        changeDict["6"] = "5"
    } else if method == "max" {
        changeDict["5"] = "6"
    } else { print("error") }
    
    for st in minNum {
        if let str: String = changeDict[st] {
           result += str
        } else {
            result += String(st)
        }
    }
    return Int(result)!
}
