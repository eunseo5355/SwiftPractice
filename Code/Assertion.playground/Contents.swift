// Assertion
// assert(_:_:file:line:)함수 사용
// assert 함수는 디버깅 모드에서만 동작함
// 배포하는 애플리케이션에서는 제외
// 주로 디버깅 중 조건의 검증을 위하여 사용

var someInt: Int = 0

// 검증 조건에 부합하므로 지나감
assert(someInt == 0, "someInt != 0")

someInt = 1

assert(someInt == 0) // 동작 중지, 검증 실패
assert(someInt == 0, "someInt != 0")    // 동작 중지, 검증 실패
// Assertion failed: someInt != 0: file __lldb_expr_3/Assertion.playground, line 15

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세입니다")
}

functionWithAssert(age: 50) // 당신의 나이는 50세입니다
functionWithAssert(age: -1)
// Assertion failed: 나이값 입력이 잘못되었습니다: file __lldb_expr_3/Assertion.playground, line 20
functionWithAssert(age: nil)
// Assertion failed: age == nil: file __lldb_expr_5/Assertion.playground, line 19
