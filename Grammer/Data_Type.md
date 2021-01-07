
# 💡데이터 타입

스위프트의 기본 데이터 타입은 모두 **구조체** 를 기반으로 구현되어 있습니다.

## Int와 UInt

### Int

+, - 부호를 포함한 정수 타입

현재는 기본적으로 64비트 정수형

### UInt

0을 포함한 양의 정수 타입

현재는 기본적으로 64비트 양의 정수형

```Swift
var integer: Int = -100
var unsignedInteger: UInt = 20

unsignedInteger = integer // 컴파일 오류발생, Int와 UInt는 다른 타입임.
```

**각 진수에 따라 정수를 표현하는 방법**

-   10진수: 우리가 평소에 쓰던 숫자와 동일
-   2진수: 접두어 0b를 사용하여 표현
-   8진수: 접두어 0o를 사용하여 표현
-   16진수: 접두어 0x를 사용하여 표현


## Float와 Double

### Float

32비트의 부동소수형인 실수 타입

### Double

64비트의 부동소수형인 실수 타입



## Bool

불리언 타입

**참(true)** 또는 **거짓(false)** 만 값으로 가집니다.

```Swift
var boolean: Bool = true
boolean = false

boolean = 1 // 오류 발생
boolean = 0 // 오류 발생
// true대신 1, false대신 0을 넣으면 안됨
// 0과 1은 Int타입이므로 오류가 발생함
```

## Character

문자 타입

**큰따옴표("")** 사용

```Swift
var characterValue: Character = "A"
characterValue = "😃"
characterValue = "가"
```

## String

문자열 타입

**큰따옴표("")** 사용

-   hasPerfix : 문자열이 어떤 글자로 시작하는지 확인 (접두어)
-   hasSuffix : 문자열이 어떤 글자로 끝나는지 확인 (접미어)
-   uppercased : 대문자로 변환
-   lowercased : 소문자로 변환
-   isEmpty : 빈 문자열 확인
-   count : 문자열 길이 확인

```Swift
var greeting: String = "Hello"
var isSameString: Bool = false

// 연산자를 통한 문자열 비교
isSameString = greeting == "Hello"
print(isSameString) // true

print(greeting.hasPerfix("He")) // true
print(greeting.hasSuffix("ll")) // false
print(greeting.hasSuffix("lo")) // true

print(greeting.uppercased()) // HELLO
print(greeting.lowercased()) // hello

print(greeting.isEmpty) // false

print(greeting.count) // 5

// 연산자를 통한 문자열 결합
greeting = greeting + "," + "nice to meet you!"
print(greeting) // Hello,nice to meet you!

// 코드상에서 여러 줄의 문자열을 직접 쓰고 싶다면 큰따옴표 세 개를 사용
greetint="""
안녕하세요.
만나서 반갑습니다!
"""
```

---
## 💡Any

스위프트의 **모든 데이터 타입을 사용할 수 있다는 뜻** 입니다.

변수 또는 상수의 데이터 타입이 Any로 지정되어 있다면

그 변수 또는 상수에는 어떤 종류의 데이터 타입이든지 상관없이 할당할 수 있습니다.

```Swift
var someAny: Any = "hello"
someAny = 30
someAny = 2.5

let someDouble: Double = someAny // 오류발생
                                 // Any는 Double 타입이 아니므로 할당할 수 없음
```

---

## 💡AnyObject

**모든 클래스 타입을 지칭** 하는 프로토콜입니다.

**클래스의 인스턴스** 에만 할당할 수 있습니다.

```Swift
class Person {}

var student: AnyObject = Person()

student = "lucy" // 오류발생
                 // 클래스의 인스턴스가 아니므로 할당할 수 없음
```

_Any와 AnyObject는 될 수 있으면 사용하지 않는 편이 좋습니다. 이 둘로 선언된 변수의 값을 가져다 쓰려면 매번 타입 확인 및 변환을 해줘야 하는 불편함이 있을뿐더러 예기치 못한 오류의 위험을 증가시키기 때문에 **타입은 될 수 있는 한 명시하는 것이 좋습니다** ❗️_

---

## 💡nil

' **없음** '을 나타내는 키워드입니다.

즉, 변수 또는 상수에 값이 들어있지 않고 비어있음을 나타내는 데 사용합니다.

