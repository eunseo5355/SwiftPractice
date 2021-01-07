// 기본적인 저장 프로퍼티의 선언과 인스턴스 초기화

// 좌표
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
}

// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있습니다.
let eunseoPoint: CoordinatePoint = CoordinatePoint(x: 2, y: 4)

class Position {
    var point: CoordinatePoint  // 저장 프로퍼티 (변수)
    let name: String    // 저장 프로퍼티 (상수)
    
    // 프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 합니다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

// 사용자 정의 이니셜라이저를 호출해야만 합니다.
// 그렇지 않으면 프로퍼티 초기값을 할당할 수 없기 때문에 인스턴스 생성이 불가능합니다.
let eunseoPosition: Position = Position(name: "eunseo", currentPoint: eunseoPoint)

//-----------------------------------------------------------

// 옵셔널 저장 프로퍼티

class Position_opt {
    // 현재 사람의 위치를 모를 수도 있습니다. - 옵셔널
    var point: CoordinatePoint?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있습니다.
let miaPosition: Position_opt = Position_opt(name: "mia")

// 위치를 알게되면 그 때 위치 값을 할당해줍니다.
miaPosition.point = CoordinatePoint(x: 3, y: 6)

//------------------------------------------------------------

// 저장 프로퍼티의 초깃값 지정

struct CoordinatePoint_init {
    var x: Int = 0  // 저장 프로퍼티
    var y: Int = 0  // 저장 프로퍼티
}

// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없습니다.
let danaPoint: CoordinatePoint_init = CoordinatePoint_init()
// 물론 이니셜라이저도 사용 가능합니다.
let timPoint: CoordinatePoint_init = CoordinatePoint_init(x: 10, y: 5)

print("dana's point : \(danaPoint.x), \(danaPoint.y)")  // dana's point : 0, 0
print("tim's point: \(timPoint.x), \(timPoint.y)")  // tim's point: 10, 5

class Position_init {
    var point: CoordinatePoint_init = CoordinatePoint_init()    // 저장 프로퍼티
    var name: String = "Unknown"    // 저장 프로퍼티
}

// 초기값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 됩니다.
let danaPosition: Position_init = Position_init()

danaPosition.point = danaPoint
danaPosition.name = "dana"



