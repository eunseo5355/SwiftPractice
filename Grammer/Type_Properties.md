# 💡 타입 프로퍼티 (Type Properties)

타입 프로퍼티는 각각의 인스턴스가 아닌 **타입 자체에 속하는 프로퍼티** 를 말합니다. 즉, **타입 자체에 영향을 미치는 프로퍼티** 입니다.

인스턴스의 생성 여부와 상관없이 타입 프로퍼티의 값을 하나며,

그 타입의 모든 인스턴스가 공통으로 사용하는 값, 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수 등을 정의할 때 유용합니다.

-   **저장 타입 프로퍼티**  
      
    **변수** 또는 **상수** 로 선언할 수 있습니다.  
    반드시 초깃값을 설정해야 하며 지연 연산이 됩니다. (lazy 키워드 표시❌)
-   **연산 타입 프로퍼티**  
      
    **변수** 로만 선언할 수 있습니다.

```Swift
class AClass {
    
    // 저장 타입 프로퍼티(상수)
    static let typeProperty_1: Int = 10
    
    // 저장 타입 프로퍼티(변수)
    static var typeProperty_2: Int = 20
    
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty_2
        }
        
        set {
            typeProperty_2 = newValue
        }
    }
}

AClass.typeProperty_2 = 123

print(AClass.typeProperty_1)    // 10
print(AClass.typeProperty_2)    // 123
print(AClass.typeComputedProperty)  // 123

```

위의 예시에서 보듯이 타입 프로퍼티는 **인스턴스를 생성하지 않고도 사용** 할 수 있으며 타입에 해당하는 값입니다.

그래서 인스턴스에 접근할 필요 없이 **타입 이름만으로도 프로퍼티를 사용** 할 수 있습니다.
