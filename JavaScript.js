/**********************   对象的基础知识   ******************/

let user = {     // 一个对象
    name: "John",  // 键 "name"，值 "John"
    age: 30        // 键 "age"，值 30
};
// 属性有键（或者也可以叫做名字，标识符），在冒号的前面 ":"，值在冒号的右边。
// 在 user 对象中, 有两个属性：
// 第一个的键是 "name" 值是 "John"。
// 第二个的键是 "age" 值是 30。

// 这个与上面的定义等价
let user = {     // 一个对象
    "name": "John",  // 键 "name"，值 "John"
    "age": 30        // 键 "age"，值 30
};

// 我们可以在对象字面量中使用方括号。这叫做计算属性。

// 例如：
let fruit = prompt("Which fruit to buy?", "apple");
let bag = {
  [fruit]: 5, // 属性名从 fruit 变量中计算
};
alert( bag.apple ); // 5 如果 fruit="apple"
/* 

变量存储的不是对象本身，而是对象的“内存地址”，是对象的引用。   其实就跟C语言的指针一个道理
我们只能在对象中使用 string 或 Symbol作为键，其他类型作键会自动转化为string

Symbol 是唯一标识符的基本类型   
Symbol 使用 Symbol() 创建的，调用带有一个可选的描述。
Symbol 总是不同的值，即使它们有相同的名称。如果我们希望同名 Symbol 相等，那么我们应该使用全局注册表：Symbol.for(key) 返回
    （如果需要的话创建）一个以 key 作为名称的全局 Symbol。Symbol.for 的多次调用完全返回相同的 Symbol。




Symbol 有两个主要的使用场景：

1. “隐藏” object 属性。如果需要将属性添加到 “属于” 另一个脚本或库的对象中，则可以创建 Symbol 并将其用作属性键。
Symbol 属性不出现在 for..in中，因此不回偶尔列出。另外，它不会被直接访问，因为另一个脚本没有我们的符号，所以它不会偶尔干预它的操作。

因此我们可以使用 Symbol 属性“秘密地”将一些东西隐藏到我们需要的 object 中，但其他人不应该看到。

2. JavaScript 使用了许多系统 Symbol，这些 Symbol 可以作为 Symbol.* 访问。我们可以使用它们来改变一些内置行为。
例如，在本教程的后面部分，我们将使用 Symbol.iterator 来迭代，Symbol.toPrimitive 来设置对象原始值的转换等等。



从技术上说，Symbol 不是 100% 隐藏的。有一个内置方法 Object.getOwnPropertySymbols(obj) 允许我们获取所有的 Symbol。
还有一个名为 Reflect.ownKeys(obj) 返回所有键，包括 Symbol。所以它们不是真正的隐藏。但是大多数库、内置方法和语法结构都遵循一个共同的协议。
而明确调用上述方法的人可能很清楚他在做什么。

*/