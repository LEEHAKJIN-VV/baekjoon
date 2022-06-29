let n: Int = Int(readLine()!)! // 기록 수
var logInfo: [String:String] = [:] // [사람: 출입기록]

for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map{String($0)}
    let name: String = input[0], comOut: String = input[1]
    if comOut == "enter" { // 출입
        logInfo[name] = comOut
    } else {
        logInfo[name] = nil
    }
}

for (k,v) in logInfo.sorted(by: { $0.key > $1.key}) {
    print(k)
}
//4
//a enter
//b enter
//c enter
//d enter
