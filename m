From: Will Deacon <will.deacon@arm.com>
Subject: Re: [RFC/PATCH v2] arm64: define MODULES_VADDR by module_alloc_base
Date: Wed, 23 Aug 2017 17:27:32 +0100
Message-ID: <20170823162732.GD32528@arm.com>
References: <1502788166-25730-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502788166-25730-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, Aug 15, 2017 at 05:09:26PM +0800, Miles Chen wrote:
> After the kernel ASLR, the module virtual address is moved to
> [module_alloc_base, module_alloc_base + MODULES_VSIZE).
> However, the MODULES_VADDR is still defined as a constant and functions
> like is_vmalloc_or_module_addr() and dump function will not able to
> use correct module range information.
> 
> Use module_alloc_base to define MODULES_VADDR. I tested the patch under
> three different conditions:
> 1.CONFIG_RANDOMIZE_BASE=y, seed=0, CONFIG_KASAN=n
> 2.CONFIG_RANDOMIZE_BASE=y, seed=0x2304909023333333, CONFIG_KASAN=n
> 3.CONFIG_RANDOMIZE_BASE=y, seed=0x2304909023333333, CONFIG_KASAN=y
> 
> test log:
> 
> 1.CONFIG_RANDOMIZE_BASE=y, seed=0, CONFIG_KASAN=n
> 
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     modules : 0xffffff8000550000 - 0xffffff8008550000   (   128 MB)

Minor nit: but it might be worth putting this after the vmalloc line in
the case where they overlap.

> [    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   250 GB)
> [    0.000000]       .text : 0xffffff8008080000 - 0xffffff8008550000   (  4928 KB)
> [    0.000000]     .rodata : 0xffffff8008550000 - 0xffffff80086a0000   (  1344 KB)
> [    0.000000]       .init : 0xffffff80086a0000 - 0xffffff8008a30000   (  3648 KB)
> [    0.000000]       .data : 0xffffff8008a30000 - 0xffffff8008ab9200   (   549 KB)
> [    0.000000]        .bss : 0xffffff8008ab9200 - 0xffffff8008b0b238   (   329 KB)
> [    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4108 KB)
> [    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (    16 MB)
> [    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (     4 GB maximum)
> [    0.000000]               0xffffffbf00000000 - 0xffffffbf02000000   (    32 MB actual)
> [    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc080000000   (  2048 MB)
> 
> \# cat kernel_page_tables
> ---[ Modules start ]---
> ---[ Modules end ]---


I still reckon we should just omit talking about the modules area at all
for the cases where they're mapped entirely within vmalloc here.

Will
