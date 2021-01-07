## 💡튜플(Tuple)

튜플은 지정된 데이터의 묶음입니다.

#### 튜플 생성 및 사용

```Swift
// String, Int, Double 타입을 갖는 튜플 생성
var person: (String, Int, Double) = ("eunnseo", 20, 170.5)

// 인덱스를 통해 값 빼오기
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)") 
//이름: eunnseo, 나이: 20, 신장: 170.5

// 인덱스를 통해 값 할당하기
person.1 = 25
```

인덱스만으로 각 요소의 데이터가 무엇을 나타내는지 쉽게 파악하기 어렵기 때문에 튜플 요소에 이름을 붙여줄 수 있습니다.

#### 튜플 요소 이름 지정

```Swift
// String, Int, Double 타입을 갖는 튜플 생성
var person: (name: String, age: Int, height: Double) = ("eunseo", 20, 170.5)

// 요소 이름을 통해서 값 빼오기
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)") 
//이름: eunseo, 나이: 20, 신장: 170.5

// 요소 이름을 통해 값 할당하기
person.height = 150.8
```

매번 같은 모양의 튜플을 사용하고 싶을 때는 아래와 같이 타입 별칭을 사용하여 선언해줄 수 있습니다.

#### 튜플 별칭 지정

스위프트에서는 데이터 타입에 임의로 다른 이름(별칭)을 부여할 수 있습니다.

```Swift
typealias PersonTuple = (name: String, age: Int, height: Double)

let p1: PersonTuple = ("Lucy", 21, 175.0)
let p2: PersonTuple = ("Tom", 25, 180.7)

print("이름: \(p1.name), 나이: \(p1.age), 신장: \(p1.height)")
// 이름: Lucy, 나이: 21, 신장: 175.0
print("이름: \(p2.name), 나이: \(p2.age), 신장: \(p2.height)")
// 이름: Tom, 나이: 25, 신장: 180.7
```