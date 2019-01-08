From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] arm64: trap illegal translations in __virt_to_phys()
Date: Tue, 8 Jan 2019 11:24:43 +0800
Message-ID: <1546917883.6754.8.camel@mtkswgap22>
References: <1546860080-13027-1-git-send-email-miles.chen@mediatek.com>
 <20190107150019.GC46743@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190107150019.GC46743@lakrids.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: wsd_upstream@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-01-07 at 15:00 +0000, Mark Rutland wrote:
> On Mon, Jan 07, 2019 at 07:21:20PM +0800, Miles Chen wrote:
> > Current __virt_to_phys() only print warning messages for non-linear
> > addresses. It's hard to catch all warnings by those messages.
> 
> Why? Are you seeing a large number of warnings somewhere?

Official kernel works fine. I saw some cases in our internal branch and
we're fixing them.

> 
> > So add a VIRTUAL_BUG_ON() to trap all non-linear and non-symbol
> > addresses (e.g., stack addresses)
> > 
> > Tested by pass stack addresses and symbol addresses to __pa(). Result:
> > stack addresses: kernel BUG()
> 
> Either:
> 
> * Stacks are vmap'd, and __is_lm_address(stack_addr) is false. We'll
>   produce a WARNING() today (and return a junk physical address).
> 
> * Stacks are linear mapped, and cannot be distinguished from other
>   linear mapped addresses. The physical address will be valid.
> 
> ... so I don't understand why you need to change this.

For the first case: for vmap'd stack, __pa() returns a junk
physical address and it might be easier to debug this incorrect address
translation by a BUG() call instead of monitoring the warning log.

Like __phys_addr_symbol() does. __phys_addr_symbol() uses
VIRTUAL_BUG_ON() for non symbol addresses.

> 
> > symbol addresses: kernel warning message
> 
> That should already be the case today, since the kernel image is mapped
> separately from the linear map, so __is_lm_address(symbol_addr) should
> be false.
> 
> > 
> > Maybe we should trap all non-linear address translations in the future.
> > 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  arch/arm64/mm/physaddr.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
> > index 67a9ba9eaa96..f6b935dad19c 100644
> > --- a/arch/arm64/mm/physaddr.c
> > +++ b/arch/arm64/mm/physaddr.c
> > @@ -14,6 +14,11 @@ phys_addr_t __virt_to_phys(unsigned long x)
> >  	      (void *)x,
> >  	      (void *)x);
> >  
> > +	/* trap all non-linear and non-symbol addresses */
> > +	VIRTUAL_BUG_ON(!__is_lm_address(x) &&
> > +			(x < (unsigned long)KERNEL_START ||
> > +			 x > (unsigned long)KERNEL_END));
> 
> The KERNEL_START and KERNEL_END definitions refer to the kernel image,
> not the linear map, so it doesn't make any sense to permit those here.
> 
> It is *not* valid to call __virt_to_phys() with a symbol address. We
> only support those in __virt_to_phys_nodebug() so that broken code has a
> chance of stumbling on.
> 
> If you want the kernel to die immediately when it hits a warning here,
> please set panic_on_warn.
> 
> Thanks,
> Mark.
