From: Walter Wu <walter-zh.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3] kasan: add memory corruption identification for
 software tag-based mode
Date: Tue, 9 Jul 2019 10:53:52 +0800
Message-ID: <1562640832.9077.32.camel@mtksdccf07>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <ebc99ee1-716b-0b18-66ab-4e93de02ce50-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrey Ryabinin <aryabinin-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, Dmitry Vyukov <dvyukov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: wsd_upstream <wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Jason A . Donenfeld" <Jason-OnJsPKxuuEcAvxtiuMwx3w@public.gmane.org>, Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux-MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Andrey Konovalov <andreyknvl-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kasan-dev <kasan-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Alexander Potapenko <glider-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-07-08 at 19:33 +0300, Andrey Ryabinin wrote:
> 
> On 7/5/19 4:34 PM, Dmitry Vyukov wrote:
> > On Mon, Jul 1, 2019 at 11:56 AM Walter Wu <walter-zh.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >>>>>>>>> This patch adds memory corruption identification at bug report for
> >>>>>>>>> software tag-based mode, the report show whether it is "use-after-free"
> >>>>>>>>> or "out-of-bound" error instead of "invalid-access" error.This will make
> >>>>>>>>> it easier for programmers to see the memory corruption problem.
> >>>>>>>>>
> >>>>>>>>> Now we extend the quarantine to support both generic and tag-based kasan.
> >>>>>>>>> For tag-based kasan, the quarantine stores only freed object information
> >>>>>>>>> to check if an object is freed recently. When tag-based kasan reports an
> >>>>>>>>> error, we can check if the tagged addr is in the quarantine and make a
> >>>>>>>>> good guess if the object is more like "use-after-free" or "out-of-bound".
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> We already have all the information and don't need the quarantine to make such guess.
> >>>>>>>> Basically if shadow of the first byte of object has the same tag as tag in pointer than it's out-of-bounds,
> >>>>>>>> otherwise it's use-after-free.
> >>>>>>>>
> >>>>>>>> In pseudo-code it's something like this:
> >>>>>>>>
> >>>>>>>> u8 object_tag = *(u8 *)kasan_mem_to_shadow(nearest_object(cacche, page, access_addr));
> >>>>>>>>
> >>>>>>>> if (access_addr_tag == object_tag && object_tag != KASAN_TAG_INVALID)
> >>>>>>>>   // out-of-bounds
> >>>>>>>> else
> >>>>>>>>   // use-after-free
> >>>>>>>
> >>>>>>> Thanks your explanation.
> >>>>>>> I see, we can use it to decide corruption type.
> >>>>>>> But some use-after-free issues, it may not have accurate free-backtrace.
> >>>>>>> Unfortunately in that situation, free-backtrace is the most important.
> >>>>>>> please see below example
> >>>>>>>
> >>>>>>> In generic KASAN, it gets accurate free-backrace(ptr1).
> >>>>>>> In tag-based KASAN, it gets wrong free-backtrace(ptr2). It will make
> >>>>>>> programmer misjudge, so they may not believe tag-based KASAN.
> >>>>>>> So We provide this patch, we hope tag-based KASAN bug report is the same
> >>>>>>> accurate with generic KASAN.
> >>>>>>>
> >>>>>>> ---
> >>>>>>>     ptr1 = kmalloc(size, GFP_KERNEL);
> >>>>>>>     ptr1_free(ptr1);
> >>>>>>>
> >>>>>>>     ptr2 = kmalloc(size, GFP_KERNEL);
> >>>>>>>     ptr2_free(ptr2);
> >>>>>>>
> >>>>>>>     ptr1[size] = 'x';  //corruption here
> >>>>>>>
> >>>>>>>
> >>>>>>> static noinline void ptr1_free(char* ptr)
> >>>>>>> {
> >>>>>>>     kfree(ptr);
> >>>>>>> }
> >>>>>>> static noinline void ptr2_free(char* ptr)
> >>>>>>> {
> >>>>>>>     kfree(ptr);
> >>>>>>> }
> >>>>>>> ---
> >>>>>>>
> >>>>>> We think of another question about deciding by that shadow of the first
> >>>>>> byte.
> >>>>>> In tag-based KASAN, it is immediately released after calling kfree(), so
> >>>>>> the slub is easy to be used by another pointer, then it will change
> >>>>>> shadow memory to the tag of new pointer, it will not be the
> >>>>>> KASAN_TAG_INVALID, so there are many false negative cases, especially in
> >>>>>> small size allocation.
> >>>>>>
> >>>>>> Our patch is to solve those problems. so please consider it, thanks.
> >>>>>>
> >>>>> Hi, Andrey and Dmitry,
> >>>>>
> >>>>> I am sorry to bother you.
> >>>>> Would you tell me what you think about this patch?
> >>>>> We want to use tag-based KASAN, so we hope its bug report is clear and
> >>>>> correct as generic KASAN.
> >>>>>
> >>>>> Thanks your review.
> >>>>> Walter
> >>>>
> >>>> Hi Walter,
> >>>>
> >>>> I will probably be busy till the next week. Sorry for delays.
> >>>
> >>> It's ok. Thanks your kindly help.
> >>> I hope I can contribute to tag-based KASAN. It is a very important tool
> >>> for us.
> >>
> >> Hi, Dmitry,
> >>
> >> Would you have free time to discuss this patch together?
> >> Thanks.
> > 
> > Sorry for delays. I am overwhelm by some urgent work. I afraid to
> > promise any dates because the next week I am on a conference, then
> > again a backlog and an intern starting...
> > 
> > Andrey, do you still have concerns re this patch? This change allows
> > to print the free stack.
> 
> I 'm not sure that quarantine is a best way to do that. Quarantine is made to delay freeing, but we don't that here.
> If we want to remember more free stacks wouldn't be easier simply to remember more stacks in object itself?
> Same for previously used tags for better use-after-free identification.
> 

Hi Andrey,

We ever tried to use object itself to determine use-after-free
identification, but tag-based KASAN immediately released the pointer
after call kfree(), the original object will be used by another
pointer, if we use object itself to determine use-after-free issue, then
it has many false negative cases. so we create a lite quarantine(ring
buffers) to record recent free stacks in order to avoid those false
negative situations.

We hope to have one solution to cover all cases and be accurate. Our
patch is configurable feature option, it can provide some programmers to
easy see the tag-based KASAN report.


> > We also have a quarantine for hwasan in user-space. Though it works a
> > bit differently then the normal asan quarantine. We keep a per-thread
> > fixed-size ring-buffer of recent allocations:
> > https://github.com/llvm-mirror/compiler-rt/blob/master/lib/hwasan/hwasan_report.cpp#L274-L284
> > and scan these ring buffers during reports.
> > 

Thanks your information, it looks like the same idea with our patch.
