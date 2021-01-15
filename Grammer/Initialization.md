# 💡이니셜라이저 (Initialization)

이니셜라이저를 정의하면 초기화 과정을 직접 구현할 수 있습니다.

그렇게 구현된 이니셜라이저는 **새로운 인스턴스를 생성할 수 있는 특별한 메서드**가 됩니다.

스위프트의 이니셜라이저는 반환 값이 없습니다.

이니셜라이저는 **init 키워드**를 사용하여 이니셜라이저 메서드임을 표현합니다.

기본적인 형태의 이니셜라이저는 다음과 같습니다.

```Swift
class SomeClass {
	init() {
    	// 초기화할 때 필요한 코드
    }
}
```

```Swift
struct SomeStruct {
	init() {
    	// 초기화할 때 필요한 코드
    }
}
```

```Swift
enum SomeEnum {
	case someCase
    
    init() {
    	// 열거형은 초기화할 때 반드시 case중 하나가 되어야 합니다.
        self = .someCase
        // 초기화할 때 필요한 코드
    }
}
```

**여기서 잠깐 ✋**

구조체와 클래스의 인스턴스는 처음 생성할 때 옵셔널 저장 프로퍼티를 제외한 모든 저장 프로퍼티에 적절한v**초깃값** 을 할당해야 합니다.

하지만 프로퍼티를 정의할 때 프로퍼티 **기본값**을 할당하면 이니셜라이저에서 따로 초깃값을 할당하지 않더라도 프로퍼티 기본값으로 저장 프로퍼티의 값을 초기화할 수 있습니다.

🧐 **초깃값 vs 기본값**

-   **초깃값** \- 이니셜라이저를 통해 저장 프로퍼티에 처음 할당해준 값
-   **기본값** \- 프로퍼티를 정의할 때 처음 할당해준 값

다음은 초깃값과 기본값을 할당해주는 예시입니다.

```Swift
struct Area {
	var width: Double = 0.0	// 프로퍼티 기본값 할당
	var squareMeter: Double
	
    init() {
    	squareMeter = 0.0 // 이니셜라이저로 squareMeter의 초깃값 할당
    }
}

let room: Area = Area()
print(room.squareMeter) // 0.0
print(room.width)	// 0.0
```

함수나 메서드를 정의할 때와 마찬가지로 **이니셜라이저도 매개변수** 를 가질 수 있습니다.

```Swift
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
```

## ✍️기본 이니셜라이저

사용자 정의 이니셜라이저를 정의해주지 않으면

클래스나 구조체는 **모든 프로퍼티에 기본값이 지정되어 있다는 전제하**에 기본 이니셜라이저를 사용합니다.

아래 예시는 이니셜라이저를 정의하지 않았지만 Swift가 제공하는 기본 이니셜라이저Area()를 사용할 수 있음을 보여주는 예제입니다.

```Swift
struct Area {
	var squareMeter: Double = 0.0 // 프로퍼티 기본값 할당
}

let room: Area = Area()
print(room.squareMeter)	// 0.0
```

## ✍️멤버와이즈 이니셜라이저

사용자 정의 이니셜라이저를 구현하지 않으면 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저입니다.

단, 멤버와이즈 이니셜라이저는 **구조체**에서만 사용가능합니다❗️

```Swift
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

```

## ✍️초기화 위임

초기화 위임은 코드의 중복을 피하기 위해 이니셜라이저가 다른 이니셜라이저에게 일부 초기화를 위임하는 것을 말합니다.

단, 초기화 위임은 값 타입인 **구조체**와 **열거형** 에만 사용할 수 있습니다❗️

이니셜라이저가 다른 이니셜라이저를 호출하려면 이니셜라이저 안에서만 사용할 수 있는 **self.init** 을 사용합니다.

이러한 self.init을 사용한다는 것 자체가 사용자 정의 이니셜라이저를 정의하고 있다는 뜻입니다. 

따라서 초기화 위임을 하려면 최소 두 개 이상의 사용자 정의 이니셜라이저를 정의해야합니다.

```Swift
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우,
    // init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있습니다.
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {	// 첫 번째 사용자 정의 이니셜라이저
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
    
    init(bornAt: Int, currentYear: Int) {	// 두 번째 사용자 정의 이니셜라이저
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)  // middle

younger = Student(bornAt: 2003, currentYear: 2021)
print(younger)  // high

```

위는 두 번째 사용자 정의 이니셜라이저에서 태어난 해와 현재 연도를 전달받아 나이로 계산한 후 첫 번째 이니셜라이저에 초기화를 위임한 예시입니다.

## ✍️실패 가능한 이니셜라이저(Failable initializer)

이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달되었을 때 등의 상황을 대비하기 위해 **실패 가능한 이니셜라이저** 를 사용할 수 있습니다. 이는 클래스, 구조체, 열거형 등에 모두 정의할 수 있습니다.

실패 가능한 이니셜라이저는 실패했을 때 nil을 반환해주므로 반환 타입이 옵셔널로 지정됩니다. 

따라서 실패 가능한 이니셜라이저는 init 대신에 **init?** 키워드를 사용합니다.

```Swift
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
```
