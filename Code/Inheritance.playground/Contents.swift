// 기반 클래스 Person
class Person {
    var name: String = ""
    var age: Int = 0
    
    func selfIntroduce() {
        print("이름: \(name), 나이: \(age)")
    }
    
    func speak() {
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다"
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있습니다.
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없습니다.
    // 메서드 앞의 'static'과 'final class'는 똑같은 역할을 합니다.
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
    var grade: String = "A"
    
    // 상속받은 특성들을 재정의하려면 ovrerride 키워드 사용
    override func selfIntroduce() {
        print("이름: \(name), 나이: \(age), 성적: \(grade)")
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }
    
    override class func classMethod() {
        print("override type method - class")
    }
    
    // 단, final 키워드를 사용한 sayHello()와 finalClassMethod() 재정의 불가능
    // static 키워드를 사용한 typeMethod()도 재정의 불가능
}

class UniversityStudent: Student {
    var major: String = ""
    
    // 반환 타입이 다르기 때문에 재정의 X
    class func introduceClass() {
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+입니다."
    }
    
    override func speak() {
        // super
        // 자식클래스에거 특성을 재정의했지만
        // 필요에 따라 부모클래스의 특성을 활용하고 싶을 때 사용
        super.speak()   // 부모 클래스의 메서드에 접근
        print("대학생이죠.")
    }
    
}

Person.classMethod()    // type method - class
Person.typeMethod() // type method - static
Person.finalClassMethod()   // type method - final class

Student.classMethod()   // override type method - class
Student.typeMethod()    // type method - static
Student.finalClassMethod()  // type method - final class

let eunseo: Person = Person()
eunseo.speak()  // 가나다라마바사

let hana: Student = Student()
hana.speak()    // 저는 학생입니다.

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()   // 저는 학생입니다. 대학생이죠.

eunseo.name = "eunseo"
eunseo.age = 20
hana.name = "hana"
hana.age = 30

eunseo.selfIntroduce()  // 이름: eunseo, 나이: 20
hana.selfIntroduce()    // 이름: hana, 나이: 30, 성적: A

print(Person.introduceClass())  // 인류의 소원은 평화입니다
print(Student.introduceClass()) // 인류의 소원은 평화입니다
print(UniversityStudent.introduceClass() as String) // 대학생의 소원은 A+입니다.
UniversityStudent.introduceClass() as Void  // 인류의 소원은 평화입니다
