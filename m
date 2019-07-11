From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v3] kasan: add memory corruption identification for
 software tag-based mode
Date: Thu, 11 Jul 2019 18:06:19 +0800
Message-ID: <1562839579.5846.12.camel@mtksdccf07>
References: <20190613081357.1360-1-walter-zh.wu@mediatek.com>
         <da7591c9-660d-d380-d59e-6d70b39eaa6b@virtuozzo.com>
         <1560447999.15814.15.camel@mtksdccf07>
         <1560479520.15814.34.camel@mtksdccf07>
         <1560744017.15814.49.camel@mtksdccf07>
         <CACT4Y+Y3uS59rXf92ByQuFK_G4v0H8NNnCY1tCbr4V+PaZF3ag@mail.gmail.com>
         <1560774735.15814.54.camel@mtksdccf07>
         <1561974995.18866.1.camel@mtksdccf07>
         <CACT4Y+aMXTBE0uVkeZz+MuPx3X1nESSBncgkScWvAkciAxP1RA@mail.gmail.com>
         <ebc99ee1-716b-0b18-66ab-4e93de02ce50@virtuozzo.com>
         <1562640832.9077.32.camel@mtksdccf07>
         <d9fd1d5b-9516-b9b9-0670-a1885e79f278@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9fd1d5b-9516-b9b9-0670-a1885e79f278@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Miles Chen <miles.chen@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-10 at 21:24 +0300, Andrey Ryabinin wrote:
> 
> On 7/9/19 5:53 AM, Walter Wu wrote:
> > On Mon, 2019-07-08 at 19:33 +0300, Andrey Ryabinin wrote:
> >>
> >> On 7/5/19 4:34 PM, Dmitry Vyukov wrote:
> >>> On Mon, Jul 1, 2019 at 11:56 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> 
> >>>
> >>> Sorry for delays. I am overwhelm by some urgent work. I afraid to
> >>> promise any dates because the next week I am on a conference, then
> >>> again a backlog and an intern starting...
> >>>
> >>> Andrey, do you still have concerns re this patch? This change allows
> >>> to print the free stack.
> >>
> >> I 'm not sure that quarantine is a best way to do that. Quarantine is made to delay freeing, but we don't that here.
> >> If we want to remember more free stacks wouldn't be easier simply to remember more stacks in object itself?
> >> Same for previously used tags for better use-after-free identification.
> >>
> > 
> > Hi Andrey,
> > 
> > We ever tried to use object itself to determine use-after-free
> > identification, but tag-based KASAN immediately released the pointer
> > after call kfree(), the original object will be used by another
> > pointer, if we use object itself to determine use-after-free issue, then
> > it has many false negative cases. so we create a lite quarantine(ring
> > buffers) to record recent free stacks in order to avoid those false
> > negative situations.
> 
> I'm telling that *more* than one free stack and also tags per object can be stored.
> If object reused we would still have information about n-last usages of the object.
> It seems like much easier and more efficient solution than patch you proposing.
> 
To make the object reused, we must ensure that no other pointers uses it
after kfree() release the pointer.
Scenario:
1). The object reused information is valid when no another pointer uses
it.
2). The object reused information is invalid when another pointer uses
it.
Do you mean that the object reused is scenario 1) ?
If yes, maybe we can change the calling quarantine_put() location. It
will be fully use that quarantine, but at scenario 2) it looks like to
need this patch.
If no, maybe i miss your meaning, would you tell me how to use invalid
object information? or?

> As for other concern about this particular patch
>  - It wasn't tested. There is deadlock (sleep in atomic) on the report path which would have been noticed it tested.
we already used it on qemu and ran kasan UT. It look like ok.

>    Also GFP_NOWAIT allocation which fails very noisy and very often, especially in memory constraint enviromnent where tag-based KASAN supposed to be used.
> 
Maybe, we can change it into GFP_KERNEL.

>  - Inefficient usage of memory:
> 	48 bytes (sizeof (qlist_object) + sizeof(kasan_alloc_meta)) per kfree() call seems like a lot. It could be less.
> 
We will think it.

> 	The same 'struct kasan_track' stored twice in two different places (in object and in quarantine).
> 	Basically, at least some part of the quarantine always duplicates information that we already know about
> 	recently freed object. 
> 
> 	Since now we call kmalloc() from kfree() path, every unique kfree() stacktrace now generates additional unique stacktrace that
> 	takes space in stackdepot.
> 
Duplicate information is solved after change the calling
quarantine_put() location.
