//
//  main.swift
//  Swift-基础内容
//
//  Created by Jiyu Jiyu on 2018/6/20.
//  Copyright © 2018年 zhangjr. All rights reserved.
//  WebSite:    http://www.swift51.com/swift4.0/

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

/*  代码可以读作：
 “如果 Int(possibleNumber) 返回的可选 Int 包含一个值，将这个可选项中的值赋予一个叫做 actualNumber 的新常量。”
 如果转换成功，常量 actualNumber 就可以用在 if 语句的第一个分支中，他早已被可选内部的值进行了初始化，所以这时就没有必要用 ！后缀来获取里边的值。在这个例子中 actualNumber 被用来输出转换后的值。
 常量和变量都可以使用可选项绑定，如果你想操作 if 语句中第一个分支的 actualNumber 的值， 你可以写 if var actualNumber 来代替，可选项内部包含的值就会被
 设置为一个变量而不是常量。
 你可以在同一个 if 语句中包含多可选项绑定，用逗号分隔即可。如果任一可选绑定结果是 nil 或者布尔值为 false ，那么整个 if 判断会被看作 false 。
 下面的两个 if 语句是等价的：
 注意：如同提前退出中描述的那样，使用 if 语句创建的常量和变量只在 if 语句的函数体内有效。相反，在 guar 语句中创建常量和变量在 guard 语句后的代码中也可用。*/
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

/*  隐式展开可选项
 如上所述，可选项明确了常量或者变量可以“没有值”。可选项可以通过 if 语句来判断是否有值，如果有值得可以通过可选项绑定来获取里边的值。
 有时在一些程序结构中可选项一旦被设定值之后，就会一直拥有值。在这种情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开，因为它可以安全的确认每次访问
 的时候都有一个值。
 
 这种类型的可选项被定义为隐式展开可选项。通过在声明的类型后边添加一个叹号 （String!）而非问号 （String?）来书写隐式展开可选项。
 
 在可选项被定义的时候就能立即确认其中有值的情况下，隐式展开可选项非常有用。如同无主引用和隐式展开的可选属性中描述的那样，隐式展开可选项主要被用在 Swift 类的初始化过程中。
 
 隐式展开可选项的后台场景中通用的可选项，但是同样可以像非可选值那样来使用，每次访问的时候都不需要展开。下面的例子展示了在访问被明确为 String 的可选项展开时，可选
 字符串和隐式展开可选字符的行为区别：*/
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString //no need for exclamation mark

/*  你可以把隐式展开可选项当做在每次访问它的时候被给予了自动进行展开的权限，你可以在声明可选项的时候添加一个叹号而不是每次调用的时候在可选项后面添加一个叹号。
 注意：如果你在隐式展开可选项没有值得时候还尝试获取值，会导致运行错误。结果和在没有值得普通可选项后面加一个叹号一样。
 
 你可以像对待普通可选一样对待隐式展开可选项来检查里边是否包含一个值*/
if assumedString != nil {
    print(assumedString)
}

/*  你也可以使用隐式展开可选项通过可选绑定在一句话中检查和展开值：
 注意：不要再一个变量将来会变为 nil 的情况下使用隐式展开可选项。如果你需要检查一个变量在生存期内是否会变为 nil ，就使用普通可选项。*/
if let definiteString = assumedString {
    print(definiteString)
}


//MARK:13 错误处理

/*  在程序执行阶段，你可以使用错误处理机制来为错误状况负责。
 
 相比于可选项的通过值是否缺失来判断程序的执行正确与否，而错误处理机制能允许你判断错误的形成原因，在必要的情况下，还能将你的代码中的错误传递到程序的其他地方。
 
 当一个函数遇到错误情况，他会抛出一个错误，这个函数的访问者会捕捉到这个错误，并作出合适的反应。
 
 通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 try 关键字。
 
 Swift 会自动将错误传递到它们的生效范围之外，直到它们被 catch 分句处理。
 
 do 语句创建了一个新的容器范围，可以让错误被传递到不止一个的 catch 分句里。
 
 下面的例子演示了如何利用错误处理机制处理不同错误情况：*/
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

func makeASandwich() throws {
    // ..
}

do {
    try makeASandwich()
    //    eatASandwich()
} catch  {
    
}

