From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 1/2] mm/kasan: dump alloc/free stack for page allocator
Date: Wed, 4 Sep 2019 16:13:48 +0200
Message-ID: <7998e8f1-e5e2-da84-ea1f-33e696015dce@suse.cz>
References: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
 <401064ae-279d-bef3-a8d5-0fe155d0886d@suse.cz>
 <1567605965.32522.14.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567605965.32522.14.camel@mtksdccf07>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On 9/4/19 4:06 PM, Walter Wu wrote:
> On Wed, 2019-09-04 at 14:49 +0200, Vlastimil Babka wrote:
>> On 9/4/19 8:51 AM, Walter Wu wrote:
>> > This patch is KASAN report adds the alloc/free stacks for page allocator
>> > in order to help programmer to see memory corruption caused by page.
>> > 
>> > By default, KASAN doesn't record alloc/free stack for page allocator.
>> > It is difficult to fix up page use-after-free issue.
>> > 
>> > This feature depends on page owner to record the last stack of pages.
>> > It is very helpful for solving the page use-after-free or out-of-bound.
>> > 
>> > KASAN report will show the last stack of page, it may be:
>> > a) If page is in-use state, then it prints alloc stack.
>> >    It is useful to fix up page out-of-bound issue.
>> 
>> I expect this will conflict both in syntax and semantics with my series [1] that
>> adds the freeing stack to page_owner when used together with debug_pagealloc,
>> and it's now in mmotm. Glad others see the need as well :) Perhaps you could
>> review the series, see if it fulfils your usecase (AFAICS the series should be a
>> superset, by storing both stacks at once), and perhaps either make KASAN enable
>> debug_pagealloc, or turn KASAN into an alternative enabler of the functionality
>> there?
>> 
>> Thanks, Vlastimil
>> 
>> [1] https://lore.kernel.org/linux-mm/20190820131828.22684-1-vbabka@suse.cz/t/#u
>> 
> Thanks your information.
> We focus on the smartphone, so it doesn't enable
> CONFIG_TRANSPARENT_HUGEPAGE, Is it invalid for our usecase?

The THP fix is not required for the rest of the series, it was even merged to
mainline separately.

> And It looks like something is different, because we only need last
> stack of page, so it can decrease memory overhead.

That would save you depot_stack_handle_t (which is u32) per page. I guess that's
nothing compared to KASAN overhead?

> I will try to enable debug_pagealloc(with your patch) and KASAN, then we
> see the result.

Thanks.

> Thanks.
> Walter 
> 
