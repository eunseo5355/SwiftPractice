# 💡타입캐스팅

스위프트에서 타입캐스팅이란?

**인스턴스의 타입을 확인**하거나 **자신을 다른 타입의 인스턴스인양 행세** 할 수 있는 방법으로 사용할 수 있습니다.

```Swift
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다")
    }
}

// 인스턴스 생성
var eunseo: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()
```

## 🔥데이터 타입 확인

타입 확인 연산자인 **is** 를 사용하여 인스턴스가 어떤 클래스의 인스턴스인지 타입을 확인해볼 수 있으며

is 연산자는 클래스의 인스턴스뿐만 아니라 **모든 데이터 타입에 사용** 할 수 있습니다.

```Swift
var result: Bool

result = eunseo is Person // true
result = eunseo is Student // false
result = eunseo is UniversityStudent // false

result = hana is Person // true
result = hana is Student // true
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

```

eunseo는 Person 타입이기 때문에 Student 타입이나 UniverstiyStudent 타입이 될 수 없습니다.

하지만 hana는 Student 타입이기 때문에 Person 타입인지 확인했을 때 true를 반환받고 UniverstiyStudent 타입은 될 수 없습니다.

jason은 UniversityStudent 타입이므로 Person 클래스의 자식클래스이며 Student 클래스의 자식클래스이므로 모두 true를 반환받습니다.

```Swift
if eunseo is UniversityStudent {
    print("eunseo는 대학생입니다")
} else if eunseo is Student {
    print("eunseo는 학생입니다")
} else if eunseo is Person {
    print("eunseo는 사람입니다")
}   // eunseo는 사람입니다

```

위와 같이 if 구문을 사용하여 타입을 확인할 수도 있습니다.

```Swift
switch hana {
case is UniversityStudent:
    print("hana는 대학생입니다")
case is Student:
    print("hana는 학생입니다")
case is Person:
    print("hana는 사람입니다")
default:
    print("hana는 사람도, 학생도, 대학생도 아닙니다")
}   // hana는 학생입니다
```

switch 구문도 사용하여 확인할 수 있습니다.

## 🔥업 캐스팅

**as** 를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.

**자식 인스턴스 as 부모 클래스**

업 캐스팅은 안전한 캐스팅이며 자식이 추상화됩니다.

```Swift
// UnversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent  // 컴파일 오류 발생
var jina: Any = Person() // as Any 생략 가능!
```

Any 혹은 AnyObject로도 타입정보를 변환할 수 있으며 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 무방합니다.

> 타입캐스팅은 실제로 인스턴스를 수정하거나 값을 변경하는 작업이 아닙니다❗️  
> 인스턴스는 메모리에 똑같이 남아있고 인스턴스를 사용할 때 어떤 타입으로 다루고 어떤 타입으로 접근해야 할지 판단할 수 있도록 컴퓨터에 힌트를 주는 것뿐입니다.

## 🔥다운 캐스팅

**as?** 또는 **as!** 를 사용하여 부모 인스턴스를 자식 클래스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다.

다운캐스팅은 실패할 가능성이 있기 때문에 위와 같은 연산자를 사용합니다.

### 조건부 다운 캐스팅

다운캐스팅에 실패할 가능성이 있다면 ?가 붙은 **as?** 연산자를 사용합니다.

만약 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 **nil** 을 반환하기 때문에 결과의 타입은 **옵셔널 타입** 입니다.

```Swift
var optionalCasted: Student?
optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent    // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student   // nil
```

### 강제 다운 캐스팅

다운캐스팅이 무조건 성공할 것이라고 확신한다면 강제 연산자인 **as!** 를 사용할 수 있습니다.

캐스팅에 성공한다면 옵셔널이 아닌 **일반 타입** 을 반환하지만 만약 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 **런타임 오류** 가 발생합니다.

```Swift
var forcedCasted: Student
forcedCasted = mike as! UniversityStudent
// forcedCasted = jenny as! UniversityStudent    // 런타임 오류
// forcedCasted = jina as! UniversityStudent // 런타임 오류
// forcedCasted = jina as! Student   // 런타임 오류
```

다음은 switch구문을 사용하여 데이터 타입을 확인하고 강제 다운 캐스팅을 한 예제입니다.

```Swift
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)  // 멤버쉽 트레이닝을 갑니다
doSomethingWithSwitch(someone: mike)    // 멤버쉽 트레이닝을 갑니다
doSomethingWithSwitch(someone: jenny)   // 등교를 합니다
doSomethingWithSwitch(someone: eunseo)  // 숨을 쉽니다
```
