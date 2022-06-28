import Foundation

class Room {
    private let loc: [Int]
    private var dis: Int
    
    init(_ loc: [Int], _ dis: Int) {
        self.loc = loc
        self.dis = dis
    }
    public func getLoc() -> [Int] {
        return self.loc
    }
    public func getDis() -> Int {
        return self.dis
    }
    
}

struct Queue<T> {
    private var items = [T]()
    
    public mutating func enqueue(_ item: T) {
        items.append(item)
    }
    public mutating func dequeue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    public func isEmpty() -> Bool {
        return items.isEmpty ? true : false
    }
    
}

let input: [Int] = readLine()!.split(separator: " ").map{Int($0)!} // 입력
let m: Int = input[0], n: Int = input[1]
let maxLen: Int = max(m,n)

let board: [[Int]] = makeBoard(m, n) // board
var disBoard: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: m) // 안전거리를 가지는 board

var maxSafeDis: Int = Int.min // 안전 거리 최댓값 init: Int.min
let dir: [[Int]] = [[-1,-1],[-1,0],[-1,1], // 움직일 수 있는 8가지 방향: top -> down 방향
                    [0,-1],[0,1],
                    [1,-1],[1,0],[1,1]]
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m) // 방문

// search safe distance
for i in 0..<m {
    for j in 0..<n {
        if board[i][j] == 1 { // 빈칸에서 출발
            bfs(board, &visited, i, j)
            visited = Array(repeating: Array(repeating: false, count: n), count: m) // reset
            //print("disBoard: \(disBoard)")
        }
    }
}

print(findMaxSafeDis(disBoard, m, n)) // 안전 거리 최댓값 출력

func bfs(_ sea: [[Int]], _ visited: inout [[Bool]], _ i: Int, _ j: Int) {
    var queue = Queue<Room>()
    queue.enqueue(Room([i,j],0)) // init
    visited[i][j] = true
    
    while !queue.isEmpty() {
        if let popRoom: Room = queue.dequeue() {
            for d in dir {
                let loc: [Int] = popRoom.getLoc()
                let newX: Int = loc[0]+d[0], newY: Int = loc[1]+d[1]
                if checkBorder(newX, newY) && !visited[newX][newY] && sea[newX][newY] != 1{
                    visited[newX][newY] = true
                    queue.enqueue(Room([newX,newY], popRoom.getDis() + 1))
                    disBoard[newX][newY] = min(disBoard[newX][newY], popRoom.getDis() + 1)
                }
            }
        }
    }
}


// 경계값 체크
func checkBorder(_ x: Int, _ y: Int) -> Bool {
    if x < 0 || y < 0 || x > m - 1 || y > n - 1 {
        return false
    }
    return true
    
}

// N * M 공간 만듬
func makeBoard(_ m: Int, _ n: Int) -> [[Int]] {
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0..<m {
        let row: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = row
    }
    
    return board
}

// 안전 거리 최댒값 찾음
func findMaxSafeDis(_ disBoard: [[Int]], _ m: Int, _ n: Int) -> Int {
    var maxDis: Int = 0
    for i in 0..<m {
        for j in 0..<n {
            if disBoard[i][j] != Int.max {
                maxDis = max(disBoard[i][j], maxDis)
            }
        }
    }
    return maxDis
}