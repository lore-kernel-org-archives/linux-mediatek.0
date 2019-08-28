From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 06/13] soc: mediatek: Refactor sram control
Date: Wed, 28 Aug 2019 12:22:47 +0200
Message-ID: <d9462fa7-3395-347d-da44-8ff86713fd6d@gmail.com>
References: <1566983506-26598-1-git-send-email-weiyi.lu@mediatek.com>
 <1566983506-26598-7-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566983506-26598-7-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 28/08/2019 11:11, Weiyi Lu wrote:
> Put sram enable and disable control in separate functions.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Applied with the following changes made to your patch:

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ad0f6199cd0c..603262d547c3 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -236,7 +236,8 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void
__iomem *ctl_addr)
        u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
        int tmp;

-       val = readl(ctl_addr) & ~scpd->data->sram_pdn_bits;
+       val = readl(ctl_addr);
+       val &= ~scpd->data->sram_pdn_bits;
        writel(val, ctl_addr);

        /* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
@@ -265,7 +266,8 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void
__iomem *ctl_addr)
        u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
        int tmp;

-       val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
+       val = readl(ctl_addr);
+       vale |= scpd->data->sram_pdn_bits;
        writel(val, ctl_addr);

        /* Either wait until SRAM_PDN_ACK all 1 or 0 */
@@ -357,7 +359,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
                goto out;

        /* subsys power off */
-       val = readl(ctl_addr) | PWR_ISO_BIT;
+       val = readl(ctl_addr);
+       val |= PWR_ISO_BIT;
        writel(val, ctl_addr);

        val &= ~PWR_RST_B_BIT;

Hope that is OK for you (and I didn't made any mistake). If you see any problem,
please let me know.

Thanks,
Matthias

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 79 +++++++++++++++++++++++++--------------
>  1 file changed, 51 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 73e4a1a..ad0f619 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -230,12 +230,55 @@ static int scpsys_clk_enable(struct clk *clk[], int max_num)
>  	return ret;
>  }
>  
> +static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
> +{
> +	u32 val;
> +	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
> +	int tmp;
> +
> +	val = readl(ctl_addr) & ~scpd->data->sram_pdn_bits;
> +	writel(val, ctl_addr);
> +
> +	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
> +	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
> +		/*
> +		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
> +		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup
> +		 * is applied here.
> +		 */
> +		usleep_range(12000, 12100);
> +	} else {
> +		/* Either wait until SRAM_PDN_ACK all 1 or 0 */
> +		int ret = readl_poll_timeout(ctl_addr, tmp,
> +				(tmp & pdn_ack) == 0,
> +				MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
> +{
> +	u32 val;
> +	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
> +	int tmp;
> +
> +	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
> +	writel(val, ctl_addr);
> +
> +	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
> +	return readl_poll_timeout(ctl_addr, tmp,
> +			(tmp & pdn_ack) == pdn_ack,
> +			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +}
> +
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>  {
>  	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
>  	struct scp *scp = scpd->scp;
>  	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
> -	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>  	u32 val;
>  	int ret, tmp;
>  
> @@ -247,6 +290,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	if (ret)
>  		goto err_clk;
>  
> +	/* subsys power on */
>  	val = readl(ctl_addr);
>  	val |= PWR_ON_BIT;
>  	writel(val, ctl_addr);
> @@ -268,24 +312,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	val |= PWR_RST_B_BIT;
>  	writel(val, ctl_addr);
>  
> -	val &= ~scpd->data->sram_pdn_bits;
> -	writel(val, ctl_addr);
> -
> -	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
> -	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
> -		/*
> -		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
> -		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup is
> -		 * applied here.
> -		 */
> -		usleep_range(12000, 12100);
> -
> -	} else {
> -		ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == 0,
> -					 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> -		if (ret < 0)
> -			goto err_pwr_ack;
> -	}
> +	ret = scpsys_sram_enable(scpd, ctl_addr);
> +	if (ret < 0)
> +		goto err_pwr_ack;
>  
>  	if (scpd->data->bus_prot_mask) {
>  		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
> @@ -312,7 +341,6 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
>  	struct scp *scp = scpd->scp;
>  	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
> -	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>  	u32 val;
>  	int ret, tmp;
>  
> @@ -324,17 +352,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  			goto out;
>  	}
>  
> -	val = readl(ctl_addr);
> -	val |= scpd->data->sram_pdn_bits;
> -	writel(val, ctl_addr);
> -
> -	/* wait until SRAM_PDN_ACK all 1 */
> -	ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == pdn_ack,
> -				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +	ret = scpsys_sram_disable(scpd, ctl_addr);
>  	if (ret < 0)
>  		goto out;
>  
> -	val |= PWR_ISO_BIT;
> +	/* subsys power off */
> +	val = readl(ctl_addr) | PWR_ISO_BIT;
>  	writel(val, ctl_addr);
>  
>  	val &= ~PWR_RST_B_BIT;
> 
