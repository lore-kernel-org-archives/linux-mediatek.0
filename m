From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 04/13] soc: mediatek: Refactor regulator control
Date: Wed, 28 Aug 2019 11:44:42 +0200
Message-ID: <1481942b-623f-69dc-6e21-da877968793e@gmail.com>
References: <1566983506-26598-1-git-send-email-weiyi.lu@mediatek.com>
 <1566983506-26598-5-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566983506-26598-5-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 28/08/2019 11:11, Weiyi Lu wrote:
> Put regulator enable and disable control in separate functions.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Applied to v5.4-next/soc
Thanks!

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index e97fc0e..aed540d 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -191,6 +191,22 @@ static int scpsys_domain_is_on(struct scp_domain *scpd)
>  	return -EINVAL;
>  }
>  
> +static int scpsys_regulator_enable(struct scp_domain *scpd)
> +{
> +	if (!scpd->supply)
> +		return 0;
> +
> +	return regulator_enable(scpd->supply);
> +}
> +
> +static int scpsys_regulator_disable(struct scp_domain *scpd)
> +{
> +	if (!scpd->supply)
> +		return 0;
> +
> +	return regulator_disable(scpd->supply);
> +}
> +
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>  {
>  	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
> @@ -201,11 +217,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	int ret, tmp;
>  	int i;
>  
> -	if (scpd->supply) {
> -		ret = regulator_enable(scpd->supply);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = scpsys_regulator_enable(scpd);
> +	if (ret < 0)
> +		return ret;
>  
>  	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++) {
>  		ret = clk_prepare_enable(scpd->clk[i]);
> @@ -273,8 +287,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  			clk_disable_unprepare(scpd->clk[i]);
>  	}
>  err_clk:
> -	if (scpd->supply)
> -		regulator_disable(scpd->supply);
> +	scpsys_regulator_disable(scpd);
>  
>  	dev_err(scp->dev, "Failed to power on domain %s\n", genpd->name);
>  
> @@ -333,8 +346,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++)
>  		clk_disable_unprepare(scpd->clk[i]);
>  
> -	if (scpd->supply)
> -		regulator_disable(scpd->supply);
> +	ret = scpsys_regulator_disable(scpd);
> +	if (ret < 0)
> +		goto out;
>  
>  	return 0;
>  
> 
