From: Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH -next] [media] mtk-vcodec: remove redundant return value
 check of platform_get_resource()
Date: Fri, 10 Feb 2017 11:35:13 +0800
Message-ID: <1486697713.3862.6.camel@mtksdaap41>
References: <20170207151620.12711-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170207151620.12711-1-weiyj.lk@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2017-02-07 at 15:16 +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Acked-by:Tiffany Lin <tiffany.lin@mediatek.com>

> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index aa81f3c..83f859e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -269,11 +269,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  
>  	for (i = VENC_SYS, j = 0; i < NUM_MAX_VCODEC_REG_BASE; i++, j++) {
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, j);
> -		if (res == NULL) {
> -			dev_err(&pdev->dev, "get memory resource failed.");
> -			ret = -ENXIO;
> -			goto err_res;
> -		}
>  		dev->reg_base[i] = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR((__force void *)dev->reg_base[i])) {
>  			ret = PTR_ERR((__force void *)dev->reg_base[i]);
> 
> 
> 
