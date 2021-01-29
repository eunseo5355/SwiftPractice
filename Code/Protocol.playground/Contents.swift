protocol Talkable {
    // 프로퍼티 요구
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

struct Person: Talkable {
    // 프로퍼티 요구 준수
    var topic: String
    let language: String
    
// 읽기 쓰기 전용 프로퍼티를 연산 프로퍼티로 대체할 수 있음
/*  var subject: String = ""
    var topic: String {
        set {
            self.subject = newValue
        }
        get {
            return self.subject
        }
    }
*/
    
//  읽기전용 프로퍼티도 연산 프로퍼티로 대체가 가능함
//  var language: String { return "한국어" }
    
    // 메서드 요구 준수
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    // 이니셜라이저 요구 준수
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}
    

// 프로토콜 상속
protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}

// 클래스 상속과 프로토콜
// 상속받으려는 클래스 먼저 명시한 후 채택할 프로토콜 목록 작성
class SuperClass: Readable {
    func read() {
        print("read")
    }
}

class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() {
        print("write")
    }
    func speak() {
        print("speak")
    }
}

// 프로토콜 준수 확인
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()
var someAny: Any = sup

someAny is Readable // true
someAny is ReadSpeakable    // false
someAny = sub
someAny is Readable // true
someAny is ReadSpeakable    // true
someAny = sup

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}   // read
if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
}   // 동작하지 않음
someAny = sub
if let someWriteable: Writeable = someAny as? Writeable {
    someWriteable.write()
}   // wrtie
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}   // read
