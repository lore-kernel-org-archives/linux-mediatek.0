From: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH 1/2] mm/kasan: dump alloc/free stack for page allocator
Date: Wed, 04 Sep 2019 10:37:04 -0400
Message-ID: <1567607824.5576.77.camel@lca.pw>
References: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
         <CAAeHK+wyvLF8=DdEczHLzNXuP+oC0CEhoPmp_LHSKVNyAiRGLQ@mail.gmail.com>
         <1567606591.32522.21.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567606591.32522.21.camel@mtksdccf07>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>, Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev <kasan-dev@googlegroups.com>, Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-09-04 at 22:16 +0800, Walter Wu wrote:
> On Wed, 2019-09-04 at 15:44 +0200, Andrey Konovalov wrote:
> > On Wed, Sep 4, 2019 at 8:51 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > +config KASAN_DUMP_PAGE
> > > +       bool "Dump the page last stack information"
> > > +       depends on KASAN && PAGE_OWNER
> > > +       help
> > > +         By default, KASAN doesn't record alloc/free stack for page
> > > allocator.
> > > +         It is difficult to fix up page use-after-free issue.
> > > +         This feature depends on page owner to record the last stack of
> > > page.
> > > +         It is very helpful for solving the page use-after-free or out-
> > > of-bound.
> > 
> > I'm not sure if we need a separate config for this. Is there any
> > reason to not have this enabled by default?
> 
> PAGE_OWNER need some memory usage, it is not allowed to enable by
> default in low RAM device. so I create new feature option and the person
> who wants to use it to enable it.

Or you can try to look into reducing the memory footprint of PAGE_OWNER to fit
your needs. It does not always need to be that way.
