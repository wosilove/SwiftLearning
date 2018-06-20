//
//  main.swift
//  Swift-基础内容
//
//  Created by Jiyu Jiyu on 2018/6/20.
//  Copyright © 2018年 zhangjr. All rights reserved.
//  WebSite:https://www.cnswift.org/the-basics#spl-19

import Foundation

/**
 *MARK:常量和变量
 *  注意：在你的代码中，如果存储的值不会改变，请用let关键字将之声明为一个常量。只有储存会改变的值时才使用变量。
 */
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

//一行中声明多个变量或常量，用逗号分隔
var x = 0.0, y = 0.0, z = 0.0

/**
 *  类型标注
 *  你可以在声明一个变量或常量的时候提供类型标注，来明确变量或常量能够储存值的类型。
 *  添加类型标注的方法是在变量或常量的名字后面加一个冒号，再跟一个空格，最后加上要使用的类型名称。
 *  注意：实际上，你并不需要经常使用类型标注。如果你在定义一个常量或者变量的时候就给他设定一个初始值，那么Swift就像类型安全和类型判断中描述的那样，几乎都可以
 *       推断出这个常量或变量的类型。在下面welcomeMessage的栗子中，没有提供初始值，所以welcomeMessage这个变量使用了类型标注来明确它的类型而不是通过初始
 *       值得类型推断出来的。
 */

var welcomeMessage: String

welcomeMessage = "Hello"

//你可以在一行中定义多个相关的变量为相同的类型，用逗号分隔，只要在最后的变量名字后边加上类型标注。

var red, green, blue: Double

/**
 *  命名常量和变量
 *  常量和变量的名字几乎可以使用任何字符，甚至包括Unicode字符：
 *  常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode码位、连线和制表符。也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方。
 *  一旦你声明了一个确定类型的常量或者变量，就不能使用相同的名字再次进行声明，也不能让它改存其他类型的值。常量和变量之间也不能互换。
 *  注意：如果你需要使用Swift保留的关键字来给常量或变量命名，可以使用反引号（'）包围它来作为名称。总之，除非别无选择，避免使用关键字作为名字除非你确实别无选择。
 */

let 𝜋 = 3.14159
let 你好 = "你好世界"
let 🐶🐄 = "dogcow"


var friendlyWelcome = "Hello!"

friendlyWelcome = "Bonjour!"

//friendlyWelcome 现在是 "Bonjour!"

//不同于变量，常量的值一旦设定则不能再被改变。尝试这么做将会在你代码编译时导致报错：

let languageName = "Swift"

//languageName = "Swift++"

//this is a compile-time error - languageName cannot be changed

/**
 *  输出常量和变量
 *  你可以使用print(_:separator:terminator:)函数来打印当前常量和变量中的值。
 */

print(friendlyWelcome)
//输出"Bonjour!"

//MARK:9 类型别名
/**
 *  类型别名可以为已经存在的类型定义了一个新的可选名字。用typealias关键字定义类型别名。
 *  当你根据上下文的语境想要给类型一个更有意义的名字的时候，类型别名会非常高效，例如处理外部资源中特定长度的数据时：
 */
typealias AudioSample = UInt16

/*一旦为类型创建了一个别名，你就可以在任何使用原始名字的地方使用这个别名。*/

var maxAmplitudeFound = AudioSample.min
//maxAmplitudeFound is now 0

/*在这个例子中，AudioSmaple就是UInt16的别名，因为这个别名的存在，我们调用AudioSample.min其实就是在调用UInt16.min，
  在这里变量maxAmplitudeFound被提供了一个初始值 0。*/

//MARK:10 布尔值
/*  Swift有一个基础的布尔量类型，就是Bool，布尔量被作为逻辑值来引用，因为他的值只能是真或者假。Swift为布尔量提供了两个常量值，true和false。  */

let orangesAreOrange = true
let turnipsAreDelicious = false
/*   上面的两个类型orangesAreOrange 和 turnipsAreDelicious ，被推断为Bool，因为他们使用布尔量来初始化。对于上文中的Int 和 Double，当你
     在创建的他们的时候设置为true或false，那么就不必给这个常量或者变量声明为Bool类型。初始化常量或者变量的时候，如果值得类型已知，类型推断会把Swift
     代码变得更加整洁和易读。*/

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
}else {
    print("Eww,trunips are horrible.")
}
/*  Swift的类型安全机制会阻止你用一个非布尔量的值替换掉Bool。下面的例子中报告了一个发生在编译时的错误：*/
let i = 1
/*if i {
    //this example will no compile, and will report an error.
}*/
if i == 1 {
    //this example will compile successfully
}
//MARK:11 元组
/*  元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。
 
    在下面的示例中，(404,"Not Found")是一个描述了HTTP状态代码的元组。HTTP状态码是当你请求网页的时候web服务器返回的一个特殊值。当你请求不存在的网页时，
    就返回 404 Not Found*/
