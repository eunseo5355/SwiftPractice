## 💡세트(Set)

**같은 타입** 의 데이터를 **순서 없이** 하나의 묶음으로 저장하는 형태의 컬렉션 타입입니다.

❗️세트 내에는 중복된 값이 존재하지 않으므로 **모두 유일한 값** 입니다.

❗️세트의 요소로는 **해시 가능한 값** 이 들어와야 합니다.


**해싱(hashing)** 이란?

각각의 객체에 식별할 수 있는 숫자 코드를 부여하여 객체를 테이블에 저장하는 것을 말합니다.


#### 빈 세트 생성하기

```Swift
var emptySet: Set<Int> = Set<Int>()
var emptySet: Set<Int> = [] // 위와 동일한 표현
```

배열과 딕셔너리와 달리 줄여서 표현할 수 있는 축약형이 없습니다.


#### 세트 생성하고 사용하기

```Swift
var fruits: Set<String> = ["apple", "melon", "peach", "apple"]

// 요소의 개수 확인
print(fruits.count) // 3 // 중복된 값 허용하지 않음 (apple 중복)

// 비어있는 세트인지 확인
print(fruits.isEmpty) // false

// 세트에 요소 추가
fruits.insert("mango")
print(fruits.count) // 4

// 요소 삭제 // 삭제 후 해당 요소 반환
print(fruits.remove("melon")) // melon

print(fruits) // ["mango", "peach", "apple"]

// 요소 정렬
print(fruits.sorted()) // ["apple", "mango", "peach"]
```


#### 세트의 활용 - 집합연산

-   합집합 - union()
-   교집합 - intersection()
-   차집합 - subtracting()
-   여집합의 합(배타적 논리합) - symmetricDifference()

```Swift
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

// 합집합
print(setA.union(setB)) // [7, 8, 5, 3, 1, 6, 2, 4]

// 교집합
print(setA.intersection(setB)) // [4, 5]

// 차집합
print(setA.subtracting(setB)) // [1, 2, 3]
print(setB.subtracting(setA)) // [8, 6, 7]

// 여집합의 합(배타적 논리합)
print(setA.symmetricDifference(setB)) // [1, 2, 3, 6, 7, 8]
```


#### 세트의 활용 - 포함관계 연산

-   isDisjoint(with: ) - 서로 배타적인지
-   isSubset(of: ) - 부분 집합인지
-   isSuperset(of: ) - 전체 집합인지

```Swift
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]
let setUnion: Set = setA.union(setB) // setA와 setB의 합집합

print(setA.isDisjoint(with: setB)) // 서로 배타적인지 - false
print(setA.isSubset(of: setUnion)) // setA가 setUnion의 부분집합인지 - true
print(setUnion.isSuperset(of: setB)) // setUnion이 setB의 전체집합인지 - true
```