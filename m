From: Nathan Huckleberry <nhuck@google.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/clk/mediatek/clk-mt8516.c
Date: Thu, 13 Jun 2019 09:55:22 -0700
Message-ID: <CAJkfWY7=JKBub9W9q85cqQhZ1P3VT02CMOHaSyNsHebW4-xikQ@mail.gmail.com>
References: <CAJkfWY5eShXAr6QyFjqyaL-JjgQ+OKU0LtComURBVf_sDCqGeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJkfWY5eShXAr6QyFjqyaL-JjgQ+OKU0LtComURBVf_sDCqGeA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: fparent@baylibre.com, Michael Turquette <mturquette@baylibre.com>, matthias.bgg@gmail.com
Cc: clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings. There's a variable
(ddrphycfg_parents) in clk-mt8516.c causing an unused const warning.
Just wanted to reach out to ask if this variable is intended to be
used.

It doesn't look like it has been used since it was first introduced.
If it is no longer needed I'd like to remove it.

https://github.com/ClangBuiltLinux/linux/issues/523

Thanks,
Nathan Huckleberry

Re-sent in plaintext so mailing lists pick it up.


On Thu, Jun 13, 2019 at 9:47 AM Nathan Huckleberry <nhuck@google.com> wrote:
>
> Hey all,
>
> I'm looking into cleaning up ignored warnings in the kernel so we can remove compiler flags to ignore warnings. There's a variable (ddrphycfg_parents) in clk-mt8516.c causing an unused const warning. Just wanted to reach out to ask if this variable is intended to be used.
>
> It doesn't look like it has been used since it was first introduced. If it is no longer needed I'd like to remove it.
>
> https://github.com/ClangBuiltLinux/linux/issues/523
>
> Thanks,
> Nathan Huckleberry
