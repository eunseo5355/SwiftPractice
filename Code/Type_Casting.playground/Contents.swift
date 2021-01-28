/* 타입캐스팅 */

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

// 타입 확인
// is 사용하여 확인함
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

if eunseo is UniversityStudent {
    print("eunseo는 대학생입니다")
} else if eunseo is Student {
    print("eunseo는 학생입니다")
} else if eunseo is Person {
    print("eunseo는 사람입니다")
}   // eunseo는 사람입니다

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

/* 업 캐스팅 */
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해줌

// UnversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent  // 컴파일 오류 발생
var jina: Any = Person() // as Any 생략 가능!

/* 다운 캐스팅 */
// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해줌

// 조건부 다운 캐스팅 // as?
var optionalCasted: Student?
optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent    // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student   // nil

// 강제 다운 캐스팅 // as!
var forcedCasted: Student
forcedCasted = mike as! UniversityStudent

// forcedCasted = jenny as! UniversityStudent    // 런타임 오류
// forcedCasted = jina as! UniversityStudent // 런타임 오류
// forcedCasted = jina as! Student   // 런타임 오류

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

