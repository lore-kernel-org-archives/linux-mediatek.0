From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH -next 09/15] thermal: rockchip: use devm_platform_ioremap_resource() to simplify code
Date: Fri, 04 Oct 2019 23:49:47 +0200
Message-ID: <6308452.QoXZFhLlpT@phil>
References: <20190904122939.23780-1-yuehaibing@huawei.com> <20190904122939.23780-10-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904122939.23780-10-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: miquel.raynal@bootlin.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, mmayer@broadcom.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, matthias.bgg@gmail.com, agross@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, marc.w.gonzalez@free.fr, mans@mansr.com, talel@amazon.com, jun.nie@linaro.org, shawnguo@kernel.org, phil@raspberrypi.org, gregkh@linuxfoundation.org, david.hernandezsanchez@st.com, horms+renesas@verge.net.au, wsa+renesas@sang-engineering.com, bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.
List-Id: linux-mediatek@lists.infradead.org

Am Mittwoch, 4. September 2019, 14:29:33 CEST schrieb YueHaibing:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/thermal/rockchip_thermal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 343c2f5..044e6eb 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1219,7 +1219,6 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct rockchip_thermal_data *thermal;
>  	const struct of_device_id *match;
> -	struct resource *res;
>  	int irq;
>  	int i;
>  	int error;
> @@ -1245,8 +1244,7 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>  	if (!thermal->chip)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	thermal->regs = devm_ioremap_resource(&pdev->dev, res);
> +	thermal->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(thermal->regs))
>  		return PTR_ERR(thermal->regs);
>  
> 
