From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v3] mm/kasan: dump alloc and free stack for page
 allocator
Date: Thu, 12 Sep 2019 23:13:53 +0800
Message-ID: <1568301233.19274.17.camel@mtksdccf07>
References: <20190911083921.4158-1-walter-zh.wu@mediatek.com>
         <5E358F4B-552C-4542-9655-E01C7B754F14@lca.pw>
         <c4d2518f-4813-c941-6f47-73897f420517@suse.cz>
         <1568297308.19040.5.camel@mtksdccf07>
         <613f9f23-c7f0-871f-fe13-930c35ef3105@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <613f9f23-c7f0-871f-fe13-930c35ef3105@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Qian Cai <cai@lca.pw>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-09-12 at 16:31 +0200, Vlastimil Babka wrote:
> On 9/12/19 4:08 PM, Walter Wu wrote:
> > 
> >>   extern void __reset_page_owner(struct page *page, unsigned int order);
> >> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> >> index 6c9682ce0254..dc560c7562e8 100644
> >> --- a/lib/Kconfig.kasan
> >> +++ b/lib/Kconfig.kasan
> >> @@ -41,6 +41,8 @@ config KASAN_GENERIC
> >>   	select SLUB_DEBUG if SLUB
> >>   	select CONSTRUCTORS
> >>   	select STACKDEPOT
> >> +	select PAGE_OWNER
> >> +	select PAGE_OWNER_FREE_STACK
> >>   	help
> >>   	  Enables generic KASAN mode.
> >>   	  Supported in both GCC and Clang. With GCC it requires version 4.9.2
> >> @@ -63,6 +65,8 @@ config KASAN_SW_TAGS
> >>   	select SLUB_DEBUG if SLUB
> >>   	select CONSTRUCTORS
> >>   	select STACKDEPOT
> >> +	select PAGE_OWNER
> >> +	select PAGE_OWNER_FREE_STACK
> >>   	help
> > 
> > What is the difference between PAGE_OWNER+PAGE_OWNER_FREE_STACK and
> > DEBUG_PAGEALLOC?
> 
> Same memory usage, but debug_pagealloc means also extra checks and 
> restricting memory access to freed pages to catch UAF.
> 
> > If you directly enable PAGE_OWNER+PAGE_OWNER_FREE_STACK
> > PAGE_OWNER_FREE_STACK,don't you think low-memory device to want to use
> > KASAN?
> 
> OK, so it should be optional? But I think it's enough to distinguish no 
> PAGE_OWNER at all, and PAGE_OWNER+PAGE_OWNER_FREE_STACK together - I 
> don't see much point in PAGE_OWNER only for this kind of debugging.
> 
If it's possible, it should be optional.
My experience is that PAGE_OWNER usually debug memory leakage.

> So how about this? KASAN wouldn't select PAGE_OWNER* but it would be 
> recommended in the help+docs. When PAGE_OWNER and KASAN are selected by 
> user, PAGE_OWNER_FREE_STACK gets also selected, and both will be also 
> runtime enabled without explicit page_owner=on.
> I mostly want to avoid another boot-time option for enabling 
> PAGE_OWNER_FREE_STACK.
> Would that be enough flexibility for low-memory devices vs full-fledged 
> debugging?

We usually see feature option to decide whether it meet the platform.
The boot-time option isn't troubled to us, because enable the feature
owner should know what he should add to do.
