/*익스텐션 (Extension)*/
// 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능

// 연산 프로퍼티 추가
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(3.isOdd)  // true
print(4.isOdd)  // false

var number: Int = 5
print(number.isEven)    // false
print(number.isOdd) // true

// 메서드 추가
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(6.multiply(by: 2))    // 12
print(7.multiply(by: 10))   // 70

number = 8
print(number.multiply(by: 2))   // 16
print(number.multiply(by: 5))   // 40

// 이니셜라이저 추가
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)    // "100"
let stringFromDouble: String = String(double: 100.0)    // "100.0"

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 클래스 타입에서 편의 이니셜라이저는 추가할 수 있지만,
// 지정 이니셜라이저는 불가능
extension Person {
    convenience init() {
        self.init(name: "Unknown")
    }
}

let someOne: Person = Person()
print(someOne.name) // Unknown

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rect {
    var origin: Point = Point()
    var size: Size = Size()
}

let defaultRect: Rect = Rect()
let memberwiseRect: Rect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX: Double = center.x - (size.width / 2)
        let originY: Double = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect: Rect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
