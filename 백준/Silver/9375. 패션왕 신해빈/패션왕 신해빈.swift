let t: Int = Int(readLine()!)! // test case

for _ in 0..<t {
    var clothes: [String: Int] = [:] // [의상: 의상수]
    let n: Int = Int(readLine()!)!
    for _ in 0..<n {
        let input: [String] = readLine()!.split(separator: " ").map{String($0)}
        let count: Int = clothes[input[1]] ?? 0
        clothes[input[1]] = count + 1
    }
    var sum: Int = 1
    
    for values in clothes.values {
        sum *= values + 1
    }
    print(sum - 1)
}

