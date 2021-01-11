// 평수를 입력받아 제곱미터로 환산한 값을 squareMeter 프로퍼티에 할당하는 구조체
struct Area {
    var squareMeter: Double
    
    // 이니셜라이저도 매개변수를 가질 수 있음
    // 즉, 인스턴스를 초기화하는 과정에 필요한 값을 전달받을 수 있음
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)  // 49.587

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)  // 33.06

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)

//------------------------------------------------

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 프로퍼티에 기본값이 있는 경우
// 필요한 매개변수만 사용하여 초기화할 수도 있습니다.
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)
