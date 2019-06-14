From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v3] kasan: add memory corruption identification for
 software tag-based mode
Date: Fri, 14 Jun 2019 10:32:00 +0800
Message-ID: <1560479520.15814.34.camel@mtksdccf07>
References: <20190613081357.1360-1-walter-zh.wu@mediatek.com>
         <da7591c9-660d-d380-d59e-6d70b39eaa6b@virtuozzo.com>
         <1560447999.15814.15.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560447999.15814.15.camel@mtksdccf07>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Miles Chen <miles.chen@mediatek.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-06-14 at 01:46 +0800, Walter Wu wrote:
> On Thu, 2019-06-13 at 15:27 +0300, Andrey Ryabinin wrote:
> > 
> > On 6/13/19 11:13 AM, Walter Wu wrote:
> > > This patch adds memory corruption identification at bug report for
> > > software tag-based mode, the report show whether it is "use-after-free"
> > > or "out-of-bound" error instead of "invalid-access" error.This will make
> > > it easier for programmers to see the memory corruption problem.
> > > 
> > > Now we extend the quarantine to support both generic and tag-based kasan.
> > > For tag-based kasan, the quarantine stores only freed object information
> > > to check if an object is freed recently. When tag-based kasan reports an
> > > error, we can check if the tagged addr is in the quarantine and make a
> > > good guess if the object is more like "use-after-free" or "out-of-bound".
> > > 
> > 
> > 
> > We already have all the information and don't need the quarantine to make such guess.
> > Basically if shadow of the first byte of object has the same tag as tag in pointer than it's out-of-bounds,
> > otherwise it's use-after-free.
> > 
> > In pseudo-code it's something like this:
> > 
> > u8 object_tag = *(u8 *)kasan_mem_to_shadow(nearest_object(cacche, page, access_addr));
> > 
> > if (access_addr_tag == object_tag && object_tag != KASAN_TAG_INVALID)
> > 	// out-of-bounds
> > else
> > 	// use-after-free
> 
> Thanks your explanation.
> I see, we can use it to decide corruption type.
> But some use-after-free issues, it may not have accurate free-backtrace.
> Unfortunately in that situation, free-backtrace is the most important.
> please see below example
> 
> In generic KASAN, it gets accurate free-backrace(ptr1).
> In tag-based KASAN, it gets wrong free-backtrace(ptr2). It will make
> programmer misjudge, so they may not believe tag-based KASAN.
> So We provide this patch, we hope tag-based KASAN bug report is the same
> accurate with generic KASAN.
> 
> ---
>     ptr1 = kmalloc(size, GFP_KERNEL);
>     ptr1_free(ptr1);
> 
>     ptr2 = kmalloc(size, GFP_KERNEL);
>     ptr2_free(ptr2);
> 
>     ptr1[size] = 'x';  //corruption here
> 
> 
> static noinline void ptr1_free(char* ptr)
> {
>     kfree(ptr);
> }
> static noinline void ptr2_free(char* ptr)
> {
>     kfree(ptr);
> }
> ---
> 
We think of another question about deciding by that shadow of the first
byte.
In tag-based KASAN, it is immediately released after calling kfree(), so
the slub is easy to be used by another pointer, then it will change
shadow memory to the tag of new pointer, it will not be the
KASAN_TAG_INVALID, so there are many false negative cases, especially in
small size allocation.

Our patch is to solve those problems. so please consider it, thanks.
