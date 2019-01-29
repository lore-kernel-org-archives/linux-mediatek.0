From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Tue, 29 Jan 2019 05:46:34 +0000
Message-ID: <0100016898251824-359bbfae-e32b-43a6-8c58-8811a7b24520-000000@email.amazonses.com>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com> <20190128122954.949c2e6699d6e5ef060a325c@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128122954.949c2e6699d6e5ef060a325c@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: miles.chen@mediatek.com, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 28 Jan 2019, Andrew Morton wrote:

> > When debugging slab errors in slub.c, sometimes we have to trigger
> > a panic in order to get the coredump file. Add a debug option
> > SLAB_WARN_ON_ERROR to toggle WARN_ON() when the option is set.
> >
> > Change since v1:
> > 1. Add a special debug option SLAB_WARN_ON_ERROR and toggle WARN_ON()
> > if it is set.
> > 2. SLAB_WARN_ON_ERROR can be set by kernel parameter slub_debug.
> >
>
> Hopefully the slab developers will have an opinion on this.

Debugging slab itself is usually done in kvm or some other virtualized
environment. Then gdb can be used to set breakpoints. Otherwise one may
add printks and stuff to the allocators to figure out more or use perf.

What you are changing here is the debugging for data corruption within
objects managed by slub or the metadata. Slub currently outputs extensive
data about the metadata corruption (typically caused by a user of
slab allocation) which should allow you to set a proper
breakpoint not in the allocator but in the subsystem where the corruption
occurs.
