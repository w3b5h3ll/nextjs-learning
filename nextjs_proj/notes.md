## Chapter 01: Getting Started

TypeScript

- Next.js detects if your project uses TypeScript and automatically installs the necessary packages and configuration. Next.js also comes with a TypeScript plugin for your code editor, to help with auto-completion and type-safety.

项目结构说明

- /app: all components
- /app/lib: functions(reusable utility functions )
- /app/ui: UI components
- /public: static assets
- Config: next.config.ts

```bash
┌───(c0r3dump@MacBook-Air)-[~/Works/nextjs-learning/nextjs_proj/nextjs-dashboard][mbair*]
└─$ tree -L 2
.
├── app
│   ├── layout.tsx
│   ├── lib
│   ├── page.tsx
│   ├── query
│   ├── seed
│   └── ui
├── next-env.d.ts
├── next.config.ts
├── node_modules
│   ├── @heroicons
│   ├── @tailwindcss
│   ├── @types
│   ├── autoprefixer -> .pnpm/autoprefixer@10.4.20_postcss@8.5.1/node_modules/autoprefixer
│   ├── bcrypt -> .pnpm/bcrypt@5.1.1/node_modules/bcrypt
│   ├── clsx -> .pnpm/clsx@2.1.1/node_modules/clsx
│   ├── next -> .pnpm/next@15.3.2_react-dom@19.1.0_react@19.1.0__react@19.1.0/node_modules/next
│   ├── next-auth -> .pnpm/next-auth@5.0.0-beta.25_next@15.3.2_react-dom@19.1.0_react@19.1.0__react@19.1.0__react@19.1.0/node_modules/next-auth
│   ├── postcss -> .pnpm/postcss@8.5.1/node_modules/postcss
│   ├── postgres -> .pnpm/postgres@3.4.6/node_modules/postgres
│   ├── react -> .pnpm/react@19.1.0/node_modules/react
│   ├── react-dom -> .pnpm/react-dom@19.1.0_react@19.1.0/node_modules/react-dom
│   ├── tailwindcss -> .pnpm/tailwindcss@3.4.17/node_modules/tailwindcss
│   ├── typescript -> .pnpm/typescript@5.7.3/node_modules/typescript
│   ├── use-debounce -> .pnpm/use-debounce@10.0.4_react@19.1.0/node_modules/use-debounce
│   └── zod -> .pnpm/zod@3.25.17/node_modules/zod
├── package.json
├── pnpm-lock.yaml
├── postcss.config.js
├── public
│   ├── customers
│   ├── favicon.ico
│   ├── hero-desktop.png
│   ├── hero-mobile.png
│   └── opengraph-image.png
├── README.md
├── tailwind.config.ts
└── tsconfig.json
```

运行

```bash
# install packages
pnpm i
# start server
pnpm dev
```

## Chapter 02: CSS Styling

Tailwind

> [Tailwind](https://tailwindcss.com/) is a CSS framework that speeds up the development process by allowing you to quickly write [utility classes](https://tailwindcss.com/docs/utility-first) directly in your React code.

使用`Tailwind`CSS框架进行快速CSS开发

- Tailwind classes

### `clsx` library

`clsx`可以根据不同的条件，选择不同的style

```typescript
import clsx from 'clsx';

// 可以看到这里的组件InvoiceStatus接收参数status
export default function InvoiceStatus({ status }: { status: string }) {
  return (
    <span
      className={clsx(
        'inline-flex items-center rounded-full px-2 py-1 text-sm',
        {
          'bg-gray-100 text-gray-500': status === 'pending',
          'bg-green-500 text-white': status === 'paid',
        },
      )}
    >
    // ...
)}
```

## Chapter03: Optimizing Fonts and Images

Why optimize fonts?

- Fonts play a significant role in the design of a website
- 浏览器初始用 fallback 字体或系统字体渲染文本，加载自定义字体后进行替换。**布局偏移的影响**：可能导致文本大小、间距或布局改变，使周围元素位置移动。

Next.js会自动进行字体优化

- `next/font` module

- 在构建阶段下载并托管在static assets

### Adding a primary font

So easy

Why optimize images?

- /public dir
- 代码资源引用：`src="/hero.png"`

- 自适应不同的screen size
- Lazy load
- ...

同样Next.js进行了自动优化

- `next/image` module

### `<Image>`组件

- Preventing layout shift
- Resizing images
- Lazy loading
- Support morden formats: WebP AVIF...

## Chapter 04: Creating Layouts and Pages

路由

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Ffolders-to-url-segments.png&w=3840&q=75)