/*  在上面的例子中，在没有干净的盘子或者缺少原料的情况下，方法 makeASandwich() 就会抛出一个错误。 由于 makeASandwich()的抛出，方法的调用被包裹在了一个
 try 的表达式中。 通过将方法的调用包裹在 do 语句中， 任何抛出来的错误都会被传递到预先提供的 catch 分句中。
 
 如果没有错误抛出，方法 eatASandwich() 就会被调用， 如果有错误抛出且满足 Error.OutOfCleanDishes 这个条件，方法 washDishes() 就会被执行。如果一
 个错误被抛出，而它又满足 Error.MissingIngredients 的条件，那么 buyGroceries(_:)就会协同被 catch 模式捕获的 [String] 值一起调用。
 
 有关抛出，捕获和错误传递的更详细信息请参考错误处理。*/

//MARK:14 断言和先决条件

/*  断言和先决条件用来检测运行时发生的事情。你可以使用它们来保证在执行后续代码前某必要条件是满足的。如果布尔条件在断言或先决条件中计算为 true, 代码就正常
 继续执行。如果条件计算为 false ，那么程序当前状态就是非法的；代码执行结束，然后你的 app 终止。
 
 你可以使用断言和先决条件来验证那些你在写代码时候的期望和假定，所以你可以包含它们作为你代码的一部分。断言能够帮助你在开发过程中找到错误和不正确的假定，
 先决条件帮助你探测产品的问题。在运行时帮助你额外验证你的期望，断言和先决条件同样是代码中好用的证明形式。不同于在上文错误处理中讨论的，断言和先决条件
 并不用于可回复或者期望的错误。由于错误断言或先决条件显示非法的程序状态，所以没办法来抓取错误断言。
 
 使用断言和先决条件不能代替你代码中小概率非法情况的处理设计。总之，使用它们来强制数据和状态正确会让你的 app 在非法状态是终止的更可预料，并帮助你更好的
 debug 。在检测到异常状态时尽可能快地停止执行同样能够帮助你减小由于异常状态造成的损失。
 
 断言和先决条件的不同之处在于他们什么时候做检查：断言只在 debug 构建的时候检查， 但先决条件在 debug 和生产构建中生效。
 在生产构建中，断言中的条件不会被计算。这就是说你可以在开发过程当中随便使用断言而无需担心影响生成性能。
 
 使用断言进行调试
 
 断言会在运行的时候检查一个逻辑条件是否为 true 。 顾名思义，断言可以“断言”一个条件是否为真。你可以使用断言确保在运行其他代码之前必要的条件已经被满足。
 如果条件判断为 true ，代码运行会继续进行；如果条件判断为 false，代码运行结束，你的应用就终止了。
 
 如果你的代码在调试环境下触发了一个断言，例如你在 Xcode 中创建一个运行一个应用，你可以明确的知道不可用的状态发生在什么地方，还能检查断言被触发时你的
 应用的状态。另外，断言还允许你附加一条调试的信息。
 
 你可以使用全局函数 assert(_:_:) 函数来写断言。向 assert(_:_:)函数传入一个结果为 true 或者 false 的表达式以及一条会在结果为 false 的时候显示的信息：*/

let age = 3
assert(age>0, "A person's age cannot be less than zero")

/*  在这个例子当中，代码只要在 if age >=0 评定为 true 是才会继续，就是说，如果 age 的值非负。如果 age 的值是负数，在上文代码
 中， age >= 0 评定为 false, 断言就会被触发，终止应用。
 
 断言信息可以删掉如果你想的话，就像下边的例子：*/
assert(age >= 0)

/*  如果代码已经检查了条，你可以使用 assertionFailure(_:file:line:)函数来标明断言失败，比如：*/

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can rid the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
/*  强制先决条件
 
 在你代码中任何条件可能潜在为假但必须肯定为真才能继续执行的地方使用先决条件。比如说，使用先决条件来检测下标没有越界，或者
 检测函数是否收到一个合法的值。
 
 你可以调用 precondition(_:_:file:line:) 函数来写先决条件。给这个函数传入表达式计算为 true 或 false ，如果条件的结果
 是 false 信息就会显示出来。比如说：*/

// In the implementation of a subscript ...
//precondition(index > 0, "Index must be greater than zero.")
/*  你可以调用 preconditionFailure(_:file:line:)函数来标明错误发生了——比如说，如果 switch 的默认情况被选中，但所有的合法输入数据应该被其他 switch的情况处理
 注意：如果你在不检查模式编译 (-Ounchecked)，先决条件不会检查。编译器假定先决条件永远为真，并且它根据你的代码进行优化。总之，fatalError(_:file:line:)函数
 一定会终止执行，无论你优化设定如何。
 
 你可以在草拟和早期开发过程中使用 fatalError(_:file:line:)函数标记那些还没实现的功能，通过使用 fatalError("Unimplemented")来作为代替。由于致命错误永远
 不会被优化，不同于断言和先决条件，你可以确定执行遇到这些临时占位永远停止。*/

























































