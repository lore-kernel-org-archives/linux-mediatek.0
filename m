From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: [PATCH] mm, debug, kasan: save and dump freeing stack trace for
 kasan
Date: Wed, 25 Sep 2019 12:41:18 +0300
Message-ID: <28e076ed-d4c2-c29d-f0cb-b976e8c0725a@virtuozzo.com>
References: <20190911083921.4158-1-walter-zh.wu@mediatek.com>
 <5E358F4B-552C-4542-9655-E01C7B754F14@lca.pw>
 <c4d2518f-4813-c941-6f47-73897f420517@suse.cz>
 <1568297308.19040.5.camel@mtksdccf07>
 <613f9f23-c7f0-871f-fe13-930c35ef3105@suse.cz>
 <79fede05-735b-8477-c273-f34db93fd72b@virtuozzo.com>
 <6d58ce86-b2a4-40af-bf40-c604b457d086@suse.cz>
 <4e76e7ce-1d61-524a-622b-663c01d19707@virtuozzo.com>
 <d98bf550-367d-0744-025a-52307248ec82@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d98bf550-367d-0744-025a-52307248ec82@suse.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vlastimil Babka <vbabka@suse.cz>, Walter Wu <walter-zh.wu@mediatek.com>
Cc: Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org



On 9/23/19 11:20 AM, Vlastimil Babka wrote:
> On 9/16/19 5:57 PM, Andrey Ryabinin wrote:
>> I'd rather keep all logic in one place, i.e. "if (!page_owner_disabled && (IS_ENABLED(CONFIG_KASAN) || debug_pagealloc_enabled())"
>> With this no changes in early_debug_pagealloc() required and CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y should also work correctly.
> 
> OK.
> 
> ----8<----
> 
> From 7437c43f02682fdde5680fa83e87029f7529e222 Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Mon, 16 Sep 2019 11:28:19 +0200
> Subject: [PATCH] mm, debug, kasan: save and dump freeing stack trace for kasan
> 
> The commit "mm, page_owner, debug_pagealloc: save and dump freeing stack trace"
> enhanced page_owner to also store freeing stack trace, when debug_pagealloc is
> also enabled. KASAN would also like to do this [1] to improve error reports to
> debug e.g. UAF issues. This patch therefore introduces a helper config option
> PAGE_OWNER_FREE_STACK, which is enabled when PAGE_OWNER and either of
> DEBUG_PAGEALLOC or KASAN is enabled. Boot-time, the free stack saving is
> enabled when booting a KASAN kernel with page_owner=on, or non-KASAN kernel
> with debug_pagealloc=on and page_owner=on.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=203967
> 
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Suggested-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
