From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH] arm64: kasan: fix phys_to_virt() false positive on
 tag-based kasan
Date: Mon, 19 Aug 2019 16:05:22 +0200
Message-ID: <CAAeHK+w7cTGN8SgWQs0bPjPOrizqfUoMnJWTvUkCqv17Qt=3oQ@mail.gmail.com>
References: <20190819114420.2535-1-walter-zh.wu@mediatek.com>
 <20190819125625.bu3nbrldg7te5kwc@willie-the-truck> <20190819132347.GB9927@lakrids.cambridge.arm.com>
 <20190819133441.ejomv6cprdcz7hh6@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819133441.ejomv6cprdcz7hh6@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Walter Wu <walter-zh.wu@mediatek.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, wsd_upstream@mediatek.com, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, linux-mediatek@lists.infradead.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Aug 19, 2019 at 3:34 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 19, 2019 at 02:23:48PM +0100, Mark Rutland wrote:
> > On Mon, Aug 19, 2019 at 01:56:26PM +0100, Will Deacon wrote:
> > > On Mon, Aug 19, 2019 at 07:44:20PM +0800, Walter Wu wrote:
> > > > __arm_v7s_unmap() call iopte_deref() to translate pyh_to_virt address,
> > > > but it will modify pointer tag into 0xff, so there is a false positive.
> > > >
> > > > When enable tag-based kasan, phys_to_virt() function need to rewrite
> > > > its original pointer tag in order to avoid kasan report an incorrect
> > > > memory corruption.
> > >
> > > Hmm. Which tree did you see this on? We've recently queued a load of fixes
> > > in this area, but I /thought/ they were only needed after the support for
> > > 52-bit virtual addressing in the kernel.
> >
> > I'm seeing similar issues in the virtio blk code (splat below), atop of
> > the arm64 for-next/core branch. I think this is a latent issue, and
> > people are only just starting to test with KASAN_SW_TAGS.
> >
> > It looks like the virtio blk code will round-trip a SLUB-allocated pointer from
> > virt->page->virt, losing the per-object tag in the process.
> >
> > Our page_to_virt() seems to get a per-page tag, but this only makes
> > sense if you're dealing with the page allocator, rather than something
> > like SLUB which carves a page into smaller objects giving each object a
> > distinct tag.
> >
> > Any round-trip of a pointer from SLUB is going to lose the per-object
> > tag.
>
> Urgh, I wonder how this is supposed to work?
>
> If we end up having to check the KASAN shadow for *_to_virt(), then why
> do we need to store anything in the page flags at all? Andrey?

As per 2813b9c0 ("kasan, mm, arm64: tag non slab memory allocated via
pagealloc") we should only save a non-0xff tag in page flags for non
slab pages.

Could you share your .config so I can reproduce this?
