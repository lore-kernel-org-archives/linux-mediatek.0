From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] soc: mediatek: Handle return of of_match_device function
Date: Thu, 1 Feb 2018 12:59:46 +0100
Message-ID: <20180201115946.GU2809@piout.net>
References: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Himanshu Jha <himanshujha199640@gmail.com>
Cc: matthias.bgg@gmail.com, ulf.hansson@linaro.org, weiyi.lu@mediatek.com, geert+renesas@glider.be, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 01/02/2018 at 16:30:22 +0530, Himanshu Jha wrote:
> In scpsys_probe function, return value of of_match_device function which
> returns null is dereferenced without checking. Therefore, add a check for
> potential null dereference.
> 
> Detected by CoverityScan, CID#1424087 "Dereference null return value"
> 

No, this will never happen as the only way to probe this device is to
use device tree.

> Fixes: commit 53fddb1a66dd ("soc: mediatek: reduce code duplication of scpsys_probe across all SoCs")
> Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 435ce5e..6e7f196 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -981,6 +981,9 @@ static int scpsys_probe(struct platform_device *pdev)
>  	int i, ret;
>  
>  	match = of_match_device(of_scpsys_match_tbl, &pdev->dev);
> +	if (!match)
> +		return -EINVAL;
> +
>  	soc = (const struct scp_soc_data *)match->data;
>  
>  	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
