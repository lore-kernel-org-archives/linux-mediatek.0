From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH] kasan: fix the missing underflow in memmove and memcpy
 with CONFIG_KASAN_GENERIC=y
Date: Tue, 8 Oct 2019 19:02:08 +0800
Message-ID: <1570532528.4686.102.camel@mtksdccf07>
References: <1570515358.4686.97.camel@mtksdccf07>
         <B53A3CC0-CEA6-4E1C-BC38-19315D949F38@lca.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B53A3CC0-CEA6-4E1C-BC38-19315D949F38@lca.pw>
Sender: linux-kernel-owner@vger.kernel.org
To: Qian Cai <cai@lca.pw>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-10-08 at 05:47 -0400, Qian Cai wrote:
> 
> > On Oct 8, 2019, at 2:16 AM, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > 
> > It is an undefined behavior to pass a negative numbers to
> >    memset()/memcpy()/memmove(), so need to be detected by KASAN.
> 
> Why can’t this be detected by UBSAN?

I don't know very well in UBSAN, but I try to build ubsan kernel and
test a negative number in memset and kmalloc_memmove_invalid_size(), it
look like no check.
