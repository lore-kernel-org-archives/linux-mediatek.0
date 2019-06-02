From: David Miller <davem@davemloft.net>
Subject: Re: [RESEND, PATCH 1/4] net: stmmac: dwmac-mediatek: enable
 Ethernet power domain
Date: Sun, 02 Jun 2019 13:01:18 -0700 (PDT)
Message-ID: <20190602.130118.1624703340305098863.davem@davemloft.net>
References: <1559209398-3607-1-git-send-email-biao.huang@mediatek.com>
        <1559209398-3607-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559209398-3607-2-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: joabreu@synopsys.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com, andrew@lunn.ch
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Thu, 30 May 2019 17:43:15 +0800

> @@ -364,6 +371,15 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int mediatek_dwmac_remove(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = stmmac_pltfr_remove(pdev);
> +
> +	return ret;
> +}
> +
>  static const struct of_device_id mediatek_dwmac_match[] = {
>  	{ .compatible = "mediatek,mt2712-gmac",
>  	  .data = &mt2712_gmac_variant },
> @@ -374,7 +390,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>  
>  static struct platform_driver mediatek_dwmac_driver = {
>  	.probe  = mediatek_dwmac_probe,
> -	.remove = stmmac_pltfr_remove,
> +	.remove = mediatek_dwmac_remove,
>  	.driver = {
>  		.name           = "dwmac-mediatek",
>  		.pm		= &stmmac_pltfr_pm_ops,

This half of your patch has no effect and seems completely unnecessary.

Please remove it.
