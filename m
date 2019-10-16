From: lee.jones@linaro.org (Lee Jones)
Date: Wed, 16 Oct 2019 10:53:38 +0100
Subject: [PATCH] mfd: mt6397: fix probe after changing mt6397-core
In-Reply-To: <20191003185323.24646-1-frank-w@public-files.de>
References: <20191003185323.24646-1-frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org
Message-ID: <20191016095338.GD4365@dell>
To: linux-mediatek@lists.infradead.org

On Thu, 03 Oct 2019, Frank Wunderlich wrote:

> Part 3 from this series [1] was not merged due to wrong splitting
> and breaks mt6323 pmic on bananapi-r2
> 
> dmesg prints this line and at least switch is not initialized on bananapi-r2
> 
> mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0
> 
> this patch contains only the probe-changes and chip_data structs
> from original part 3 by Hsin-Hsiung Wang
> 
> Fixes: a4872e80ce7d2a1844328176dbf279d0a2b89bdb mfd: mt6397: Extract IRQ related code from core driver

I've fixed this line to use the standard formatting.

> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=164155
> 
> Signed-off-by: Frank Wunderlich <frank-w at public-files.de>
> ---
>  drivers/mfd/mt6397-core.c | 64 ++++++++++++++++++++++++---------------
>  1 file changed, 40 insertions(+), 24 deletions(-)

Applied, thanks.

-- 
Lee Jones [???]
Linaro Services Technical Lead
Linaro.org ? Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