> `page.tsx` is a special Next.js file that exports a React component, and it's required for the route to be accessible. In your application, you already have a page file: `/app/page.tsx` - this is the home page associated with the route `/`.

只有`page`文件是可以公开访问的

### Creating the dashboard layout

使用layouts，只进行部分渲染，而不整体渲染

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Fpartial-rendering-dashboard.png&w=3840&q=75)

### Root layout

/app/layout.tsx

- This is called a root layout and is required in every Next.js application
- Will be shared across all pages in your application

```mermaid
graph LR
  G[根布局] --> D[仪表盘布局]
  G --> P[产品布局]
  G --> B[博客布局]
  D --> D1[销售页]
  D --> D2[分析页]
```

## Chapter 05: Navigating Between Pages

在不同的pages之间进行跳转

Why optimize navigation?

- 传统方案：使用`<a>`标签
  - 但是每次都会导致页面的full page refresh

`<Link>` component

- In Next.js, `<Link>` allows you to do client-side navigation

### Automatic code-splitting and prefetching

Pattern: Showing active links

当用户处于某个页面时，对应的导航链接应该高亮显示，以提示用户当前的位置

- Hook: usePathname(),获取当前页面的URL

## Chapter 06: Setting up Your Database

PostgreSQL database

- 开源关系型数据库

**Vercel 是一个专注于现代 Web 应用的、集开发、部署和全球托管于一体的云平台。** 它为前端开发者提供了一套极致流畅的工作流，让发布和维护网站变得前所未有的简单和高效。

> #### 与 Git 的无缝集成，极致的自动化流程（CI/CD）
>
> 这是 Vercel 最核心的神技。它的工作流被称为 **“开发、预览、发布” (Develop, Preview, Ship)**。
>
> - **连接 Git 仓库：** 您只需将您的 GitHub, GitLab 或 Bitbucket 仓库连接到 Vercel。
> - **自动部署：** 每当您 `git push` 提交代码到主分支，Vercel 就会**自动**开始构建，并在几分钟内部署到生产环境。
> - **预览部署 (Preview Deployments)：** 这是它的王牌功能！当您创建一个新的 Pull Request (PR) 时，Vercel 会为这次 PR **自动创建一个独立的、可公开访问的预览网址**。您可以把这个链接发给同事、产品经理或客户，让他们在真实环境中测试和反馈新功能，而完全不影响线上生产环境。一旦 PR 被合并，Vercel 会自动将这些更改部署到生产环境。
>
> **效果：** 彻底告别了手动打包、上传服务器、重启服务的原始流程。整个发布过程自动化、可视化且安全可靠。

![image-20250701032135356](./notes/image-20250701032135356.png)

快速的就部署好了：https://nextjs-dashboard-vercel-jet.vercel.app/dashboard/customers

By connecting your GitHub repository, whenever you push changes to your **main** branch, Vercel will automatically redeploy your application with no configuration needed. When opening pull requests, you'll also have [instant preview URLs](https://vercel.com/docs/deployments/environments#preview-environment-pre-production#preview-urls) which allow you to catch deployment errors early and share a preview of your project with team members for feedback.

### Create a Postgres database

Storage >> next's-dashboard-data >> .env.local

