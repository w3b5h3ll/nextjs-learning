import '@/app/ui/global.css';
import { inter } from '@/app/ui/fonts';

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      {/* Tailwind antialiased class */}
      {/* 抗锯齿，更加平滑 */}
      <body className='{`${inter.className} antialiased`}'>{children}</body>
    </html>
  );
}
