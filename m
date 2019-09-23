From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] media: platform: Use devm_platform_ioremap_resource() in
 two functions
Date: Mon, 23 Sep 2019 13:34:03 +0200
Message-ID: <20190923113403.GA14837@bigcity.dyn.berto.se>
References: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Markus,

Thanks for your patch.

On 2019-09-18 11:30:30 +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 11:20:48 +0200
> 
> Simplify these function implementations by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 +-------
>  drivers/media/platform/rcar-vin/rcar-core.c            | 7 +------

For rcar-vin:

Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 00d090df11bb..944771ee5f5c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -253,13 +253,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	}
> 
>  	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> -		if (res == NULL) {
> -			dev_err(&pdev->dev, "get memory resource failed.");
> -			ret = -ENXIO;
> -			goto err_res;
> -		}
> -		dev->reg_base[i] = devm_ioremap_resource(&pdev->dev, res);
> +		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
>  		if (IS_ERR((__force void *)dev->reg_base[i])) {
>  			ret = PTR_ERR((__force void *)dev->reg_base[i]);
>  			goto err_res;
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 6993484ff0f3..334c62805959 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1282,7 +1282,6 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *attr;
>  	struct rvin_dev *vin;
> -	struct resource *mem;
>  	int irq, ret;
> 
>  	vin = devm_kzalloc(&pdev->dev, sizeof(*vin), GFP_KERNEL);
> @@ -1301,11 +1300,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (attr)
>  		vin->info = attr->data;
> 
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (mem == NULL)
> -		return -EINVAL;
> -
> -	vin->base = devm_ioremap_resource(vin->dev, mem);
> +	vin->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vin->base))
>  		return PTR_ERR(vin->base);
> 
> --
> 2.23.0
> 

-- 
Regards,
Niklas Söderlund
