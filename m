From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 07/13] soc: mediatek: Refactor bus protection control
Date: Wed, 28 Aug 2019 12:28:37 +0200
Message-ID: <b7936307-fb0b-59e7-627f-98a13a22eb52@gmail.com>
References: <1566983506-26598-1-git-send-email-weiyi.lu@mediatek.com>
 <1566983506-26598-8-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566983506-26598-8-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 28/08/2019 11:11, Weiyi Lu wrote:
> Put bus protection enable and disable control in separate functions.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Applied to v5.4-next/soc

Thanks!

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 44 ++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index ad0f619..fb2b027 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -274,6 +274,30 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
>  			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>  }
>  
> +static int scpsys_bus_protect_enable(struct scp_domain *scpd)
> +{
> +	struct scp *scp = scpd->scp;
> +
> +	if (!scpd->data->bus_prot_mask)
> +		return 0;
> +
> +	return mtk_infracfg_set_bus_protection(scp->infracfg,
> +			scpd->data->bus_prot_mask,
> +			scp->bus_prot_reg_update);
> +}
> +
> +static int scpsys_bus_protect_disable(struct scp_domain *scpd)
> +{
> +	struct scp *scp = scpd->scp;
> +
> +	if (!scpd->data->bus_prot_mask)
> +		return 0;
> +
> +	return mtk_infracfg_clear_bus_protection(scp->infracfg,
> +			scpd->data->bus_prot_mask,
> +			scp->bus_prot_reg_update);
> +}
> +
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>  {
>  	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
> @@ -316,13 +340,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	if (ret < 0)
>  		goto err_pwr_ack;
>  
> -	if (scpd->data->bus_prot_mask) {
> -		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
> -				scpd->data->bus_prot_mask,
> -				scp->bus_prot_reg_update);
> -		if (ret)
> -			goto err_pwr_ack;
> -	}
> +	ret = scpsys_bus_protect_disable(scpd);
> +	if (ret < 0)
> +		goto err_pwr_ack;
>  
>  	return 0;
>  
> @@ -344,13 +364,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	u32 val;
>  	int ret, tmp;
>  
> -	if (scpd->data->bus_prot_mask) {
> -		ret = mtk_infracfg_set_bus_protection(scp->infracfg,
> -				scpd->data->bus_prot_mask,
> -				scp->bus_prot_reg_update);
> -		if (ret)
> -			goto out;
> -	}
> +	ret = scpsys_bus_protect_enable(scpd);
> +	if (ret < 0)
> +		goto out;
>  
>  	ret = scpsys_sram_disable(scpd, ctl_addr);
>  	if (ret < 0)
> 
