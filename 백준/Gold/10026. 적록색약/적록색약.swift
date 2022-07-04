
let n: Int = Int(readLine()!)! // 구역의 수
var sector: [[String]] = Array(repeating: [], count: n) // 2차원 구역
let dir: [[Int]] = [[1,0],[0,1],[-1,0],[0,-1]] // 방향
let rgDisease: [String:Int] = ["R": 0, "G": 0, "B": 1] // 적록색약인 사람이 본 색
let rgNotDisease: [String:Int] = ["R": 1, "G": 2, "B": 3] // 적록색약이 아닌 사람이 본 색
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n) // 방문 배열
var answer: [Int] = [] // [적록색약이 아닌 사람이 본 구역 수, 적록색약인 사람이 본 구역 수]

// 구역 그리기
for i in 0..<n {
    let painted: [String] = readLine()!.map{String($0)}
    sector[i] = painted
}

answer.append(dfsAll(n, rgNotDisease)) // 적록색약이 아닌 사람
visited = Array(repeating: Array(repeating: false, count: n), count: n) // 방문 배열 초기화
answer.append(dfsAll(n, rgDisease)) // 적록색약인 사람

// print result
for i in answer {
    print(i, terminator: " ")
}

// rgIsExist: true -> 적록색약 o, false -> 적록색약 x
func dfsAll(_ n: Int, _ rgIsExist: [String:Int]) -> Int {
    var sectorCount: Int = 0 // 구역의 개수
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] { // 방문하지 않은 구역을 탐색
                if let colorValue: Int = rgIsExist[sector[i][j]] {
                    dfs(i, j, colorValue, rgIsExist)
                }
                sectorCount += 1
            }
        }
    }
    return sectorCount
}

func dfs(_ x: Int, _ y: Int, _ colorValue: Int, _ colorDistin: [String:Int]) {
    for d in dir {
        let newX: Int = x + d[0], newY: Int = y + d[1]
        if newX < 0 || newY < 0 || newX > n - 1 || newY > n - 1 { // 구역을 벗어나는 경우 continue
            continue
        }
        
        // 다음 구역이 방문하지 않고 같은 색인 경우에 탐색
        if !visited[newX][newY] && colorValue == colorDistin[sector[newX][newY]]! {
            visited[newX][newY] = true
            dfs(newX, newY, colorValue, colorDistin)
        }
    }
}
