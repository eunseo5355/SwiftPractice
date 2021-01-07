# 💡배열(Array)

**같은 타입의 데이터** 를 일렬로 나열한 후 **순서대로 저장하는 형태의 컬렉션 타입** 입니다.

배열을 변수(var)로 선언해주면 변경 가능한 배열이 되고 상수(let)로 선언해주면 변경 불가능한 배열이 됩니다.

### 빈 배열 생성하기

```Swift
var emptyArray: Array<Any> = Array<Any>()

//위와 동일한 표현
var emptyArray: Array<Any> = Array()
var emptyArray: Array<Any> = [Any]()
var emptyArray: Array<Any> = []
var emptyArray: [Any] = Array()
var emptyArray: [Any] = [Any]()
var emptyArray: [Any] = []
var emptyArray = [Any]()
```

### 배열 생성하기

```Swift
var fruits: Array<String> = ["apple", "peach", "strawberry"]

print("여기에 \(fruits.count)개의 과일이 있습니다.") // 여기에 3개의 과일이 있습니다.
```

### 배열 활용

```Swift
var number: Array<Int> = Array<Int>()

// 맨 뒤에 요소 추가
number.append(1) // [1]
number.append(100) // [1,100]
number.append(contentsOf: [200, 300]) // [1, 100, 200, 300]

number.append(5.5) // Int 타입이 아니므로 오류발생

// 요소 포함 여부 확인
print(number.contains(1)) // true
print(numebr.contains(20)) // false

// 원하는 위치에 요소 삽입
number.insert(150, at: 2) // [1, 100, 150, 200, 300]
number.insert(contentsOf: [230, 260], at: 4) // [1, 100, 150, 200, 230, 260, 300]

print(number[3]) // 200

// 해당 요소의 인덱스 반환 // 중복된 요소가 있다면 제일 먼저 발견된 요소의 인덱스 반환
print(number.firstIndex(of: 150)) // 2
print(number.firstIndex(of: 10)) // nil // 10이라는 요소는 없음

// 맨 처음과 맨 마지막 요소 반환
print(number.first) // 1
print(number.last) // 300

// 요소 삭제
number.remove(at: 0) // [100, 150, 200, 230, 260, 300]
number.removeLast() // [100, 150, 200, 230, 260]
number.removeAll() // []

// 배열에 존재하는 요소의 개수 반환
print(number.count) // 0
```
