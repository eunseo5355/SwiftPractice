# 💡연산 프로퍼티 (Computed Properties)

연산 프로퍼티는 실제 값을 저장하는 프로퍼티가 아니라, **특정 상태에 따른 값을 연산하는 프로퍼티** 입니다.

인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 **접근자(getter)** 의 역할이나 은닉화된 내부의 프로퍼티 값을 간접적으로 설정하는 **설정자(setter)** 의 역할을 할 수도 있습니다.

🧐 여기서 "메서드를 두고 왜 굳이 프로퍼티를 쓸까?"라는 의문이 들 수도 있는데요..! 

인스턴스 외부에서 메서드를 통해 인스턴스 내부 값에 접근하려면 메서드를 두 개(접근자, 설정자) 구현해야 합니다. 그럼 두 메서드가 분산 구현되어 코드의 가독성이 나빠질 위험이 있습니다. 따라서 프로퍼티가 메서드 형식보다 훨씬 더 간편하고 직관적이라고 합니다~!

다만 연산 프로퍼티는 접근자인 get 메서드만(읽기 전용 상태)은 구현하기 쉽지만 설정자인 set 메서드(쓰기 전용 상태)만으로는 구현할 수 없다는 단점이 있습니다. 

```Swift
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {    //  연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}
    
var eunseoPosition: CoordinatePoint = CoordinatePoint(x: 5, y: 10)
    
// 현재 좌표
print(eunseoPosition)   // 5, 10

// 대칭 좌표
print(eunseoPosition.oppositePoint) // -5, -10

// 대칭 좌표 설정
eunseoPosition.oppositePoint = CoordinatePoint(x: 3, y: 6)

// 현재 좌표
print(eunseoPosition)   // -3, -6

```

위처럼 하나의 프로퍼티에 접근자와 설정자가 모두 모여있고, 해당 프로퍼티가 어떤 역할을 하는지 좀 더 명확하게 표현 가능합니다.

설정자에서 소괄호 안에 opposite처럼 내부에서 전달받은 전달인자를 사용할 수 있습니다.

관용적인 표현으로 **newValue** 로 매개변수 이름을 대신할 수도 있습니다. 다만 그럴 경우에는 매개변수를 따로 표기하지 말아야 합니다.

```Swift
set {
	x = -newValue.x
    y = -newValue.y
}
```

위 예시는 매개변수 이름을 생략하여 설정자를 구현한 것입니다.

이러한 연산 프로퍼티는 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능합니다.
