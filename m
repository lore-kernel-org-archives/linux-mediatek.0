From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] arm64/mm: fix virtual address boundary check
Date: Thu, 25 Feb 2016 09:34:33 +0800
Message-ID: <1456364073.16470.8.camel@mtkswgap22>
References: <1456329708-2042-1-git-send-email-miles.chen@mediatek.com>
	 <20160224161944.GJ4777@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160224161944.GJ4777@e104818-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>, wsdupstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2016-02-24 at 16:19 +0000, Catalin Marinas wrote:
> On Thu, Feb 25, 2016 at 12:01:48AM +0800, miles.chen@mediatek.com wrote:
> > From: Miles Chen <miles.chen@mediatek.com>
> > 
> > The MODULES_VADDR is not the lowest possible
> > kernel virtual address. TASK_SIZE_64 may be larger than
> > MODULES_VADDR, FIXADDR_TOP, and PCI_IO_START.
> > 
> > Fix this by comparing TASK_SIZE_64 (highest user virtual address)
> > with VA_START (lowest kernel virtual address).
> > 
> >  #define VA_BITS		(CONFIG_ARM64_VA_BITS)
> >  #define VA_START		(UL(0xffffffffffffffff) << VA_BITS)
> >  #define PAGE_OFFSET		(UL(0xffffffffffffffff) << (VA_BITS - 1))
> >  #define MODULES_END		(PAGE_OFFSET)
> >  #define MODULES_VADDR		(MODULES_END - SZ_64M)
> >  #define PCI_IO_END		(MODULES_VADDR - SZ_2M)
> >  #define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
> >  #define FIXADDR_TOP		(PCI_IO_START - SZ_2M)
> >  #define TASK_SIZE_64		(UL(1) << VA_BITS)
> 
> We should remove these checks altogether. There is a huge gap between
> the user and kernel addresses that they would never overlap (we don't
> have enough levels of page tables to cover 64-bit VA space).
> 
Thanks for your reply. I confirmed that in the ARMv8 documentation. 
I'll send another patch to remove these checks.


Cheers,
Miles
