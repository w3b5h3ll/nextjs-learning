


console.log('--------函数参数--------')
// 函数参数
// 默认参数值：undefined
function multiply(a, b) {
    console.log(typeof b); // 输出 'undefined'，因为 b 没有传入
    b = typeof b !== 'undefined' ? b : 1; // 如果 b 未定义，则默认为 1
    return a * b;
}

console.log(multiply(5)); // 输出 5，因为 b 默认为 1

//

console.log('-------------------');

function multiplyDefault(a, b = 1) {
    return a * b;
}

console.log(multiplyDefault(5)); // 输出 5，因为 b 默认为 1


console.log('-------------------');

// 剩余参数，将不确定数量的参数表示为数组
function multiplyType2(multiplier, ...args) {
    // 箭头函数：arg是输入参数，arg * multiplier隐式返回值
    return args.map(arg => arg * multiplier);
}

console.log(multiplyType2(2, 1, 2, 3)); // 输出 [2, 4, 6]，将每个参数乘以 2


console.log('--------箭头函数--------')
// 简洁语法，使用更少的代码进行函数定义
const add = (a, b) => {
    return a + b;
};

console.log(add(2, 3)); // 输出 5

// this
// 传统函数：this 指向调用函数的对象
// 箭头函数：没有自己的this，继承自外部作用域

function Person() {
    this.age = 0;
    this.name = 'John';

    setInterval(function growUp() {
        this.age++;
        console.log(`${this.name} is now ${this.age} years old.`);
    }, 1000);
}