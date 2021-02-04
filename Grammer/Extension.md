# 💡익스텐션 (Extension)

익스텐션은 스위프트의 강력한 기능 중 하나로 **구조체** , **클래스** , **열거형** , **프로토콜 타입** 에 **새로운 기능을 추가** 할 수 있습니다.

기능을 추가하려는 타입을 구현한 소스 코드를 알지 못하거나 볼 수 없다 해도, **타입만 안다면 그 타입의 기능을 확장** 할 수도 있습니다.

📍 **스위프트의 익스텐션이 타입에 추가할 수 있는 기능**

-   연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
-   타입 메서드 / 인스턴스 메서드
-   이니셜라이저
-   서브스크립트
-   중첩 타입
-   특정 프로토콜을 준수할 수 있도록 기능 추가

**⭐️익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의할 수는 없습니다.**

**🔥 상속 VS 익스텐션**

<table style="border-collapse: collapse; width: 100%; height: 95px;" border="1" data-ke-style="style1"><tbody><tr style="height: 19px;"><td style="width: 33.333333333333336%; height: 19px; text-align: center;">&nbsp;</td><td style="width: 33.333333333333336%; height: 19px; text-align: center;"><b>상속</b></td><td style="width: 33.333333333333336%; height: 19px; text-align: center;"><b>익스텐션</b></td></tr><tr style="height: 19px;"><td style="width: 33.333333333333336%; height: 19px; text-align: center;">확장</td><td style="width: 33.333333333333336%; height: 19px; text-align: center;">수직 확장</td><td style="width: 33.333333333333336%; height: 19px; text-align: center;">수평 확장</td></tr><tr style="height: 38px;"><td style="width: 33.333333333333336%; height: 38px; text-align: center;">사용</td><td style="width: 33.333333333333336%; height: 38px; text-align: center;">클래스 타입에서만 사용</td><td style="width: 33.333333333333336%; height: 38px; text-align: center;">클래스, 구조체, 프로토콜, 제네릭 등 모든 타입에서 사용</td></tr><tr style="height: 19px;"><td style="width: 33.333333333333336%; height: 19px; text-align: center;">재정의</td><td style="width: 33.333333333333336%; height: 19px; text-align: center;">재정의 가능</td><td style="width: 33.333333333333336%; height: 19px; text-align: center;">재정의 불가</td></tr></tbody></table>

📌 **수직 확장** 이란?

 특정 타입을 물려받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 것

📌 **수평 확장** 이란?

기존의 타입에 기능을 추가하는 것

여기서 잠깐!!✋

### _" 왜 굳이 익스텐션을 써야하지? 원래 타입을 정의한 소스에 기능을 추가하면 안되나? "  _

이 질문에 대한 답을 생각해볼까요?🧐

.

.

.

당연히! 원래 타입을 정의한 소스에 기능을 추가해도 됩니다!

다만, 외부 라이브러리나 프레임워크를 가져다 사용할때 원본 소스를 수정할 수 없습니다.

이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 익스텐션을 사용하면 쉽게 추가할 수 있습니다~!!

## **🔥익스텐션 문법**

익스텐션은 **extension 키워드** 를 사용하여 선언합니다.

```Swift
extension 확장할 타입 이름 {
	// 타입에 추가될 새로운 기능 구현
}
```

익스텐션은 기존에 존재하는 타입에 추가로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있습니다.

```Swift
extension 확장할 타입 이름: 프로토콜 1, 프로토콜 2, 프로토콜 3 {
	// 프로토콜 요구사항 구현
}
```

## **🔥익스텐션으로 추가할 수 있는 기능**

### 📍연산 프로퍼티

```Swift
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
```

위의 예제는 Int 타입에 두 개의 연산 프로퍼티를 추가한 것입니다.

익스텐션으로 연산 프로퍼티를 추가할 수는 있지만, **저장 프로퍼티는 추가할 수 없습니다.**

또, **타입에 정의되어 있는 기존의 프로퍼티에 프로퍼티 감시자를 추가할 수도 없습니다.**

### 📍메서드

```Swift
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

```

위 예제는 Int 타입에 인스턴스 메서드인 multiply(by:) 메서드를 추가한 것입니다.

### 📍이니셜라이저

인스턴스를 초기화할 때 인스턴스 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있습니다.

```Swift
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
```

위 예제는 String 타입에 이니셜라이저를 추가한 것입니다.

**클래스 타입** 에서 익스텐션으로 편의 이니셜라이저는 추가할 수 있지만, **지정 이니셜라이저는 추가할 수 없습니다** !

지정 이니셜라이저와 디이니셜라이저는 반드시 클래스 타입의 구현부에 위치해야 합니다.

```Swift
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person {
    convenience init() {
        self.init(name: "Unknown")
    }
}

let someOne: Person = Person()
print(someOne.name) // Unknown

```

익스텐션으로 **값 타입** (열거형, 구조체 등)에 이니셜라이저를 추가했을 때, 해당 값 타입이

-   모든 저장 프로퍼티에 기본값이 있습니다.
-   타입에 기본 이니셜라이저와 멤버와이즈 이니셜라이저 외에 추가 사용자 정의 이니셜라이저가 없습니다.

이 조건을 모두 성립한다면 익스텐션으로 사용자 정의 이니셜라이저를 추가한 이후에도

해당 타입의 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 호출할 수 있습니다.

이외에도 서브스크립트나 중첩 데이터 타입 등 추가해줄 수 있습니다~!
