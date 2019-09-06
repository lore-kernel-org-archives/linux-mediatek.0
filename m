From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH 1/2] mm/kasan: dump alloc/free stack for page allocator
Date: Fri, 6 Sep 2019 11:15:34 +0800
Message-ID: <1567739734.32522.67.camel@mtksdccf07>
References: <20190904065133.20268-1-walter-zh.wu@mediatek.com>
         <401064ae-279d-bef3-a8d5-0fe155d0886d@suse.cz>
         <1567605965.32522.14.camel@mtksdccf07>
         <7998e8f1-e5e2-da84-ea1f-33e696015dce@suse.cz>
         <1567607063.32522.24.camel@mtksdccf07>
         <99913463-0e2c-7dab-c1eb-8b9e149b3ee3@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99913463-0e2c-7dab-c1eb-8b9e149b3ee3@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-09-05 at 10:03 +0200, Vlastimil Babka wrote:
> On 9/4/19 4:24 PM, Walter Wu wrote:
> > On Wed, 2019-09-04 at 16:13 +0200, Vlastimil Babka wrote:
> >> On 9/4/19 4:06 PM, Walter Wu wrote:
> >>
> >> The THP fix is not required for the rest of the series, it was even merged to
> >> mainline separately.
> >>
> >>> And It looks like something is different, because we only need last
> >>> stack of page, so it can decrease memory overhead.
> >>
> >> That would save you depot_stack_handle_t (which is u32) per page. I guess that's
> >> nothing compared to KASAN overhead?
> >>
> > If we can use less memory, we can achieve what we want. Why not?
> 
> In my experience to solve some UAFs, it's important to know not only the
> freeing stack, but also the allocating stack. Do they make sense together,
> or not? In some cases, even longer history of alloc/free would be nice :)
> 
We think it only has free stack to find out the root cause. Maybe we can
refer to other people's experience and ideas.


> Also by simply recording the free stack in the existing depot handle,
> you might confuse existing page_owner file consumers, who won't know
> that this is a freeing stack.
> 
Don't worry it.
1. Our feature option has this description about last stack of page.
when consumer enable our feature, they should know the changing.
2. We add to print text message for alloc or free stack before dump the
stack of page. so consumers should know what is it.

> All that just doesn't seem to justify saving an u32 per page.

Actually, We want to slim memory usage instead of increasing the memory
usage at another mail discussion. Maybe, maintainer or reviewer can
provide some ideas. That will be great.

> > 
> > 
> 
