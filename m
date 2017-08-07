From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64: correct modules range of kernel virtual memory
 layout
Date: Mon, 7 Aug 2017 14:16:09 +0100
Message-ID: <20170807131608.GA18817@arm.com>
References: <1502103886-19725-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502103886-19725-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, ard.biesheuvel@linaro.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Aug 07, 2017 at 07:04:46PM +0800, Miles Chen wrote:
> The commit f80fb3a3d508 ("arm64: add support for kernel ASLR")
> moved module virtual address to
> [module_alloc_base, module_alloc_base + MODULES_VSIZE).
> 
> Display module information of the virtual kernel
> memory layout by using module_alloc_base.
> 
> testing output:
> 1) Current implementation:
> Virtual kernel memory layout:
> 	modules : 0xffffff8000000000 - 0xffffff8008000000   (   128 MB)
> 2) this patch + KASLR:
> Virtual kernel memory layout:
> 	modules : 0xffffff8000560000 - 0xffffff8008560000   (   128 MB)
> 3) this patch + KASLR and a dummy seed:
> Virtual kernel memory layout:
> 	modules : 0xffffffa7df637000 - 0xffffffa7e7637000   (   128 MB)
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  arch/arm64/mm/init.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Does this mean the modules code in our pt dumper is busted
(arch/arm64/mm/dump.c)? Also, what about KASAN, which uses these addresses
too (in kasan_init)? Should we just remove MODULES_VADDR and MODULES_END
altogether?

Will
