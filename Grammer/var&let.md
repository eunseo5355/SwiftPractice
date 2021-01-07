# 💡변수

생성 후 데이터 값을 변경할 수 있습니다.

### var \[변수명\]: \[데이터 타입\] = \[값\]

데이터 타입은 생략 가능❗️

```Swift
var name: String = "eunseo"
var age: Int = 20
var height = 165.7 // Double 타입으로 추론됨
age = 25 // 변수는 값을 변경해줄 수 있음
         // 단, 값을 변경할 때는 기존과 동일한 타입의 값을 할당해야 함
```

---

# 💡상수

한번 값을 설정하면 변경할 수 없습니다.

### let \[상수명\]: \[데이터 타입\] = \[값\]

데이터 타입은 생략 가능❗️

```Swift
let name: String = "eunseo"
let age = 20 // Int 타입으로 추론됨
// 상수로 선언된 값은 변경할 수 없음
```

## 상수 선언 후에 나중에 값 할당하기

나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시해줘야 합니다.

```Swift
let sum: Int // 타입 명시해줌
let inputA: Int = 10
let inputB: Int = 20

// 선언 후 첫 할당
sum = inputA + inputB
// sum = 0 // 그 이후에는 다시 값을 바꿀 수 없음, 오류 발생
```