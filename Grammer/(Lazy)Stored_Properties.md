# 💡프로퍼티 (Property)

프로퍼티는 **클래스, 구조체 또는 열거형 등에 관련된 값** 을 뜻합니다.

프로퍼티는 크게 5가지로 나눌 수 있습니다.

**1\. 저장 프로퍼티**

**2\. 지연 저장 프로퍼티**

**3\. 연산 프로퍼티**

**4\. 프로퍼티 감시자**

**5\. 타입 프로퍼티**



# 💡 저장 프로퍼티 (Stored Properties)

저장 프로퍼티는 **인스턴스의 변수 또는 상수를 의미** 합니다. 즉, 클래스 또는 구조체의 인스턴스와 연관된 값을 저장하는 가장 단순한 개념의 프로퍼티입니다.

var 키워드를 사용하면 변수 저장 프로퍼티, let 키워드를 사용하면 상수 저장 프로퍼티가 됩니다.

다음은 가장 기본적인 저장 프로퍼티 선언과 인스턴스 초기화하는 방법입니다.

```Swift
// 좌표
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
}

// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있습니다.
let eunseoPoint: CoordinatePoint = CoordinatePoint(x: 2, y: 4)

// 사람의 위치 정보
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
```

위의 예시에서 보았듯이 구조체는 프로퍼티에 맞는 이니셜라이저를 자동으로 제공하지만 클래스는 그렇지 않아서 인스턴스의 저장 프로퍼티를 사용하는 일이 좀 번거롭습니다.

하지만 이러한 번거로운 일을 하지 않는 방법도 존재합니다. 다음 예시를 보시죠~!

```Swift
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
```

전보다 과정은 간편해졌지만 의도와 맞지 않게 인스턴스가 사용될 가능성이 남아있고, 인스턴스를 생성한 후에 원하는 값을  일일이 할당해야 한다는 불편함이 있습니다.

또, 초깃값을 지정해준다면 저장 프로퍼티를 상수로 정의할 수 없게 됩니다. 그 이유는 인스턴스를 생성한 후에 값을 할당해주어야 하기 때문입니다. 물론 처음에 지정해준 초깃값을 변경 없이 사용하고 싶다면 상수로 정의해줘도 됩니다.

여기서 문제❗️

🤷🏻‍♀️ 인스턴스를 생성할 때 이니셜라이저를 통해 초깃값을 보내야 하는 이유는 무엇일까요?

바로

.

.

.

프로퍼티가 옵셔널이 아닌 값으로 선언되어 있기 때문입니다. 그러므로 인스턴스는 생성할 때 프로퍼티에 값이 있는 상태여야 합니다.

그러나 저장 프로퍼티의 값이 없을 수도 있다면 옵셔널로 선언해주면 됩니다. 그러면 이니셜라이저에서 옵셔널 프로퍼티에 꼭 값을 할당해주지 않아도 됩니다.

```Swift
struct CoordinatePoint {
	// 위치는 x, y 값이 모두 있어야 하므로 옵셔널이면 안 됩니다.
    var x: Int
    var y: Int
}

class Position {
    // 현재 사람의 위치를 모를 수도 있습니다. - 옵셔널
    var point: CoordinatePoint?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있습니다.
let eunseoPosition: Position = Position(name: "eunseo")

// 위치를 알게되면 그때 위치 값을 할당해줍니다.
eunseoPosition.point = CoordinatePoint(x: 3, y: 6)
```

이러한 저장 프로퍼티는 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능합니다.

# 💡지연 저장 프로퍼티 (Lazy Stored Properties)

지연 저장 프로퍼티는 ** 호출이 있어야 값을 초기화** 하며, **lazy** 키워드를 사용합니다.

상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 필요할 때 값을 할당하는 지연 저장 프로퍼티와는 맞지 않으므로

지연 저장 프로퍼티는 var 키워드를 사용하여 **변수로 정의** 합니다.

지연 저장 프로퍼티는 주로 다른 클래스 인스턴스의 저장 프로퍼티로 다른 클래스 인스턴스나 구조체 인스턴스를 할당해야 할 때 효율적으로 사용하기 위해 사용합니다.

```Swift
struct CoordinatePoint {
    var x: Int = 0
    var y: Int = 0
}

class Position {
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let eunseoPosition = Position(name: "eunseo")

// 이 코드를 통해 point 프로퍼티로 처음 접근할 때
// point 프로퍼티의 CoordinatePoint가 생성됩니다.
print(eunseoPosition.point)

```

위의 예시처럼 point 프로퍼티를 lazy 키워드를 사용하여 지연 저장 프로퍼티로 지정해주고 나면

후에 point 프로퍼티를 접근하기 전까지는 CoordinatePoint 구조체 인스턴스를 생성하지 않습니다.

이렇게 지연 저장 프로퍼티를 때에 맞게 잘 사용하면 불필요한 성능저하나 공간 낭비를 줄일 수 있습니다!
