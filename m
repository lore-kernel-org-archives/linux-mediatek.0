From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH 1/2] mm/kasan: dump alloc/free stack for page allocator
Date: Thu, 5 Sep 2019 09:54:36 +0800
Message-ID: <1567648476.32522.36.camel@mtksdccf07>
References: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
 <CAAeHK+wyvLF8=DdEczHLzNXuP+oC0CEhoPmp_LHSKVNyAiRGLQ@mail.gmail.com>
 <1567606591.32522.21.camel@mtksdccf07> <1567607824.5576.77.camel@lca.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567607824.5576.77.camel@lca.pw>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Qian Cai <cai@lca.pw>
Cc: wsd_upstream@mediatek.com, Arnd Bergmann <arnd@arndb.de>, Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-mediatek@lists.infradead.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-09-04 at 10:37 -0400, Qian Cai wrote:
> On Wed, 2019-09-04 at 22:16 +0800, Walter Wu wrote:
> > On Wed, 2019-09-04 at 15:44 +0200, Andrey Konovalov wrote:
> > > On Wed, Sep 4, 2019 at 8:51 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > > +config KASAN_DUMP_PAGE
> > > > +       bool "Dump the page last stack information"
> > > > +       depends on KASAN && PAGE_OWNER
> > > > +       help
> > > > +         By default, KASAN doesn't record alloc/free stack for page
> > > > allocator.
> > > > +         It is difficult to fix up page use-after-free issue.
> > > > +         This feature depends on page owner to record the last stack of
> > > > page.
> > > > +         It is very helpful for solving the page use-after-free or out-
> > > > of-bound.
> > > 
> > > I'm not sure if we need a separate config for this. Is there any
> > > reason to not have this enabled by default?
> > 
> > PAGE_OWNER need some memory usage, it is not allowed to enable by
> > default in low RAM device. so I create new feature option and the person
> > who wants to use it to enable it.
> 
> Or you can try to look into reducing the memory footprint of PAGE_OWNER to fit
> your needs. It does not always need to be that way.

Thanks your suggestion. We can try to think what can be slimmed.

Thanks.
Walter
