From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH 1/2] mm/kasan: dump alloc/free stack for page allocator
Date: Wed, 4 Sep 2019 15:44:37 +0200
Message-ID: <CAAeHK+wyvLF8=DdEczHLzNXuP+oC0CEhoPmp_LHSKVNyAiRGLQ@mail.gmail.com>
References: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev <kasan-dev@googlegroups.com>, Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 4, 2019 at 8:51 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> This patch is KASAN report adds the alloc/free stacks for page allocator
> in order to help programmer to see memory corruption caused by page.
>
> By default, KASAN doesn't record alloc/free stack for page allocator.
> It is difficult to fix up page use-after-free issue.
>
> This feature depends on page owner to record the last stack of pages.
> It is very helpful for solving the page use-after-free or out-of-bound.
>
> KASAN report will show the last stack of page, it may be:
> a) If page is in-use state, then it prints alloc stack.
>    It is useful to fix up page out-of-bound issue.
>
> BUG: KASAN: slab-out-of-bounds in kmalloc_pagealloc_oob_right+0x88/0x90
> Write of size 1 at addr ffffffc0d64ea00a by task cat/115
> ...
> Allocation stack of page:
>  prep_new_page+0x1a0/0x1d8
>  get_page_from_freelist+0xd78/0x2748
>  __alloc_pages_nodemask+0x1d4/0x1978
>  kmalloc_order+0x28/0x58
>  kmalloc_order_trace+0x28/0xe0
>  kmalloc_pagealloc_oob_right+0x2c/0x90
>
> b) If page is freed state, then it prints free stack.
>    It is useful to fix up page use-after-free issue.
>
> BUG: KASAN: use-after-free in kmalloc_pagealloc_uaf+0x70/0x80
> Write of size 1 at addr ffffffc0d651c000 by task cat/115
> ...
> Free stack of page:
>  kasan_free_pages+0x68/0x70
>  __free_pages_ok+0x3c0/0x1328
>  __free_pages+0x50/0x78
>  kfree+0x1c4/0x250
>  kmalloc_pagealloc_uaf+0x38/0x80
>
>
> This has been discussed, please refer below link.
> https://bugzilla.kernel.org/show_bug.cgi?id=203967
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> ---
>  lib/Kconfig.kasan | 9 +++++++++
>  mm/kasan/common.c | 6 ++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 4fafba1a923b..ba17f706b5f8 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -135,6 +135,15 @@ config KASAN_S390_4_LEVEL_PAGING
>           to 3TB of RAM with KASan enabled). This options allows to force
>           4-level paging instead.
>
> +config KASAN_DUMP_PAGE
> +       bool "Dump the page last stack information"
> +       depends on KASAN && PAGE_OWNER
> +       help
> +         By default, KASAN doesn't record alloc/free stack for page allocator.
> +         It is difficult to fix up page use-after-free issue.
> +         This feature depends on page owner to record the last stack of page.
> +         It is very helpful for solving the page use-after-free or out-of-bound.

I'm not sure if we need a separate config for this. Is there any
reason to not have this enabled by default?

> +
>  config TEST_KASAN
>         tristate "Module for testing KASAN for bug detection"
>         depends on m && KASAN
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 2277b82902d8..2a32474efa74 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -35,6 +35,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/bug.h>
>  #include <linux/uaccess.h>
> +#include <linux/page_owner.h>
>
>  #include "kasan.h"
>  #include "../slab.h"
> @@ -227,6 +228,11 @@ void kasan_alloc_pages(struct page *page, unsigned int order)
>
>  void kasan_free_pages(struct page *page, unsigned int order)
>  {
> +#ifdef CONFIG_KASAN_DUMP_PAGE
> +       gfp_t gfp_flags = GFP_KERNEL;
> +
> +       set_page_owner(page, order, gfp_flags);
> +#endif
>         if (likely(!PageHighMem(page)))
>                 kasan_poison_shadow(page_address(page),
>                                 PAGE_SIZE << order,
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20190904065133.20268-1-walter-zh.wu%40mediatek.com.
