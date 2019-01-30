From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2] mm/slub: introduce SLAB_WARN_ON_ERROR
Date: Wed, 30 Jan 2019 09:43:27 +0800
Message-ID: <1548812607.3832.11.camel@mtkswgap22>
References: <1548313223-17114-1-git-send-email-miles.chen@mediatek.com>
         <20190128122954.949c2e6699d6e5ef060a325c@linux-foundation.org>
         <0100016898251824-359bbfae-e32b-43a6-8c58-8811a7b24520-000000@email.amazonses.com>
         <1548748424.18511.34.camel@mtkswgap22>
         <010001689b25e696-3caebea9-56c2-46eb-bb49-34e504a123ee-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <010001689b25e696-3caebea9-56c2-46eb-bb49-34e504a123ee-000000@email.amazonses.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Lameter <cl@linux.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-01-29 at 19:46 +0000, Christopher Lameter wrote:
> On Tue, 29 Jan 2019, Miles Chen wrote:
> 
> > a) classic slub issue. e.g., use-after-free, redzone overwritten. It's
> > more efficient to report a issue as soon as slub detects it. (comparing
> > to monitor the log, set a breakpoint, and re-produce the issue). With
> > the coredump file, we can analyze the issue.
> 
> What usually happens is that the systems fails with a strange error
> message. Then the system is rebooted using slub_debug options and the
> issue is reproduced yielding more information about the problem.
> 
> Then you run the scenario again with additional debugging in the subsystem
> that caused the problem.

Thanks your comments and patient.

I now understand the difference between us.
I usually enable CONFIG_SLUB_DEBUG=y, CONFIG_SLUB_DEBUG_ON=y and setup
slub_debug by default and do all tests. (eng mode).
Not hit an issue first, then setup slub_debug and reproduce the issue
again.

CONFIG_SLUB_DEBUG is disabled for products.

> 
> So you are already reproducing the issue because you need to activate
> debugging to get more information. Doing it for the 3rd time is not that
> much more difficult.
> 
> None of your modifications will be active in a production kernel.
> slub_debug must be activated to use it and thus you are already
> reproducing the issue.
> 
> > b) memory corruption issues caused by h/w write. e.g., memory
> > overwritten by a DMA engine. Memory corruptions may or may not related
> > to the slab cache that reports any error. For example: kmalloc-256 or
> > dentry may report the same errors. If we can preserve the the coredump
> > file without any restore/reset processing in slub, we could have more
> > information of this memory corruption.
> 
> If debugging is active then reporting will include the accurate slab cache
> affected. The memory layout is already changing when you enable the
> existing debugging code. None of your code runs without that and thus is
> cannot add a coredump for the prod case without debugging.

I usually set slub_debug by default and get the coredump file.

> > c) memory corruption issues caused by unstable h/w. e.g., bit flipping
> > because of xxxx DRAM die or applying new power settings. It's hard to
> > re-produce this kind of issue and it much easier to tell this kind of
> > issue in the coredump file without any restore/reset processing.
> 
> But then you patch does not help in this situation because the code has to
> be enabled by special  slub debug options.
> 
> 
> > Users can set the option by slub_debug. We can still have the original
> > behavior(keep the system alive) if the option is not set. We can turn on
> > the option when we need the coredump file. (with panic_on_warn is set,
> > of course).
> 
> I think we would need to turn on debugging by default and have your patch
> for this to make sense. We already reproducing the issue multiple times
> for debugging. This patch does not change that.
> 
yes. I turn on the debugging by default. Does that make sense now?

Thanks again for your comments.
