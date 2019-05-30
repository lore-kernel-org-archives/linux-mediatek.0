From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH] kasan: add memory corruption identification for
 software tag-based mode
Date: Thu, 30 May 2019 09:58:02 +0800
Message-ID: <1559181482.24427.18.camel@mtksdccf07>
References: <1559027797-30303-1-git-send-email-walter-zh.wu@mediatek.com>
         <CACT4Y+aCnODuffR7PafyYispp_U+ZdY1Dr0XQYvmghkogLJzSw@mail.gmail.com>
         <1559122529.17186.24.camel@mtksdccf07>
         <CACT4Y+ZwXsBk8VqvDOJGMqrbVjuZ-HfC9RG4LpgRC-9WqmQJVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACT4Y+ZwXsBk8VqvDOJGMqrbVjuZ-HfC9RG4LpgRC-9WqmQJVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, Miles Chen <miles.chen@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-05-29 at 12:00 +0200, Dmitry Vyukov wrote:
> > > There can be multiple qobjects in the quarantine associated with the
> > > address, right? If so, we need to find the last one rather then a
> > > random one.
> > >
> > The qobject includes the address which has tag and range, corruption
> > address must be satisfied with the same tag and within object address
> > range, then it is found in the quarantine.
> > It should not easy to get multiple qobjects have the same tag and within
> > object address range.
> 
> Yes, using the tag for matching (which I missed) makes the match less likely.
> 
> But I think we should at least try to find the newest object in
> best-effort manner.
We hope it, too.

> Consider, both slab and slub reallocate objects in LIFO manner and we
> don't have a quarantine for objects themselves. So if we have a loop
> that allocates and frees an object of same size a dozen of times.
> That's enough to get a duplicate pointer+tag qobject.
> This includes:
> 1. walking the global quarantine from quarantine_tail backwards.
It is ok.

> 2. walking per-cpu lists in the opposite direction: from tail rather
> then from head. I guess we don't have links, so we could change the
> order and prepend new objects from head.
> This way we significantly increase chances of finding the right
> object. This also deserves a comment mentioning that we can find a
> wrong objects.
> 
The current walking per-cpu list direction is from head to trail. we
will modify the direction and find the newest object.


> > > Why don't we allocate qlist_object and qlist_node in a single
> > > allocation? Doing 2 allocations is both unnecessary slow and leads to
> > > more complex code. We need to allocate them with a single allocations.
> > > Also I think they should be allocated from a dedicated cache that opts
> > > out of quarantine?
> > >
> > Single allocation is good suggestion, if we only has one allocation.
> > then we need to move all member of qlist_object to qlist_node?
> >
> > struct qlist_object {
> >     unsigned long addr;
> >     unsigned int size;
> >     struct kasan_alloc_meta free_track;
> > };
> > struct qlist_node {
> >     struct qlist_object *qobject;
> >     struct qlist_node *next;
> > };
> 
> I see 2 options:
> 1. add addr/size/free_track to qlist_node under ifdef CONFIG_KASAN_SW_TAGS
> 2. or probably better would be to include qlist_node into qlist_object
> as first field, then allocate qlist_object and cast it to qlist_node
> when adding to quarantine, and then as we iterate quarantine, we cast
> qlist_node back to qlist_object and can access size/addr.
> 
Choice 2 looks better, We first try it.

> 
> > We call call ___cache_free() to free the qobject and qnode, it should be
> > out of quarantine?
> 
> This should work.

Thanks your good suggestion.
We will implement those solution which you suggested to the second
edition.


Thanks,
Walter
