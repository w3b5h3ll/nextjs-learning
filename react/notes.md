Building blocks of a web application
There are a few things you need to consider when building modern applications. Such as:

- User Interface - how users will consume and interact with your application.
- Routing - how users navigate between different parts of your application.
- Data Fetching - where your data lives and how to get it.
- Rendering - when and where you render static or dynamic content.
- Integrations - what third-party services you use (for CMS, auth, payments, etc.) and how you connect to them.
- Infrastructure - where you deploy, store, and run your application code (serverless, CDN, edge, etc.).
- Performance - how to optimize your application for end-users.
- Scalability - how your application adapts as your team, data, and traffic grow.
- Developer Experience - your team's experience building and maintaining your application.

## React

React是一个用于构建可交互UI的库

- 提供API

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Flearn-react-components.png&w=3840&q=75)

## Next.js?

在React的基础上，提供更多的工具与配置

- 可以这么理解，如上面提到的web application构建，Next.js可以提供Routing, Data Fetching...其他模块
- 所以进行web应用开发的方案就变成了: react + next.js

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Flearn-ecosystem.png&w=3840&q=75)

## Chapter 02: Rendering User Interfaces

How browser render?

- 读取HTML并且构建DOM

DOM: Document Object Model

- The DOM is an object representation of the HTML elements.
- It acts as a bridge between your code and the UI

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Flearn-dom-and-ui.png&w=3840&q=75)

操作DOM

- DOM methods
- JavaScript

## Chapter 03: Updating UI with Javascript

- HTML: Source Code
- DOM: represents the updated page content which was changed by the JavaScript code you wrote.

使用JavaScript来更新DOM是一个比较繁琐的过程。

使用声明式(declarative programming)编程

- 只关心要什么，具体怎么做不管

> 换句话说，命令式编程就像给厨师一步一步地指导如何制作披萨。宣告式编程就像订购披萨，而不关心制作披萨的步骤。

<mark>由此，引入了React，是一个流行的声明式库。React: A declarative UI library</mark>

## Chapter 04: Getting Started with React
从外部引入scripts
- react
- react-dom


### JSX?
JSX: a syntax extension for JavaScript that allows you to <mark>describe your UI</mark> in a familiar HTML-like syntax

浏览器不能理解，所以需要一个JavaScript compiler
- 将 JSX转为JavaScript


And this is exactly what React does, it's a library that contains reusable snippets of code that perform tasks on your behalf - in this case, updating the UI.

**Additional Resources:**

You don't need to know exactly how React updates the UI to start using it, but if you'd like to learn more, here are some additional resources:

- [UI trees](https://react.dev/learn/understanding-your-ui-as-a-tree)
- [Writing markup with JSX](https://react.dev/learn/writing-markup-with-jsx)
- [react-dom/server](https://react.dev/reference/react-dom/server) sections in the React Documentation.





## // JavaScript Language 

### Fuctions and Arrow Functions





## Chapter 05: Building UI with Components

