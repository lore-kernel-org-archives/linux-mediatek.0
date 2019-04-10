From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
Date: Wed, 10 Apr 2019 10:18:47 +0200
Message-ID: <ece510f7d393e4b04c920e88968e9bb41cde6b14.camel@baylibre.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
         <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-04-10 at 14:13 +0800, Chunfeng Yun wrote:
> Use devm_clk_get_optional() to get optional clock
> 
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> v2: add Acked-by Martin Blumenstingl
> ---
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 148ef0bdb9c1..4cbee412f2b0 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -261,14 +261,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
>  
> -	priv->clk = devm_clk_get(dev, "phy");
> -	if (IS_ERR(priv->clk)) {
> -		ret = PTR_ERR(priv->clk);
> -		if (ret == -ENOENT)
> -			priv->clk = NULL;
> -		else
> -			return ret;
> -	}
> +	priv->clk = devm_clk_get_optional(dev, "phy");
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
>  
>  	priv->reset = devm_reset_control_get_optional_shared(dev, "phy");
>  	if (IS_ERR(priv->reset))
