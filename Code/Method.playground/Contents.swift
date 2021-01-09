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

// ---------------------------------------------------

// 구조체나 열거형 등은 값 타입이므로 해당 메서드가 인스턴스 내부의 값을 변경할 때 mutating 키워드를 사용하여 명시해줍니다.

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

//-----------------------------------------------

// 인스턴스를 함수처럼 호출하도록 하는 메서드 구현

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
doggy(destination: "뒷동산")   // 뒷동산(으)로 달려갑니다

doggy(something: "재주넘기", times: 3)  // 재주넘기(을)를 3번 반복합니다

print(doggy(color: "무지개색")) // 무지개색 응가

doggy(name: "댕댕이")
print(doggy.name)   // 댕댕이
