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