```bash
POSTGRES_URL="postgres://postgres.lyovqnyoyhagclcskqkx:YnWiZqDwAG3swYRL@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&supa=base-pooler.x"
POSTGRES_USER="postgres"
POSTGRES_HOST="db.lyovqnyoyhagclcskqkx.supabase.co"
SUPABASE_JWT_SECRET="cGFdhR6LLGlt+VdClOS4AhXxvbtsVek41A5Om0sU9Ss17Alg5YvmpKjtJRbapasoRLtPFIXC1t/g2esn2rQPwg=="
NEXT_PUBLIC_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5b3ZxbnlveWhhZ2NsY3NrcWt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzMTEyNDYsImV4cCI6MjA2Njg4NzI0Nn0.qpvlnZ-8TvuWPDQAKtKm2NwxRjsBZhz-qOHPawTHy3U"
POSTGRES_PRISMA_URL="postgres://postgres.lyovqnyoyhagclcskqkx:YnWiZqDwAG3swYRL@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true"
POSTGRES_PASSWORD="YnWiZqDwAG3swYRL"
POSTGRES_DATABASE="postgres"
SUPABASE_URL="https://lyovqnyoyhagclcskqkx.supabase.co"
SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5b3ZxbnlveWhhZ2NsY3NrcWt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzMTEyNDYsImV4cCI6MjA2Njg4NzI0Nn0.qpvlnZ-8TvuWPDQAKtKm2NwxRjsBZhz-qOHPawTHy3U"
NEXT_PUBLIC_SUPABASE_URL="https://lyovqnyoyhagclcskqkx.supabase.co"
SUPABASE_SERVICE_ROLE_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5b3ZxbnlveWhhZ2NsY3NrcWt4Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MTMxMTI0NiwiZXhwIjoyMDY2ODg3MjQ2fQ.2-eFQ1cS3E6gS6Z0Oekfonpl4gx3c8R8-txI9U492Xk"
POSTGRES_URL_NON_POOLING="postgres://postgres.lyovqnyoyhagclcskqkx:YnWiZqDwAG3swYRL@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require"
```

现在数据库已经创建好了，开始输入一些数据

- localhost:3000/seed

![image-20250701033634356](./notes/image-20250701033634356.png)

执行失败，使用`bcryptjs`

真相是：Code的代码目录与命令行是两个路径，搞错了两个文件夹

