# 💡 메서드(Method)

메서드는 **특정 타입에 관련된 함수** 를 뜻합니다.

클래스, 구조체, 열거형 등

👉 실행하는 기능을 캡슐화한 **인스턴스 메서드** 정의 가능

👉 타입 자체와 관련된 기능을 실행하는 **타입 메서드** 정의 가능

# 💡인스턴스 메서드

인스턴스 메서드는 **특정 타입의 인스턴스에 속한 함수**를 뜻합니다.

특정 타입 내부에 구현할 수 있으며 인스턴스가 존재할 때만 사용할 수 있습니다.

```Swift
class LevelClass {
    // 현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0{
        // 프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(level)")
        }
    }

    // 레벨이 올랐을 때 호출할 메서드
    func  levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    func levelDown() {
        print("Level Down")
        level -= 1
        if level<0 {
            reset()
        }
    }
    
    // 특정 레벨로 이동할 때 호출할 메서드
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    // 레벨을 초기화할 때 호출할 메서드
    func reset() {
        print("Reset")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp() // Level Up!
// Level 1
levelClassInstance.levelDown()  // Level Down
// Level 0
levelClassInstance.levelDown()  // Level Down
// Level -1
// Reset
// Level 0
levelClassInstance.jumpLevel(to: 5) // Jump to 5
// Level 5

```

위 예시는 LevelClass에서 level 인스턴스 프로퍼티의 값을 수정하는 코드를 가지고 있는 인스턴스 메서드를 구현한 것입니다.

단, 자신의 프로퍼티 값을 수정할 때 클래스의 인스턴스 메서드는 크게 신경 쓸 필요가 없지만 **구조체나 열거형** 등은 값 타입이므로 메서드 앞에 **mutating 키워드** 를 붙여서 **해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시** 해야 합니다.

```Swift
struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level<0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("Reset")
        level = 0
    }
}
```

## self 프로퍼티

모든 인스턴스는 암시적으로 생성된 self 프로퍼티를 갖습니다.

**인스턴스 자기 자신을 가리키는 프로퍼티** 로 인스턴스를 더 명확히 지칭하고 싶을 때 사용합니다.

위의 첫 번째 예시에서 jumpLevel 메소드를 self 프로퍼티를 써서 바꾸면 다음과 같습니다.

```Swift
func jumpLevel(to level: Int) {
	print("Jump to \(level)")
    self.level = level
}
```

메서드의 매개변수 이름이 인스턴스 프로퍼티 이름과 같을 때 좌측에 self를 붙여주면 좌측의 level이 인스턴스 프로퍼티라는 것을 명확히 할 수 있습니다.

또한, self 프로퍼티의 다른 용도는 값 타입 인스턴스 자체의 값을 치환할 수 있습니다. 따라서 구조체나 열거형 등은 self 프로퍼티를 사용하여 자신 자체를 치환할 수도 있습니다.

### 인스턴스를 함수처럼 호출하도록 하는 메서드

사용자 정의 명목 타입의 호출 가능한 값을 구현하기 위해 인스턴스를 함수처럼 호출할 수 있도록 하는 메서드가 있습니다.

다시 쉽게 말하자면 **특정 타입의 인스턴스를 문법적으로 함수를 사용하는 것처럼 보이게 할 수 있다는 뜻** 입니다.

이를 사용하기 위해서는 **callAsFuntion 메서드** 를 구현하면 되는데요. 이 메서드는 매개변수와 반환 타입만 다르다면 개수에 제한 없이 원하는만큼 만들 수 있습니다.

```Swift
struct Puppy {
    
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()

doggy() // 멍멍
doggy.callAsFunction()  // 멍멍

doggy.callAsFunction(destination: "집")  //집(으)로 달려갑니다
doggy(destination: "집")   // 집(으)로 달려갑니다

doggy(something: "재주넘기", times: 3)  // 재주넘기(을)를 3번 반복합니다

print(doggy(color: "무지개색")) // 무지개색 응가

doggy(name: "댕댕이")
print(doggy.name)   // 댕댕이
```

위의 예시를 보면 doggy()와 doggy.callAsFunction(), doggy.callAsFunction(destination: "집")과 doggy(destination: "집")은 같은 표현입니다.

하지만 메서드를 호출하는 것 외에 함수 표현으로는 사용할 수 없습니다.

ex) let function: (String) -> Void = doggy(destination: ) ❌ 대신 doggy.callAsFunction(destination: )로 표현
