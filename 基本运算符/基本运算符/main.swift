//
//  main.swift
//  基本运算符
//
//  Created by Jiyu Jiyu on 2018/6/22.
//  Copyright © 2018年 zhangjr. All rights reserved.
//

import Foundation

/*  运算符是检查、改变、合并值的特殊符号或短语。例如，加号（+）将两个数相加（如 let i = 1 + 2）。更复杂的运算例子包括逻辑与运算符 && （如 if enteredDoorCode && passedRetinaScan）。
 
    Swift支持大部分标准C语言的运算符，且改进许多特性来减少常规编码错误。如：赋值符（=）不返回值，以防止把想要判断相等运算符（==）的地方写成赋值符号导致的错误。算术运算符（+，-，*，/，%等）会检测并不允许值溢出，以此来避免保存变量时由于变量大于或小于其类型所能承载的范围时导致的异常结果。当然允许你使用Swift的溢出运算符来实现溢出。详情参见溢出运算符。
 
    Swift还提供了C语言没有的区间运算符，例如 a..<b或 a...b，这方便我们表达一个区间的数值。
 
    本章节只描述了Swfit中基本运算符，高级运算符这章会包含Swift中的高级运算符，及如何自定义运算符，及如何进行自定义类型的运算符重载。
 */

//MARK:术语
/*  运算符分为一元、二元和三元运算符：
 
    ● 一元运算符对单一操作对象操作（如-a）。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在操作对象之前（如!b），后置运算符需紧跟在操作对象之后（如c!）。
    ● 二元运算符操作两个操作对象（如2+3），是中置的，因为它们出现在两个操作对象之间。
    ● 三元运算符操作三个对象，和C语言一样，Swift只有一个三元运算符，就是三目运算符（a?b:c）
 
    受运算符影响的值叫操作数，在表达式1+2中，加号+是二元运算符，它的两个操作数是值1和2。
 */

//MARK:赋值运算符
/*  赋值运算符(a=b)，表示b的值来初始化或更新a的值：*/

let b = 10
var a = 5
a = b
/*  如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量：*/
let (x,y) = (1,2)
/*  与C语言和Objective-C不同，Swift的赋值操作并不返回任何值。所以以下代码是错误的：    */
if x == y {
    
}
/*  这个特性使你无法把（==）错写成（=），由于 if x=y是错误代码，Swift能帮你避免此类错误发生。    */

//MARK:算术运算符


//MARK:组合赋值运算符


//MARK:比较运算符



//MARK:三目运算符



//MARK:空合运算符 （Nil Coalescing Operator）
/*  空合运算符（a ?? b）对可选类型 a 进行空判断，如果a包含一个值就进行解封，否则就返回一个默认值b。
 
    表达式a必须是Optional类型。默认值b的类型必须要和a存储值的类型保持一致。
 
    空合运算符是对以下代码的简短表达方法： */
var coa: Int?
coa != nil ? coa! : b

/*  上述代码使用了三目运算符。当可选类型a的值不为空时，进行强制解封（a!），访问a中的值；反之返回默认值b。无疑空合运算符（??）提供了一中更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。
 
    注意：如果a为非空值（non-nil），那么值b将不会被计算。这也就是所谓的短路求值。
 
    下文例子采用空合运算符，实现了在默认颜色名和可选自定义颜色名之间抉择：*/

let defaultColorName = "red"

var userDefinedColorName: String? //默认值为nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName的值为空，所以colorNameToUse的值为“red”

/*  userDefinedColorName变量被定义为一个可选的String类型，默认值为nil。由于userDefinedColorName是一个可选类型，我们可以使用空合运算符去判断其值。在上一个例子中，通过空合运算符为一个名为colorNameToUse 的变量赋予一个字符串类型初始值。由于userDefinedColorName值为空，因此表达式userDefinedColorName ?? defaultColorName返回defaultColorName的值，即red。
 
    另一个种情况，分配一个非控值（non-nil）给userDefinedColorName，再次执行空合运算，运算结果为封包在userDefaultColorName中的值，而非默认值。*/

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName 非空，因此colorNameToUse 的值为“green”

//MARK:区间运算符（Range Operators）
/*  Swift提供了几种方便表达一个区间的值得区间运算符。
 
    闭区间运算符
 
    闭区间运算符（a...b）定义一个包含从a到b（包括a和b）的所有值得区间。a的值不能超过b。闭区间运算符在迭代一个区间的所有值时是非常有用的，如在for-in循环中：
    关于for-in，请看控制流。
 */

for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

/*  半开区间运算符
 
    半开区间运算符（a..<b）定义一个从a到b但不包括b的区间。之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。
 
    半开区间的实用性在于当你使用一个从0开始的列表（如数组）时，非常方便地从0数到列表的长度。
 
    数组有4个元素，但0..<count只数到3（最后一个元素的下标），因为它是半开区间。关于数组，请查阅数组。
 */

let names = ["Anna","Alex","Brian","Jack"]
let count = names.count

for i in 0..<count {
    print("第\(i+1)个人叫\(names[i])")
}
/*  单侧区间
 
    闭区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间--例如，一个包含了数组从索引2到结尾的所有值得区间。在这些情况下，你可以省略掉区间操作符一侧的值。这种区间叫做单侧区间，因为操作符只有一侧有值。例如：
 
    */
for name in names[2...]{
    print(name)
}
for name in names[...2]{
    print(name)
}
/*  半开区间操作符也有单侧表达形式，附带上它的最终值。就像你使用区间去包含一个值，最终值并不会落在区间内。例如：  */
for name in names[..<2]{
    print(name)
}
/*  单侧区间不止可以在下标里使用，也可以在别的情境下使用。你不能遍历省略了初始值的单侧区间，因为遍历的开端并不明显。你可以遍历一个省略最终值得单侧区间；然而，由于这种区间无限延伸的特性，请保证你在循环里有一个结束循环的分支。你也可以查看一个单侧区间是否包含某个特定的值，就像下面展示的那样。*/
let range = ...5
range.contains(7)//false
range.contains(4)//true
range.contains(-1)//true
//MARK:逻辑运算符


























































