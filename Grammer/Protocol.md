# 💡프로토콜 (Protocol)

프로토콜은 **특정 역할을 수행하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진을 정의** 합니다.

쉽게 말하자면 어떤 타입(클래스, 구조체 등등)이 특정 기능이 필요해서 이 기능을 꼭 구현해야 한다고 강요하는 것과 같습니다.

이러한 구조체, 클래스, 열거형은 프로토콜을 **채택** 해서 프로토콜의 요구사항을 실제로 구현할 수 있습니다.

어떤 프로토콜의 요구사항을 모두 따르는 타입은 ' **해당 프로토콜을 준수한다** '고 표현합니다.

타입에서 프로토콜의 요구사항을 충족시키려면 **프로토콜이 제시하는 청사진의 기능을 모두 구현** 해야 합니다.

즉, **프로토콜은 정의를 하고 제시를 할 뿐이지 스스로 기능을 구현하지는 않습니다.**

프로토콜은 다음과 같이 **protocol 키워드** 를 사용하여 정의합니다.

```Swift
protocol 프로토콜 이름 {
	프로토콜 정의
}
```

## 🔥프로토콜 구현

```Swift
protocol Talkable {
    // 프로퍼티 요구
    var topic: String { get set }	// 읽기와 쓰기가 모두 가능한 프로퍼티
    var language: String { get }	// 읽기 전용 프로퍼티
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}
```

### 📍프로퍼티 요구

프로퍼티 요구는 항상 **var 키워드** 를 사용해야하며 프로퍼티의 종류(연산 프로퍼티인지, 저장 프로퍼티인지 등)는 따로 신경쓰지 않습니다.

단, 프로토콜이 요구하는 프로퍼티 이름과 타입은 맞도록 구현해줘야 합니다.

또한, 프로퍼티를 읽기 전용(get)으로 할지 혹은 읽고 쓰기(get set)가 모두 가능하게 할지도 명시해줘야 합니다.

타입 프로퍼티는 **static 키워드** 를 사용하여 선언합니다.

클래스의 타입 프로퍼티는 class와 static 두 타입이 있지만 따로 구분하지 않고 모두 static 키워드를 사용하여 타입 프로퍼티를 요구해야 합니다.

### 📍메서드 요구

프로토콜은 특정 인스턴스 메서드나 타입 메서드를 요구할 수 있습니다.

위의 예제에 있는 talk()과 같이 메서드의 실제 구현부인 중괄호({}) 부분은 제외하고 메서드 이름, 매개변수, 반환 타입 등만 작성하며 가변 매개변수도 허용합니다. 단, 매개변수 기본값은 지정할 수 없습니다.

타입 메서드를 요구할 때는 타입 프로퍼티 요구와 마찬가지로 앞에 **static 키워드** 를 명시하여 요구해줍니다.

요구할 때는 static 키워드를 사용했지만 클래스에서 실제로 구현할 때는 class 타입 메서드 또는 static 타입 메서드 둘 중에 골라서 사용해주면 됩니다!

### 📍가변 메서드 요구

가끔은 메서드가 인스턴스 내부의 값을 변경할 필요가 있습니다.

그럴땐 프로토콜의 메서드 정의 앞에 **mutating 키워드** 를 명시해주면 됩니다!

다만, 참조 타입인 클래스는 이 키워드를 명시해주지 않아도 인스턴스 내부 값을 바꾸는데 문제가 없기 때문에 프로토콜에 mutating 키워드를 사용한 메서드 요구가 있다고 하더라도 클래스 구현에서는 mutating 키워드를 써주지 않아도 됩니다.

값 타입인 구조체와 열거형의 메서드 앞에는 mutating 키워드를 붙여서 가변 메서드를 요구해줘야 합니다!

### 📍이니셜라이저 요구

프로토콜은 특정한 이니셜라이저를 요구할 수도 있습니다. (일반 이니셜라이저 외에도 실패 가능한 이니셜라이저 요구 가능!)

구조체는 상속할 수 없기 때문에 이니셜라이저 요구에 대해 크게 신경쓸 필요가 없지만 클래스의 경우에는 다릅니다.

```Swift
protocol Named {
    var name: String { get }
    
    init(name: String)
}

class Person1: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}
```

위의 예제와 같이 클래스 타입에서 프로토콜의 이니셜라이저 요구에 부합하는 이니셜라이저를 구현할 때 **required 식별자** 를 붙인 요구 이니셜라이저로 구현해야 합니다. 그 이유는 Person 클래스를 상속받는 모든 클래스가 Named 프로토콜을 준수해야 하며, 이는 곧 상속받는 클래스에 해당 이니셜라이저를 모두 구현해야 한다는 뜻이기 때문입니다.

하지만 상속 받을 수 없는 final 클래스라면 required 식별자를 붙여줄 필요가 없습니다.

만약 특정 클래스에 프로토콜이 요구하는 이니셜라이저가 이미 구현되어 있는 상황에서 그 클래스를 상속받는 클래스가 있다면 어떻게 해줘야할까요?

이때는 **required와 override 식별자를 모두 명시** 하여 프로토콜에서 요구하는 이니셜라이저를 구현해주어야 합니다.

```Swift
class Person2 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student: Person2, Named {
    required override init(name: String) {
        super.init(name: name)
    }
}
```

## 🔥프로토콜 채택 및 준수

구조체, 클래스, 열거형 등에서 프로토콜을 채택하려면 타입 이름 뒤에 **콜론(:)** 을 붙여준 후 채택할 프로토콜 이름을 쉼표(,)로 구분하여 명시해줍니다.

```Swift
struct Person: Talkable {
	// 프로퍼티 요구 준수
    var topic: String
    let language: String
    
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
```

프로퍼티 요구는 다음과 같이 연산 프로퍼티로 대체 가능합니다.

```Swift
struct Person: Talkable {
	var subject: String = ""
    var topic: String {
        set {
            self.subject = newValue
        }
        get {
            return self.subject
        }
    }

	var language: String { return "한국어" }
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
    }
    
}
```

## 🔥프로토콜 상속

프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구사항을 추가할 수 있습니다.

프로토콜 상속 문법은 클래스의 상속 문법과 유사하지만, 프로토콜은 클래스와 다르게 **다중상속이 가능** 합니다.

```Swift
protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
	프로토콜 정의
}
```

다음은 프로토콜 상속에 대한 예제입니다.

```Swift
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
```

ReadSpeakable 프로토콜은 Readable 프로토콜을, ReadWriteSpeakable 프로토콜은 Readable과 Writeable 프로토콜을 상속받았습니다.

그래서 ReadWriteSpeakable 프로토콜을 채택한 someType은 세 프로토콜이 요구하는 read(), write(), speak() 메서드를 모두 구현해야 합니다.

### 📍클래스 상속과 프로토콜

클래스에서 상속과 프로토콜 채택을 동시에 하려면 상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록을 작성해야 합니다.

```Swift
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

```

## 🔥프로토콜 준수 확인

**is와 as 연산자** 를 사용하여 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있습니다.

```Swift
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
```

마지막으로 우리가 이러한 프로토콜을 사용하는 이유는 무엇일까요? 🤷🏻‍♀️

바로! 프로토콜을 채택한 타입 안을 자세히 들여다보지 않아도 어떤 프로퍼티나 메서드를 가지고 어떤 기능을 하는지 대충 예상을 할 수 있기 때문입니다!

또한, 프로토콜은 확장성과 재활용성이 좋습니다!

클래스 타입끼리만 가능했던 상속이 프로토콜은 구조체와 열거형에서도 적용할 수 있으며 다중상속도 가능하다는 장점을 가지고 있습니다.
