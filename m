From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH] kasan: fix the missing underflow in memmove and memcpy
 with CONFIG_KASAN_GENERIC=y
Date: Mon, 14 Oct 2019 10:19:42 +0800
Message-ID: <1571019582.26230.8.camel@mtksdccf07>
References: <1570532528.4686.102.camel@mtksdccf07>
         <D2B6D82F-AE5F-4A45-AC0C-BE5DA601FDC3@lca.pw>
         <CACT4Y+Zbx-2yR-mN5GioaKUgGH1TpTE2D-OgLbR2Dy09ezyGGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACT4Y+Zbx-2yR-mN5GioaKUgGH1TpTE2D-OgLbR2Dy09ezyGGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Qian Cai <cai@lca.pw>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-10-08 at 14:11 +0200, Dmitry Vyukov wrote:
> On Tue, Oct 8, 2019 at 1:42 PM Qian Cai <cai@lca.pw> wrote:
> > > On Oct 8, 2019, at 7:02 AM, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > I don't know very well in UBSAN, but I try to build ubsan kernel and
> > > test a negative number in memset and kmalloc_memmove_invalid_size(), it
> > > look like no check.
> >
> > It sounds like more important to figure out why the UBSAN is not working in this case rather than duplicating functionality elsewhere.
> 
> Detecting out-of-bounds accesses is the direct KASAN responsibility.
> Even more direct than for KUBSAN. We are not even adding
> functionality, it's just a plain bug in KASAN code, it tricks itself
> into thinking that access size is 0.
> Maybe it's already detected by KUBSAN too?

Thanks for your response.
I survey the KUBSAN, it don't check size is negative in
memset/memcpy/memmove, we try to verify our uni testing too, it don't
report the bug in KUBSAN, so it needs to report this bug by KASAN. The
reason is like what you said. so we still send the patch.
