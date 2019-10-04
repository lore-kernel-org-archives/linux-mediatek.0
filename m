From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6397: fix probe after changing mt6397-core
Date: Fri, 4 Oct 2019 16:20:01 +0100
Message-ID: <20191004152001.GS18429@dell>
References: <20191003185323.24646-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003185323.24646-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

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
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=164155
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/mfd/mt6397-core.c | 64 ++++++++++++++++++++++++---------------
>  1 file changed, 40 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 310dae26ddff..b2c325ead1c8 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -129,11 +129,27 @@ static int mt6397_irq_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
>  			mt6397_irq_resume);
>  
> +struct chip_data {
> +	u32 cid_addr;
> +	u32 cid_shift;
> +};
> +
> +static const struct chip_data mt6323_core = {
> +	.cid_addr = MT6323_CID,
> +	.cid_shift = 0,
> +};
> +
> +static const struct chip_data mt6397_core = {
> +	.cid_addr = MT6397_CID,
> +	.cid_shift = 0,
> +};

Will there be other devices which have a !0 CID shift?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
