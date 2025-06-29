import { Inter } from 'next/font/google';
import { Lusitana } from 'next/font/google';
// 导入主字体Inter,加载时使用拉丁字符集
export const inter = Inter({ subsets: ['latin'] });
export const lusitana = Lusitana({
    subsets: ['latin'],
    weight: ['400', '700'],
});