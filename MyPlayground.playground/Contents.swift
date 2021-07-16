import UIKit

// 변수 사용 이유? 무언가를 저장해두었다가 다음에 다시 사용하기 위해서 사용
var greeting = "Hello, playground" // 변수 (변경 가능)
let greeting2 = "Hello, SWU" // 상수 (변경 불가능)
var greeting3:String = "" // 자료형을 명시적으로 선언
// greeting = 3.14 => 에러 발생함 (자료형이 한 번 지정이 되면 다른 자료형 할당 불가능)
var number:Int = 333
var number2:Double = 3.14

// NS <- NextStep을 의미
// 코드 설명 쓰기 중요함 -> 협업과 나 자신을 위해서 코드에 대한 설명 작성

// if문
// 총 세 가지의 키워드로 구성 if, else if, else로 구성
// 조건식은 주로 명제(참과 거짓을 판별 가능하게 하는 문장)
// and, or, not --> &&, ||, ! 으로 표현
if (/*조건식 주로 true 또는 false*/ true) {
    
} else if (/*조건식*/false) {
    
} else {
    
}
// 3항 연산자란?
var test = number > 100 ? "Big" : "Small"
// 아래의 if문과 결과가 동일
var test2: String!
if number > 100{
    test = "Big"
} else {
    test = "Small"
}

// Switch Case문
switch number {
case 100:
    print("1")
case 200:
    print("2")
case 300:
    print("3")
default:
    print("default")
}

// loop 반복문 : 같은 행위를 여러 번 반복
// for문은 주로 횟수를 아는 경우에 많이 사용
for _ in 1...5 {
    print ("hello")
}

for i in 1...100 where 1 % 2 == 0 {
    // 1에서 100 사이 중 짝수에서만 실행되는 for문에 해당
    // where 사용하면 범위 중에서도 조금 더 직관적인 표현이 가능함
    print(i)
}

var i = 1
while i < 6 {
    print (i)
    i += 1
}

repeat {
    print ("aaa")
    i += 1
} while i < 10


func testFunc() {
    print("test")
}

testFunc()

func testFunc2(msg: String) {
    print(msg)
}

testFunc2(msg: "gannii")

func testFunc3(_ msg: String) {
    print(msg)
}

testFunc3("gannii") // 앞에 매개변수 이름 붙이면 오류 발생함
