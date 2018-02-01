From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] soc: mediatek: Handle return of of_match_device function
Date: Thu, 1 Feb 2018 15:02:38 +0000
Message-ID: <b8265d37-0ef0-9d24-8ace-8fae7f67477d@arm.com>
References: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Himanshu Jha <himanshujha199640@gmail.com>, matthias.bgg@gmail.com
Cc: ulf.hansson@linaro.org, weiyi.lu@mediatek.com, geert+renesas@glider.be, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 01/02/18 11:00, Himanshu Jha wrote:
> In scpsys_probe function, return value of of_match_device function which
> returns null is dereferenced without checking. Therefore, add a check for
> potential null dereference.
> 
> Detected by CoverityScan, CID#1424087 "Dereference null return value"
> 
> Fixes: commit 53fddb1a66dd ("soc: mediatek: reduce code duplication of scpsys_probe across all SoCs")
> Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
> ---
>   drivers/soc/mediatek/mtk-scpsys.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 435ce5e..6e7f196 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -981,6 +981,9 @@ static int scpsys_probe(struct platform_device *pdev)
>   	int i, ret;
>   
>   	match = of_match_device(of_scpsys_match_tbl, &pdev->dev);
> +	if (!match)
> +		return -EINVAL;
> +
>   	soc = (const struct scp_soc_data *)match->data;

You could of course replace the whole sequence with an 
of_device_get_match_data() call, which happens to be inherently safe 
against the no-match case even when that *is* impossible by design.

Robin.

>   
>   	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
> 
