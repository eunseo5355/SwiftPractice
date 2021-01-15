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

//-------------------------------------------------
// 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우,
    // init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있습니다.
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)  // middle

younger = Student(bornAt: 2003, currentYear: 2021)
print(younger)  // high

//-------------------------------------------------------
// 실패 가능한 이니셜라이저

class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let eunseo: Person? = Person(name: "eunseo", age: 20)

if let person: Person = eunseo {
    print(person.name)
} else {
    print("Person wasn't initalized")
}
// eunseo

let chope: Person? = Person(name: "chope",age: -10)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initalized")
}
// Person wasn't initalized
// age < 0 이므로 초기화가 되지 않음
