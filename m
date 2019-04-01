From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 3/4] phy: socionext: get optional clock by devm_clk_get_optional()
Date: Mon, 01 Apr 2019 18:15:19 +0900
Message-ID: <20190401181519.2595.4A936039@socionext.com>
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com> <f3370a0619d40c40676ed029cc04a3ed1c12b991.1553914418.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f3370a0619d40c40676ed029cc04a3ed1c12b991.1553914418.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

This looks good to me.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thanks,

On Sat, 30 Mar 2019 17:11:37 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Use devm_clk_get_optional() to get optional clock
> 
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/socionext/phy-uniphier-usb3hs.c | 10 +++-------
>  drivers/phy/socionext/phy-uniphier-usb3ss.c | 10 +++-------
>  2 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> index b1b048be6166..50f379fc4e06 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> @@ -335,13 +335,9 @@ static int uniphier_u3hsphy_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->clk_parent))
>  		return PTR_ERR(priv->clk_parent);
>  
> -	priv->clk_ext = devm_clk_get(dev, "phy-ext");
> -	if (IS_ERR(priv->clk_ext)) {
> -		if (PTR_ERR(priv->clk_ext) == -ENOENT)
> -			priv->clk_ext = NULL;
> -		else
> -			return PTR_ERR(priv->clk_ext);
> -	}
> +	priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
> +	if (IS_ERR(priv->clk_ext))
> +		return PTR_ERR(priv->clk_ext);
>  
>  	priv->rst = devm_reset_control_get_shared(dev, "phy");
>  	if (IS_ERR(priv->rst))
> diff --git a/drivers/phy/socionext/phy-uniphier-usb3ss.c b/drivers/phy/socionext/phy-uniphier-usb3ss.c
> index 4be95679c7d8..ec231e40ef2a 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb3ss.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb3ss.c
> @@ -238,13 +238,9 @@ static int uniphier_u3ssphy_probe(struct platform_device *pdev)
>  		if (IS_ERR(priv->clk))
>  			return PTR_ERR(priv->clk);
>  
> -		priv->clk_ext = devm_clk_get(dev, "phy-ext");
> -		if (IS_ERR(priv->clk_ext)) {
> -			if (PTR_ERR(priv->clk_ext) == -ENOENT)
> -				priv->clk_ext = NULL;
> -			else
> -				return PTR_ERR(priv->clk_ext);
> -		}
> +		priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
> +		if (IS_ERR(priv->clk_ext))
> +			return PTR_ERR(priv->clk_ext);
>  
>  		priv->rst = devm_reset_control_get_shared(dev, "phy");
>  		if (IS_ERR(priv->rst))
> -- 
> 2.20.1

---
Best Regards,
Kunihiko Hayashi
