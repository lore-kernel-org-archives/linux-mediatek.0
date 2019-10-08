From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH] kasan: fix the missing underflow in memmove and memcpy
 with CONFIG_KASAN_GENERIC=y
Date: Tue, 8 Oct 2019 20:07:39 +0800
Message-ID: <1570536459.4686.109.camel@mtksdccf07>
References: <1570532528.4686.102.camel@mtksdccf07>
         <D2B6D82F-AE5F-4A45-AC0C-BE5DA601FDC3@lca.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <D2B6D82F-AE5F-4A45-AC0C-BE5DA601FDC3@lca.pw>
Sender: linux-kernel-owner@vger.kernel.org
To: Qian Cai <cai@lca.pw>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-10-08 at 07:42 -0400, Qian Cai wrote:
> 
> > On Oct 8, 2019, at 7:02 AM, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > 
> > I don't know very well in UBSAN, but I try to build ubsan kernel and
> > test a negative number in memset and kmalloc_memmove_invalid_size(), it
> > look like no check.
> 
> It sounds like more important to figure out why the UBSAN is not working in this case rather than duplicating functionality elsewhere.

Maybe we can let the maintainer and reviewer decide it :)
And We want to say if size is negative numbers, it look like an
out-of-bounds, too. so KASAN make sense to detect it.
