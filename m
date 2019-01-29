From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Tue, 29 Jan 2019 15:53:44 +0800
Message-ID: <1548748424.18511.34.camel@mtkswgap22>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
         <20190128122954.949c2e6699d6e5ef060a325c@linux-foundation.org>
         <0100016898251824-359bbfae-e32b-43a6-8c58-8811a7b24520-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0100016898251824-359bbfae-e32b-43a6-8c58-8811a7b24520-000000@email.amazonses.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Lameter <cl@linux.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-01-29 at 05:46 +0000, Christopher Lameter wrote:
> On Mon, 28 Jan 2019, Andrew Morton wrote:
> 
> > > When debugging slab errors in slub.c, sometimes we have to trigger
> > > a panic in order to get the coredump file. Add a debug option
> > > SLAB_WARN_ON_ERROR to toggle WARN_ON() when the option is set.
> > >
> > > Change since v1:
> > > 1. Add a special debug option SLAB_WARN_ON_ERROR and toggle WARN_ON()
> > > if it is set.
> > > 2. SLAB_WARN_ON_ERROR can be set by kernel parameter slub_debug.
> > >
> >
> > Hopefully the slab developers will have an opinion on this.
> 
> Debugging slab itself is usually done in kvm or some other virtualized
> environment. Then gdb can be used to set breakpoints. Otherwise one may
> add printks and stuff to the allocators to figure out more or use perf.
> 
> 
> What you are changing here is the debugging for data corruption within
> objects managed by slub or the metadata. Slub currently outputs extensive
> data about the metadata corruption (typically caused by a user of
> slab allocation) which should allow you to set a proper
> breakpoint not in the allocator but in the subsystem where the corruption
> occurs.
> 
Thanks for your comments. The real problems the change can help are:

a) classic slub issue. e.g., use-after-free, redzone overwritten. It's
more efficient to report a issue as soon as slub detects it. (comparing
to monitor the log, set a breakpoint, and re-produce the issue). With
the coredump file, we can analyze the issue.

b) memory corruption issues caused by h/w write. e.g., memory
overwritten by a DMA engine. Memory corruptions may or may not related
to the slab cache that reports any error. For example: kmalloc-256 or
dentry may report the same errors. If we can preserve the the coredump
file without any restore/reset processing in slub, we could have more
information of this memory corruption.

c) memory corruption issues caused by unstable h/w. e.g., bit flipping
because of xxxx DRAM die or applying new power settings. It's hard to
re-produce this kind of issue and it much easier to tell this kind of
issue in the coredump file without any restore/reset processing.

Users can set the option by slub_debug. We can still have the original
behavior(keep the system alive) if the option is not set. We can turn on
the option when we need the coredump file. (with panic_on_warn is set,
of course).
