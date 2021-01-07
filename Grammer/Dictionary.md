## 💡딕셔너리

요소들이 **순서 없이 키와 값의 쌍** 으로 구성되는 컬렉션 타입입니다.

❗️하나의 딕셔너리 안의 키는 같은 이름을 중복해서 사용할 수 없습니다.

#### 빈 딕셔너리 생성하기

```Swift
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var emptyDictionary: Dictionary = [String: Any]()

// 위와 같은 표현
var emptyDictionary: Dictionary<String, Any> = Dictionary()
var emptyDictionary: Dictionary<String, Any> = [:]
var emptyDictionary: [String: Any] = Dictionary()
var emptyDictionary: [String: Any] = [String: Any]()
var emptyDictionary: [String: Any] = [:]
var emptyDictionary = [String: Any]()
```

#### 딕셔너리 생성하기

```Swift
var numberOfFruit: [String: Int] = ["apple": 3, "peach": 5, "strawberry": 10]

print(numberOfFruit) // ["peach": 5, "strawberry": 10, "apple": 3]

print(numberOfFruit["peach"]) // 5

numberOfFruit["apple"] = 1
print(numberOfFruit["apple"]) // 1

// let을 사용하여 불변 Dictionary 생성
let emptyDictionary: [String: String] = [:]

emptyDictionary["key"] = "value" // 오류발생. 불변 Dictionary이므로 값 변경 불가
```

여기서 생각해봐야 할 점이 있습니다. 아래의 코드는 실행이 잘 될까요?

```Swift
let numberOfApple: Int = numberOfFruit["apple"]
```

정답은 **No** 입니다.

얼핏 봤을 때는 맞는 것처럼 보이지만 컴파일 오류가 발생합니다.

그 이유는 무엇일까요? 🤷🏻‍♀️

바로 "apple"이라는 키에 해당하는 값이 없을 수도 있고 Int 타입의 값이 나올 것이라는 보장이 없기 때문입니다. 

이를 해결하기 위한 방법은 후에 포스팅될 옵셔널과 타입 캐스팅에서 다뤄보도록 하겠습니다.

#### 딕셔너리의 활용

```Swift
var numberOfFruit: [String: Int] = ["apple": 3, "peach": 5, "strawberry": 10]

numberOfFruit["melon"] = 8 // melon이라는 키로 8이라는 값 추가
print(numberOfFruit) // ["apple": 3, "strawberry": 10, "melon": 8, "peach": 5]

// 비어있는 딕셔너리인지 확인
print(numberOfFruit.isEmpty) // false

// 요소의 개수 확인
print(numberOfFruit.count) // 4

// 특정 키에 해당하는 값 제거 // 제거된 후 해당하는 값 반환
print(numberOfFruit.removeValue(forKey: "strawberry")) // 10

// 키에 해당하는 값이 없으면 기본값을 돌려주도록 함
print(numberOfFruit["strawberry", default: 0]) // 0
```