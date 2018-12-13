From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64: kaslr: print PHYS_OFFSET in dump_kernel_offset()
Date: Thu, 13 Dec 2018 18:13:18 +0000
Message-ID: <20181213181317.GD18185@edgewater-inn.cambridge.arm.com>
References: <1544612209-13660-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544612209-13660-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, ard.biesheuvel@linaro.org
List-Id: linux-mediatek@lists.infradead.org

[+Ard because I'll basically go with his preference on this one]

On Wed, Dec 12, 2018 at 06:56:49PM +0800, Miles Chen wrote:
> When debug with kaslr, it is sometimes necessary to have PHYS_OFFSET to
> perform linear virtual address to physical address translation.
> Sometimes we're debugging with only few information such as a kernel log
> and a symbol file, print PHYS_OFFSET in dump_kernel_offset() for that case.
> 
> Tested by:
> echo c > /proc/sysrq-trigger
> [   11.996161] SMP: stopping secondary CPUs
> [   11.996732] Kernel Offset: 0x2522200000 from 0xffffff8008000000
> [   11.996881] PHYS_OFFSET: 0xffffffeb40000000
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  arch/arm64/kernel/setup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index f4fc1e0544b7..4b0e1231625c 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -388,6 +388,7 @@ static int dump_kernel_offset(struct notifier_block *self, unsigned long v,
>  	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && offset > 0) {
>  		pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
>  			 offset, KIMAGE_VADDR);
> +		pr_emerg("PHYS_OFFSET: 0x%llx\n", PHYS_OFFSET);
>  	} else {
>  		pr_emerg("Kernel Offset: disabled\n");
>  	}
> -- 
> 2.18.0
> 
