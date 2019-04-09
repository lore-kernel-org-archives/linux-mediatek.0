From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 01/14] [media] mtk-mipicsi: add mediatek mipicsi driver
 for mt2712
Date: Tue, 9 Apr 2019 14:12:43 +0800
Message-ID: <1554790363.10331.1.camel@mtksdaap41>
References: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
         <1554724505-19882-2-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554724505-19882-2-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Stu:

On Mon, 2019-04-08 at 19:54 +0800, Stu Hsieh wrote:
> This patch add mediatek mipicsi driver for mt2712,
> including probe function to get the value from device tree,
> and register to v4l2 the host device.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  drivers/media/platform/mtk-mipicsi/Makefile   |   4 +
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 768 ++++++++++++++++++
>  2 files changed, 772 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
>  create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> 

[snip]

> +
> +static const struct of_device_id mtk_mipicsi_of_match[] = {
> +	{ .compatible = "mediatek,mt2712-mipicsi", },

Where is the binding document of "mediatek,mt2712-mipicsi"?

Regards,
CK

> +	{},
> +};
> +
> +static struct platform_driver mtk_mipicsi_driver = {
> +	.driver		= {
> +		.name	= MTK_MIPICSI_DRV_NAME,
> +		.of_match_table = of_match_ptr(mtk_mipicsi_of_match),
> +	},
> +	.probe		= mtk_mipicsi_probe,
> +	.remove		= mtk_mipicsi_remove,
> +};
> +
> +module_platform_driver(mtk_mipicsi_driver);
> +MODULE_DESCRIPTION("MediaTek SoC Camera Host driver");
> +MODULE_LICENSE("GPL v2");
