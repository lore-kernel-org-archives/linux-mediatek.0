Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F89ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqvnv8VRklFbKc3eYxiCCyYiO2CuyYJGvRBp/25bN94=; b=b9TJvMCe6N2g451BYiP13XYxGu
	iK0T4MV3LDEAMWYdmvugO8aBy6kH5MKmIZmlnOfhjIf4ZcTzjmtLpkjvamyzoNBaFNwXLqZIP01Fb
	8M2EE5tjjNfhL/FpLRj5yYdSS3z4hbwqZfvYz4I+tv0T33x3gWnvyskYuGzA8VJKn8vhL+wpffbt6
	g+HWlUEytmY+N3hJtTY/Dzv36gm/q/RSFz/wuJjjV4ZkUME1zEhBpNHD9OCmJ2mxTOqvMw6mde3g1
	lPYmb6LdDofxahWESxxlXtzw+cYTrrliVvPJyA0R8KlVm3TJMqmwl3zFOEoqrOJCkXDexIZueHtqa
	MF/jqxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVuq-000teo-CL; Fri, 26 Aug 2022 09:46:16 +0000
Received: from smtp-20.smtpout.orange.fr ([80.12.242.20] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVul-000tU3-Up
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 09:46:14 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id RVuXoLYFLC5LCRVuXojhaU; Fri, 26 Aug 2022 11:46:04 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 26 Aug 2022 11:46:04 +0200
X-ME-IP: 90.11.190.129
Message-ID: <eba77c0f-7c1a-ad09-eca0-529e59c7f6ed@wanadoo.fr>
Date: Fri, 26 Aug 2022 11:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V13,3/7] mtk-jpegenc: support jpegenc multi-hardware
Content-Language: en-US
To: irui.wang@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 hverkuil-cisco@xs4all.nl, kyrie.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 nicolas.dufresne@collabora.com, robh+dt@kernel.org, tfiga@chromium.org,
 tzungbi@chromium.org, wenst@chromium.org, xia.jiang@mediatek.com
References: <20220826092956.10340-1-irui.wang@mediatek.com>
 <20220826092956.10340-4-irui.wang@mediatek.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220826092956.10340-4-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_024612_160445_84641ED1 
X-CRM114-Status: GOOD (  18.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Le 26/08/2022 à 11:29, Irui Wang a écrit :
> From: kyrie wu <kyrie.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> support jpeg encode multi-hardware includes HW0 and HW1.
> 
> Signed-off-by: kyrie wu <kyrie.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: irui wang <irui.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/media/platform/mediatek/jpeg/Makefile |  11 +-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  67 +++----
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  37 ++++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 163 ++++++++++++++++++
>   4 files changed, 245 insertions(+), 33 deletions(-)

[...]

> static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	int ret;
> +
> +	dev->jpegenc_irq = platform_get_irq(pdev, 0);
> +	if (dev->jpegenc_irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq resource");

Hi,

Should there be a v14, this dev_err() is useless.
platform_get_irq() already prints a more informative message.

> +		return dev->jpegenc_irq;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev,
> +			       dev->jpegenc_irq,
> +			       mtk_jpegenc_hw_irq_handler,
> +			       0,
> +			       pdev->name, dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
> +			dev->jpegenc_irq, ret);
> +		return -ENOENT;

Why not propagate 'ret' here?

> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
> +{
> +	struct mtk_jpegenc_clk *jpegenc_clk;
> +	struct mtk_jpeg_dev *master_dev;
> +	struct mtk_jpegenc_comp_dev *dev;
> +	int ret, i;
> +
> +	struct device *decs = &pdev->dev;
> +
> +	if (!decs->parent)
> +		return -EPROBE_DEFER;
> +
> +	master_dev = dev_get_drvdata(decs->parent);
> +	if (!master_dev)
> +		return -EPROBE_DEFER;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->plat_dev = pdev;
> +	dev->dev = &pdev->dev;
> +
> +	if (!master_dev->is_jpgenc_multihw) {
> +		master_dev->is_jpgenc_multihw = true;
> +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
> +			master_dev->enc_hw_dev[i] = NULL;
> +	}
> +
> +	jpegenc_clk = &dev->venc_clk;
> +
> +	jpegenc_clk->clk_num = devm_clk_bulk_get_all(&pdev->dev,
> +						     &jpegenc_clk->clks);
> +	if (jpegenc_clk->clk_num < 0)
> +		return dev_err_probe(&pdev->dev, jpegenc_clk->clk_num,
> +				     "Failed to get jpegenc clock count\n");
> +
> +	dev->reg_base =
> +		devm_platform_ioremap_resource(pdev, 0);

This can be written on 1 line only.

just my 2c,

CJ

> +	if (IS_ERR(dev->reg_base))
> +		return PTR_ERR(dev->reg_base);
> +
> +	ret = mtk_jpegenc_hw_init_irq(dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +		if (master_dev->enc_hw_dev[i])
> +			continue;
> +
> +		master_dev->enc_hw_dev[i] = dev;
> +		master_dev->reg_encbase[i] = dev->reg_base;
> +		dev->master_dev = master_dev;
> +	}
> +
> +	platform_set_drvdata(pdev, dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_jpegenc_hw_driver = {
> +	.probe = mtk_jpegenc_hw_probe,
> +	.driver = {
> +		.name = "mtk-jpegenc-hw",
> +		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
> +	},
> +};
> +
> +module_platform_driver(mtk_jpegenc_hw_driver);
> +
> +MODULE_DESCRIPTION("MediaTek JPEG encode HW driver");
> +MODULE_LICENSE("GPL");


