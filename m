From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: trap illegal translations in __virt_to_phys()
Date: Tue, 8 Jan 2019 12:14:41 +0000
Message-ID: <20190108121440.GC29102@lakrids.cambridge.arm.com>
References: <1546860080-13027-1-git-send-email-miles.chen@mediatek.com>
 <20190107150019.GC46743@lakrids.cambridge.arm.com>
 <1546917883.6754.8.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546917883.6754.8.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 08, 2019 at 11:24:43AM +0800, Miles Chen wrote:
> On Mon, 2019-01-07 at 15:00 +0000, Mark Rutland wrote:
> > On Mon, Jan 07, 2019 at 07:21:20PM +0800, Miles Chen wrote:
> > > Current __virt_to_phys() only print warning messages for non-linear
> > > addresses. It's hard to catch all warnings by those messages.
> > 
> > Why? Are you seeing a large number of warnings somewhere?
> 
> Official kernel works fine. I saw some cases in our internal branch and
> we're fixing them.
> 
> > 
> > > So add a VIRTUAL_BUG_ON() to trap all non-linear and non-symbol
> > > addresses (e.g., stack addresses)
> > > 
> > > Tested by pass stack addresses and symbol addresses to __pa(). Result:
> > > stack addresses: kernel BUG()
> > 
> > Either:
> > 
> > * Stacks are vmap'd, and __is_lm_address(stack_addr) is false. We'll
> >   produce a WARNING() today (and return a junk physical address).
> > 
> > * Stacks are linear mapped, and cannot be distinguished from other
> >   linear mapped addresses. The physical address will be valid.
> > 
> > ... so I don't understand why you need to change this.
> 
> For the first case: for vmap'd stack, __pa() returns a junk
> physical address and it might be easier to debug this incorrect address
> translation by a BUG() call instead of monitoring the warning log.

I think that's an argument for upgrading the existing WARN() to a BUG(),
rather than adding a separate VIRTUAL_BUG_ON().

However, there are cases where the junk physical address is not used to
perform an access, and the WARN() is more helpful.

You can set panic_on_warn to get an immediate panic() when the WARN()
fires. Is there some reason that approach doesn't work for you?

Thanks,
Mark.