> - The script uses `bcrypt` to hash the user's password, if `bcrypt` isn't compatible with your environment, you can update the script to use [`bcryptjs`](https://www.npmjs.com/package/bcryptjs) instead.

```bash
pnpm remove bcrypt
pnpm add bcryptjs
```

Github Disscussions

- https://github.com/vercel/next.js/discussions/76822#discussioncomment-12411805

## Chapter 07: Fetching Data

不同的方式去获取数据，并完善dashboard overview page

API layer

- In Next.js, you can create API endpoints using Route Handlers.

Database queries

- You need to write logic to interact with your database. For relational databases like Postgres, you can do this with SQL or with an ORM.

### Using Server Components to fetch data

Next.js applications use <mark>React Server Components</mark>.

- 支持异步任务，JavaScript Promise，直接使用`async/await`语法进行数据获取
- 减轻客户端负担，组件在服务端运行
- 简化数据库交互

### Using SQL

postgres.js library

问题

- request waterfall: 导致阻塞
- Next.js会对路由进行预渲染来提高性能，被称为Static Rendering。导致数据即使发生变化，也不会反应在dashboard上

![](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Fsequential-parallel-data-fetching.png&w=3840&q=75)

- 后续的请求依赖之前的请求完成

并行数据获取

> Promise 是 JavaScript 中用于处理异步操作的一种对象。它代表一个异步操作的最终完成（或失败）及其结果值。简单来说，Promise 是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果。

In JavaScript, you can use the [`Promise.all()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) or [`Promise.allSettled()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/allSettled) functions to initiate all promises at the same time. For example, in `data.ts`, we're using `Promise.all()` in the `fetchCardData()` function:

## Chapter 08: Static and Dynamic Rendering

本节核心内容

- What static rendering is and how it can improve your application's performance
- What dynamic rendering is and when to use it
- Diffrent approaches to make your dashboard dynamic
- Simulate a slow data fetch to see what happens

静态渲染

- At build time: data fetching and rendering
- Cached
- Faster
- 例如静态博客

动态渲染

- At request time: rendering

### 模拟缓慢的数据获取

What happens if one data request is slower than all the others?

- With dynamic rendering, your application is only as slowest data fetch.

## Chapter 09: Streaming

Streaming是一种数据传输技术，它允许你将一条路径分解为较小的 “块”，并在这些块准备好后，逐步从服务器向客户端流式传输。

![Diagram showing time with sequential data fetching and parallel data fetching](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Fserver-rendering-with-streaming.png&w=3840&q=75)

![Diagram showing time with sequential data fetching and parallel data fetching](https://nextjs.org/_next/image?url=https%3A%2F%2Fh8DxKfmAPhn8O0p3.public.blob.vercel-storage.com%2Flearn%2Fdark%2Fserver-rendering-with-streaming-chart.png&w=3840&q=75)

Streaming works well with React's component model, as each component can be considered a _chunk_.

There are two ways you implement streaming in Next.js:

1. At the page level, with the `loading.tsx` file (which creates `<Suspense>` for you).
2. At the component level, with `<Suspense>` for more granular control.

`loading.tsx` is a special Next.js file built on top of React Suspense. It allows you to create fallback UI to show as a replacement while page content loads.

Route groups:

- Route groups allow you to <mark>organize files into logical groups</mark> without affecting the URL path structure.
- When you create a new folder using parentheses (), the name won't be included in the URL path. So /dashboard/(overview)/page.tsx becomes /dashboard.

### Streaming a component

Suspense(悬念，这个词用的很好) 允许你推迟渲染应用程序的某些部分，直到满足某些条件（例如数据已加载）。你可以将动态组件包装在 Suspense 中。然后，在动态组件加载时，传入一个后备组件来显示。

- Refresh the page, and you should see all the cards load in at the same time. You can use this pattern when you want multiple components to load in at the same time.

### Deciding where to place your Suspense boundaries

1. 你希望用户在页面加载时获得怎样的体验。
2. 你希望优先展示哪些内容。
3. 组件是否依赖数据获取。

在下一章中，你将了解部分预渲染，这是一种新的 Next.js 渲染模型，其构建时考虑了流传输。

## // Chapter 10: Partial Prerendering

In this chapter, let's learn how to combine static rendering, dynamic rendering, and streaming in the same route with **Partial Prerendering (PPR)**.

> Partial Prerendering is an experimental feature introduced in Next.js 14. The content of this page may be updated as the feature progresses in stability. **PPR is only available with the Next.js canary releases** (`next@canary`), not in the stable version of Next.js. We do not yet recommend using Partial Prerendering in production.

## Chapter 11: Adding Search and Pagination

Your search functionality will span the client and the server. When a user searches for an invoice on the client, the URL params will be updated, data will be fetched on the server, and the table will re-render on the server with the new data.

使用URL搜索参数管理搜索状态

- **可书签化与可分享性**：搜索参数包含在 URL 中，用户能够将应用当前状态（含搜索查询与筛选条件）添加书签，便于日后参考或分享。
- **支持服务器端渲染**：服务器可直接读取 URL 参数来渲染初始状态，让服务器端渲染的处理更为简便。
- **利于分析与追踪**：搜索查询和筛选条件直接体现在 URL 中，无需额外客户端逻辑，就能更轻松地追踪用户行为。

### 添加搜索功能

These are the Next.js client hooks that you'll use to implement the search functionality:

- **`useSearchParams`**- Allows you to access the parameters of the current URL. For example, the search params for this URL `/dashboard/invoices?page=1&query=pending` would look like this: `{page: '1', query: 'pending'}`.
- **`usePathname`** - Lets you read the current URL's pathname. For example, for the route `/dashboard/invoices`, `usePathname` would return `'/dashboard/invoices'`.
- **`useRouter`** - Enables navigation between routes within client components programmatically. There are [multiple methods](https://nextjs.org/docs/app/api-reference/functions/use-router#userouter) you can use.

实现步骤

- 获取用户输入
- 使用搜索参数更新URL
- 保持URL与输入字段保持同步
- 更新表格

- The URL is updated without reloading the page, thanks to Next.js's client-side navigation (which you learned about in the chapter on [navigating between pages](https://nextjs.org/learn/dashboard-app/navigating-between-pages).

将URL与Input同步

### React 中 defaultValue 与 value 的区别及受控 / 非受控组件说明

- **value 属性与受控组件**：若通过状态（state）管理输入框值，需使用 `value` 属性将组件变为**受控组件**，此时输入框状态由 React 负责管理。
- **defaultValue 属性与非受控组件**：若不使用状态管理，可使用 `defaultValue`，此时输入框状态由原生 DOM 自行管理。该方式适用于将搜索查询保存至 URL 而非状态的场景

### Updating the table

防抖？Debouncing

![image-20250706003405723](./notes/image-20250706003405723.png)

**防抖是一种编程实践，用于限制函数的触发频率**，核心逻辑如下：

1. **触发事件**：例如用户在搜索框输入（按键事件），启动定时器。
2. **等待机制**：若定时器结束前再次触发事件，重置定时器。
3. **执行函数**：当定时器计时结束（用户停止输入后），才执行目标函数。

使用`use-debounce`来实现

```bash
pnpm i use-debounce
```

By debouncing, you can reduce the number of requests sent to your database, thus saving resources.

### Adding pagination
