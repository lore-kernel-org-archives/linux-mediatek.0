Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B23C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r13+3T1cuPT/NvV/ea1RC7nKkKUIMOp0oG+lRLT6dio=; b=GOVF0l6GcC5iwULmZRL0zpqGQ0
	FptO5tHH7SQUpZAjG866n5TCRMgfYdT9i5nhCrcn+fRoMQMMkGWhSvA0h5OG+K0WJNpoe6fWcWSDD
	Z0n/dguJLf1P5KtmbIFXWp9C4vvh3SjT2nJCcQAvlMUtjeLGGBho3imvJJr2/UMbuqsNXlMd6sqKz
	ONuurE2v7kX0tIyWzKsQq+ZXX11ijt2DU8Em9jbxrJ8GfrG8ZrVvD6/xgnblKJEjCpmNzTzrQ/Rhi
	albeslqxxab99dI7g3hJiS4d+PsXz33fJCECbg24QQevh7FTU8ilQCnlgTHDlbpsYXTckN5OMzJHI
	wgQ7yr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtqA-00HZF1-14;
	Thu, 11 Jan 2024 12:07:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtq6-00HZDF-28;
	Thu, 11 Jan 2024 12:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704974833;
	bh=K0uJ7jy/kaTCsxSmGNMbU68yzmO3jSPalrGrVWiv1Ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=imfcY9FQbdppGsKja1+CTe0sCrGWARfRdt8mxhZMmdnhkyaR1yRAw0qHc4tnE+gzD
	 SMFG4DKMKtOAykhi5cTc1dpYfy9pt4OEle9nGjfjZLaCYRSu3Oyg2CTRotdu5TJFfp
	 ONgwirr/dxPo66vIdGLCLSXDGoVSt530/Xnw9HUxR8U6NlX/NuJawCbpMSBpdaIvx8
	 WLdqAXCJwrNWOTaS5MD9w9sORhC8URzBI9eehTSFP8fMOCVYosoA2z+HaHQtx2Pl6t
	 wfuK5mxaOhBdz2l0HyAtR5ON1naz1IzkjN8ne3pVTlaZHJ1vYtHreAl55vFVYtDTRC
	 vZ6aGpkQdjevg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4751D3781184;
	Thu, 11 Jan 2024 12:07:12 +0000 (UTC)
Message-ID: <7643bfd6-5979-4ab4-bd8f-024417dc49ba@collabora.com>
Date: Thu, 11 Jan 2024 13:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-5-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240110141443.364655-5-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_040714_827654_9668E06C 
X-CRM114-Status: GOOD (  24.92  )
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

Il 10/01/24 15:14, Julien Stephan ha scritto:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This driver provides a path to bypass the SoC ISP so that image data
> coming from the SENINF can go directly into memory without any image
> processing. This allows the use of an external ISP.
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> [Paul Elder fix irq locking]
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   MAINTAINERS                                   |   1 +
>   .../platform/mediatek/isp/isp_30/Kconfig      |  19 +
>   .../platform/mediatek/isp/isp_30/Makefile     |   1 +
>   .../mediatek/isp/isp_30/camsv/Makefile        |   7 +
>   .../mediatek/isp/isp_30/camsv/mtk_camsv.c     | 328 ++++++++
>   .../mediatek/isp/isp_30/camsv/mtk_camsv.h     | 199 +++++
>   .../isp/isp_30/camsv/mtk_camsv30_hw.c         | 427 ++++++++++
>   .../isp/isp_30/camsv/mtk_camsv30_regs.h       |  60 ++
>   .../isp/isp_30/camsv/mtk_camsv_video.c        | 774 ++++++++++++++++++
>   9 files changed, 1816 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/Makefile
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv_video.c
> 
..snip..

> diff --git a/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> new file mode 100644
> index 000000000000..3b8ccdab2af0
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> @@ -0,0 +1,427 @@

..snip..

> +
> +static int mtk_camsv30_probe(struct platform_device *pdev)
> +{
> +	static const char * const clk_names[] = { "cam", "camtg", "camsv"};
> +
> +	struct mtk_cam_dev *cam_dev;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	int i;
> +
> +	if (!iommu_present(&platform_bus_type))
> +		return -EPROBE_DEFER;
> +
> +	cam_dev = devm_kzalloc(dev, sizeof(*cam_dev), GFP_KERNEL);
> +	if (!cam_dev)
> +		return -ENOMEM;
> +
> +	cam_dev->conf = of_device_get_match_data(dev);
> +	if (!cam_dev->conf)
> +		return -ENODEV;
> +
> +	cam_dev->dev = dev;
> +	dev_set_drvdata(dev, cam_dev);
> +
> +	cam_dev->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cam_dev->regs))
> +		return dev_err_probe(dev, PTR_ERR(cam_dev->regs),
> +				"failed to map register base\n");
> +
> +
> +	cam_dev->regs_img0 = devm_platform_ioremap_resource(pdev, 1);
> +
> +	if (IS_ERR(cam_dev->regs_img0))
> +		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_img0),
> +				"failed to map img0 register base\n");
> +
> +
> +	cam_dev->regs_tg = devm_platform_ioremap_resource(pdev, 2);
> +	if (IS_ERR(cam_dev->regs_tg))
> +		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_tg),
> +				"failed to map TG register base\n");
> +
> +
> +	cam_dev->num_clks = ARRAY_SIZE(clk_names);
> +	cam_dev->clks = devm_kcalloc(dev, cam_dev->num_clks,
> +				     sizeof(*cam_dev->clks), GFP_KERNEL);
> +	if (!cam_dev->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < cam_dev->num_clks; ++i)
> +		cam_dev->clks[i].id = clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, cam_dev->num_clks, cam_dev->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks: %i\n", ret);
> +
> +
> +	cam_dev->irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_irq(dev, cam_dev->irq,
> +			       isp_irq_camsv30, 0,
> +			       dev_name(dev), cam_dev);
> +	if (ret != 0)
> +		return dev_err_probe(dev, -ENODEV, "failed to request irq=%d\n",
> +				cam_dev->irq);
> +
> +	cam_dev->hw_functions = &mtk_camsv30_hw_functions;
> +
> +	spin_lock_init(&cam_dev->irqlock);
> +
> +	/* initialise runtime power management */
> +	pm_runtime_set_autosuspend_delay(dev, MTK_CAMSV30_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);

devm_pm_runtime_enable() ?

> +
> +	/* Initialize the v4l2 common part */
> +	return mtk_cam_dev_init(cam_dev);
> +}
> +
> +static int mtk_camsv30_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
> +
> +	mtk_cam_dev_cleanup(cam_dev);
> +	pm_runtime_put_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_camsv30_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(mtk_camsv30_runtime_suspend,
> +			   mtk_camsv30_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id mtk_camsv30_of_ids[] = {
> +	{ .compatible = "mediatek,mt8365-camsv", .data = &camsv30_conf },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_camsv30_of_ids);
> +
> +static struct platform_driver mtk_camsv30_driver = {
> +	.probe = mtk_camsv30_probe,
> +	.remove = mtk_camsv30_remove,

You definitely want to use void .remove_new() here

Cheers,
Angelo

