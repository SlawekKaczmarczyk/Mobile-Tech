import UIKit
// zad1
var string = "666"
var int = 666
var double = 666.0

// zad2
let const1: String = "111"
let const2: Int = 111
let const3: Double = 111.0

// zad3
let res1 = string + " " + String(double)
let res2 = "\(string) \(double) "

// zad4
var letters = ["a","b","c","d","e"]
var dictionary = [5:"Great", 2:"You lost this semestr"]
print(letters)

// zad5
letters.insert("z", at: 0)
dictionary.updateValue("Lucky", forKey: 3)

print(letters)
print(dictionary)

// zad6
var date = ["29-11-14","27-11-14"]
var results = [[4,5,21,30,31,49],[5,8,10,19,23,40]]

let lottoResults = Dictionary(zip(date, results), uniquingKeysWith: { (first, _) in first })
print(lottoResults)


// zad7
var arr_sign_index = [Character:Int]()
for i in 1...10
{
    arr_sign_index.updateValue(i, forKey: Character(Unicode.Scalar(i+64)!))
}
print(arr_sign_index)

// zad9
for var x in lottoResults
{
    print("Losowanie z dnia \(x.key):")
    for var y in x.value
    {
        print("-\(y)")
    }
}
print(lottoResults)

// zad10
func NWD(a:Int,b:Int) -> Int
{
    let res = a % b
    if res == 0{
        return b
    }
    else{
        return NWD(a:b,b:res)
    }
}
print(NWD(a: 52, b: 91))

// zad11
func NWDnew(a: Int,b:Int) -> (divide: Int, a:Int, b:Int)
{
    let divide = NWD(a: a, b: b)
    return (divide:divide,a:a/divide,b:b/divide)
}
print(NWDnew(a: 52, b: 91))


//zad12
func change(c:Character)->Character{
    var r:Character
    switch c{
    case "G":
        r="A"
    case "A":
        r="G"
    case "D":
        r="E"
    case "E":
        r="D"
    case "R":
        r="Y"
    case "Y":
        r="R"
    case "P":
        r="O"
    case "O":
        r="P"
    case "L":
        r="U"
    case "U":
        r="L"
    case "K":
        r="I"
    case "I":
        r="K"
    default:
        r=c
    }
    return r
}
func cipher(s:String,f:(Character)->Character)->String{
    
    var newString=""
    for i in s.uppercased(){
        newString=newString+String(f(i))
    }
    return newString
}
print(cipher(s:"Some text message",f:change),cipher(s:"ag,de,ry,po,lu,ki", f:change))


//zad13
for i in lottoResults{
    print(i.key)
    print(i.value.map({$0%2}))
}

//zad 14 + 15 
class NamedObject{
    var Name = "";
    
    func describe()->String{
        return "Object called "+Name
    }
    class Sphere : NamedObject{
        var radius:Double;
        init(n : String, r : Double){
            self.radius = r
            super.init()
            self.Name=n;
        }
      
        var volume: Double {
            get {
                  return(4.0/3.0 * Double.pi*pow(radius, 3))
            }
            set {
                radius = pow((3*newValue/(4*Double.pi)),(1/3))
            }
        }
        
        override func describe() -> String {
            return "Object called "+Name+" having radius: "+String(radius)+" and V = "+String(round(volume))
        }
        
        
    }
    
}
var test = NamedObject();
test.Name="Object exist";
print(test.describe())

var test2 = NamedObject.Sphere(n:"Sphere",r:3.0);
print(test2.describe())

test2.volume=50
print(test2.describe())
