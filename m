From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64/mm: fix virtual address boundary check
Date: Wed, 24 Feb 2016 16:19:44 +0000
Message-ID: <20160224161944.GJ4777@e104818-lin.cambridge.arm.com>
References: <1456329708-2042-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456329708-2042-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: miles.chen@mediatek.com
Cc: Will Deacon <will.deacon@arm.com>, srv_wsdupstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 25, 2016 at 12:01:48AM +0800, miles.chen@mediatek.com wrote:
> From: Miles Chen <miles.chen@mediatek.com>
> 
> The MODULES_VADDR is not the lowest possible
> kernel virtual address. TASK_SIZE_64 may be larger than
> MODULES_VADDR, FIXADDR_TOP, and PCI_IO_START.
> 
> Fix this by comparing TASK_SIZE_64 (highest user virtual address)
> with VA_START (lowest kernel virtual address).
> 
>  #define VA_BITS		(CONFIG_ARM64_VA_BITS)
>  #define VA_START		(UL(0xffffffffffffffff) << VA_BITS)
>  #define PAGE_OFFSET		(UL(0xffffffffffffffff) << (VA_BITS - 1))
>  #define MODULES_END		(PAGE_OFFSET)
>  #define MODULES_VADDR		(MODULES_END - SZ_64M)
>  #define PCI_IO_END		(MODULES_VADDR - SZ_2M)
>  #define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
>  #define FIXADDR_TOP		(PCI_IO_START - SZ_2M)
>  #define TASK_SIZE_64		(UL(1) << VA_BITS)

We should remove these checks altogether. There is a huge gap between
the user and kernel addresses that they would never overlap (we don't
have enough levels of page tables to cover 64-bit VA space).

-- 
Catalin
