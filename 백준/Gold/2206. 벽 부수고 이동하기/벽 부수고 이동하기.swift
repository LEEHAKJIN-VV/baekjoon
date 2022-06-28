import Foundation

struct Node {
    private let loc: [Int]
    private var dis: Int
    private var destroy: Bool // 벽을 부순 여부 default: false
    
    init(_ loc: [Int], _ dis: Int, _ destroy: Bool) {
        self.loc = loc
        self.dis = dis
        self.destroy = destroy
    }
    public func getLoc() -> [Int] {
        return self.loc
    }
    public func getDis() -> Int {
        return self.dis
    }
    public func getDestroyActor() -> Bool {
        return self.destroy
    }
}

struct Queue<T> {
    private var items = [T]()
    private var front: Int = 0 // 삭제
    private var size: Int = 0 // queue 크기
    
    public mutating func enqueue(_ item: T) {
        items.append(item)
        self.size += 1
    }
    public mutating func dequeue() -> T? {
        if size == 0 {
            return nil
        } else {
            let value: T = items[front]
            front += 1 //
            self.size -= 1
            return value
        }
    }
    public func getSize() -> Int {
        return self.size
    }
}

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // 입력
let n: Int = input[0], m: Int = input[1]
let map: [[Int]] = createMap(n, m) // create map
var visited: [[[Bool]]] = Array(repeating: Array(repeating: [false,false], count: m), count: n)

let destination: [Int] = [n - 1, m - 1] // 도착지
var shortDis: Int = Int.max

bfs(n,m,map, false, &visited) // flag: false -> 아직 벽을 안부섰다. true: 벽을 부셧다

// 최단 경로 출력
if shortDis == Int.max { // 출구를 못찾는 경우
    print(-1)
} else {
    print(shortDis)
}


func bfs(_ i: Int, _ j: Int, _ board: [[Int]], _ flag: Bool, _ visited: inout [[[Bool]]]) {
    // init
    let dir: [[Int]] = [[1,0],[0,1],[-1,0],[0,-1]] // 상하좌우
    var queue = Queue<Node>()
    queue.enqueue(Node([0,0], 1, false))
    visited[0][0][0] = true // 벽을 부수지 않은 세게 방문
    
    while queue.getSize() > 0 {
        if let popNode = queue.dequeue() {
            let curLoc: [Int] = popNode.getLoc() // 현재 방문한 위치 curNode: [x,y]
            let curDis: Int = popNode.getDis() // 현재 움직인 경로 수
            let curDistroyFlag: Bool = popNode.getDestroyActor() // 벽을 파괴했는 지 여부
            
            if curLoc == destination { // 목적지 도착
                shortDis = min(shortDis, curDis) // 최단경로
                break
            }
            
            for d in dir {
                let newX: Int = curLoc[0] + d[0], newY: Int = curLoc[1] + d[1]
                if newX < 0 || newY < 0 || newX > n - 1 || newY > m - 1 { // 맵을 벗어나는 경우
                    continue
                }
                
                if curDistroyFlag { // 전에 벽을 부순 경우
                    if board[newX][newY] == 0 && !visited[newX][newY][1]{ // 벽이 아닌 경우에만 갈수있음
                        visited[newX][newY][1] = true
                        queue.enqueue(Node([newX, newY], curDis + 1, curDistroyFlag))
                    }
                } else { // 전에 벽을 부수지 않은 경우
                    if board[newX][newY] == 0 && !visited[newX][newY][0] { // 다음이 벽이 아니므로 부술필요 x
                        visited[newX][newY][0] = true
                        queue.enqueue(Node([newX, newY], curDis + 1, curDistroyFlag))
                    } else { // 다음 칸이 벽이므로 벽을 부숨
                        queue.enqueue(Node([newX, newY], curDis + 1, !curDistroyFlag))
                    }
                }
                
            }
        }
    }
}


// map 생성
func createMap(_ row: Int, _ column: Int) -> [[Int]] {
    var matrix: [[Int]] = Array(repeating: [], count: row)
    
    for i in 0..<row {
        matrix[i] = readLine()!.map{$0.wholeNumberValue!}
    }
    return matrix
}


/*
 8 8
 01000100
 01010100
 01010100
 01010100
 01010100
 01010100
 01010100
 00010100
 */
