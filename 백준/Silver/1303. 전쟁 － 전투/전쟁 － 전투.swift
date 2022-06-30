import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = input[0], m: Int = input[1]
var space: [[String]] = Array(repeating: Array(repeating: "", count: n), count: m)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
var colleage: Int = 0
var enemy: Int = 0

for i in 0..<m {
    let soldier: [String] = readLine()!.map{String($0)}
    for j in 0..<n {
        space[i][j] = soldier[j]
    }
}

startWar()
print(colleage, enemy)

func startWar(){
    for i in 0..<m {
        for j in 0..<n {
            if !visited[i][j] {
                let count: Int = dfs(i,j, space[i][j])
                if space[i][j] == "W" {
                    colleage += count * count
                } else {
                    enemy += count * count
                }
            }
        }
    }
}

func dfs(_ i: Int, _ j: Int, _ type: String) -> Int { // type: "B" 파란색 적군, "W" 아군
    if i < 0 || j < 0 || i >= m || j >= n {
        return 0
    }
    else if visited[i][j] || space[i][j] != type {
        return 0
    } else {
        visited[i][j] = true
        return 1 + dfs(i + 1,j,type) + dfs(i - 1,j,type)
        + dfs(i,j + 1,type) + dfs(i,j - 1,type)
    }
}

