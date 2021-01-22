// 빠른 종료

for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}

// guard 구문을 이용한 옵셔널 바인딩
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "eunseo"

greet(personInfo)
// Hello eunseo
// I hope the weather is nice near you

personInfo["location"] = "Korea"

greet(personInfo)
// Hello eunseo
// I hope the weather is nice in Korea

// 좀 더 구체적인 조건을 추가하고 싶다면
// 쉼표(,)로 추가조건을 나열해주면 됨
func enterClub(name: String?, age: Int?) {
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
        print("You are too young to enter the club")
        return
    }
    
    print("Welcome \(name)!")
}

enterClub(name: "jenny", age: 15)   //You are too young to enter the club
enterClub(name: "eunseo", age: 25)  // Welcome eunseo!