let http404Error = (404,"Not Found")
//http404Error is of type (Int, String), and equals (404, "Not Found")
/*  (404, "Not Found")元组把一个Int 和一个 String 组合起来标示HTTP状态代码的两种不同的值：数字和人类可读的描述。他可以描述为“一个类型为(Int, String)的元组”
    任何类型的排列都可以被用来创建一个元组，他可以包含人任意多的类型。例如(Int, Int, Int)或者 (String, Bool)，实际上，任何类型的组合都是可以的。
    你也可以将一个元组的内容分解成单独的常量或者变量，这样你就可以正常的使用它们了：*/
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
//prints "The status code is 404"
print("The status message is \(statusMessage)")
/*  当你分解元组的时候，如果只需要使用其中的一部分数据，不需要的数据可以用下划线（_）代替：*/
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
/*  另外一种方法就是利用从零开始的索引数字访问元组中的单独元素：  */

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
/*  你可以在定义元组的时候给其中的单个元素命名：  */
let http200Status = (statusCode: 200, description: "OK")
/*  在命名之后，你就可以通过访问名字来获取元素的值了：   */
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
/*  作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个 (Int, String)元组来描述是否获取成功。相比只能返回一个类型的值，元组能包含两个不同类型的
    值，他可以让函数的返回信息更有用。
    注意：元组在临时的值组合中很有用，但是它们不适合创建复杂的数据结构。如果你的数据结构超出了临时使用的范围，那么请建立一个类或结构体来代替元组。*/

//MARK:12 可选项
/*  可以利用可选项来处理值可能缺失的情况。可选项意味着：
    这里有一个值，他等于x
    或者
    这里根本没有值
    注意：在 C 和 Objective-C 中，没有可选项的概念。在 Objective-C 中有一个近似的特性，一个方法可以返回一个对象或者返回 nil 。 nil 的意思是“缺少一个可用对
    象”。然而，他只能用在对象上，却不能作用在结构体，基础的 C 类型和枚举值上。对于这些类型， Objective-C 会返回一个特殊的值 （例如 NSNotFound）来表示值的缺失
    。这种方法是建立在假设调用者知道这个特殊的值并记得去检查他。然而，Swift中的可选项就可以让你知道任何类型的值得缺失，他并不需要一个特殊的值。
 
    下面的例子演示了可选项如何作用于值得缺失，Swift的 Int 类型中有一个初始化器， 可以将 String 值转换为一个 Int 值。然而并不是所有的字符串都可以转换成整数。字
    符串 "hello, world" 就显然不能转换为一个数字值。
 
    在下面的例子中，试图利用初始化器将一个 String 转换为 Int*/

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumber is inferred to be of type "Int?", or "optional Int"

/*  因为这个初始化器可能会失败，所以他会返回一个可选的 Int ， 而不是 Int 。可选的 Int 写做 Int? ，而不是 Int 。问号明确了它储存的值是一个可选项，意思就是说它可
    能包含某些 Int 值， 或者可能根本不包含值。（他不能包含其他的值，例如 Bool 值或者 String 值。 它要么是 Int 要么什么都没有。）*/

/*  nil
    你可以通过给可选变量赋值一个 nil 来将之设置为没有值：
    注意： nil 不能用于非可选的常量或者变量，如果你的代码中变量或常量需要作用于特定条件下的值缺失，可以给他声明为相应类型的可选项。
    如果你定义的可选变量没有提供一个默认值，变量会被自定设置成 nil 。
    注意： Swift 中的 nil 和 Objective-C 中的 nil 不同，在 Objcective-C 中 nil 是一个指向不存在对象的指针。在 Swift 中， nil 不是指针， 他是值缺失的
    一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。    */
var serverResponseCode: Int? = 404
//serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
//serverResponseCode now contains no value

var suerveyAnswer: String?
//suerveyAnswer is automatically set to nil
/*  If 语句以及强制展开
    你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。 利用相等运算符（==）和不等运算符（ != ）。
 如果一个可选有值，他就“不等于” nil ：*/

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

/*  一旦你确定可选中包含值，你可以在可选的名字后面加一个感叹号（!）来获取值，感叹号的意思就是说“我知道这个可选项里边有值，展开吧。”
    这就是所谓的可选值的强制展开。
    如需了解更多有关 if 语句的内容，请参考 控制流。
    注意： 使用 ! 来获取一个不存在的可选值会导致运行错误，在使用 ! 强制展开之前必须确保可选项中包含一个非 nil 的值。  */
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber).")
}

/*  可选项绑定
    可以使用可选项绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量。可选绑定可以与 if 和 while 的语句使用来检查可选项内部的值， 并
    赋值给一个变量或常量。 if 和 while 语句的更多详细描述， 请参考控制流。
    在 if 语句中，这样书写可选绑定：  */
if let constantName = convertedNumber {
//    statements
}

//MARK:13 错误处理

//MARK:14 断言和先决条件


























































