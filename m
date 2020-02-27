Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1C0C4BA35
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 01:33:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B9B24650
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 01:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLSreOXd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hVlI8Q9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B9B24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGPhMnnYWms9DY1NkbF9fvVOT7IBkVzDhwJBPR+oaY8=; b=NLSreOXdzAOeaK
	FvN8WGRMCZBzgQsGIJ2uAG6meJcmh8y+X3THrVYLi3StVlIgQVZm/oH6ZtP99WcqWO6BwXsms+CV9
	oqBCCfVfbNYJfikyakwAd/CIflHC5bAH0QtZ/gCao/pjpkSvHSTGNJ73xanvvOyX88Exr4h5t3nYR
	TxELOUsDBacr9og/sgd6lJMCsJI3kpMOPyJslUNO8Nny7fsdzRBbcIK3MUoc773MzCKdzq/ktfKaK
	JgoMPHuJQngwiXRs+3ALXUbYqSKBBH/3o4sChnGEnOJ6HN4PkApU+QEalI27mGAyH1pGn1+8Crexw
	M2dUXOCmtHb8PHqtDZkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7835-0001nA-It; Thu, 27 Feb 2020 01:33:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7832-0001lz-EX; Thu, 27 Feb 2020 01:33:09 +0000
X-UUID: 4fc7d9ee036b4ee89b53846e7a431099-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CIR9EL5zBnoh8nvfq5nySdNJ6R1FKWqVgskka9d0zdg=; 
 b=hVlI8Q9IQDCf1XeDabUC2Krh4oj6ec4N7a4HdlUrwEzDs2t+N0yPl+z0BSsjXftSiF/kLRJlRqMAm1SPlAoaQhDhTT4tchWiG+9tBYIkKYQ+3SqcHqaJgWdUutMn0CcbTeggntXOv0q1Nxh/lzQHcXO8pTrpGaQ3muFFeW7l4JQ=;
X-UUID: 4fc7d9ee036b4ee89b53846e7a431099-20200226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1420142595; Wed, 26 Feb 2020 17:33:07 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 17:33:05 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 09:32:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 09:30:45 +0800
Message-ID: <1582767184.20746.6.camel@mtksdaap41>
Subject: Re: [PATCH v9 4/4] drm/mediatek: Fix mediatek-drm device probing
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 09:33:04 +0800
In-Reply-To: <20200226105419.632771-5-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-5-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_173308_505448_6D6CEE7A 
X-CRM114-Status: GOOD (  22.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Wed, 2020-02-26 at 11:54 +0100, Enric Balletbo i Serra wrote:
> In the actual implementation the same compatible string
> "mediatek,<chip>-mmsys" is used to bind the clock drivers
> (drivers/soc/mediatek) as well as to the gpu driver
> (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
> that the only probed driver is the clock driver and there is no display
> at all.
> 
> In any case having the same compatible string for two drivers is not
> correct and should be fixed. To fix this, and maintain backward
> compatibility, we can consider that the mmsys driver is the top-level
> entry point for the multimedia subsystem, so is not a pure clock
> controller but a system controller, and the drm driver is instantiated
> by that MMSYS driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v9:
> - Do not move the display routing from the drm driver (CK)
> 
> Changes in v8:
> - New patch introduced in this series.
> 
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 34 ++++++++++++++------------
>  drivers/soc/mediatek/mt8173-mmsys.c    |  6 +++++
>  2 files changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b68837ea02b3..17f118ee0e57 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -422,9 +422,21 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	{ }
>  };
>  
> +static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt2701-mmsys",
> +	  .data = &mt2701_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt2712-mmsys",
> +	  .data = &mt2712_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8173-mmsys",
> +	  .data = &mt8173_mmsys_driver_data},
> +	{ }
> +};
> +
>  static int mtk_drm_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *phandle = dev->parent->of_node;
> +	const struct of_device_id *of_id;
>  	struct mtk_drm_private *private;
>  	struct device_node *node;
>  	struct component_match *match = NULL;
> @@ -435,15 +447,18 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  	if (!private)
>  		return -ENOMEM;
>  
> -	private->data = of_device_get_match_data(dev);
> +	of_id = of_match_node(mtk_drm_of_ids, phandle);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	private->data = of_id->data;
>  
> -	private->config_regs = syscon_node_to_regmap(dev->of_node);
> +	private->config_regs = syscon_node_to_regmap(phandle);
>  	if (IS_ERR(private->config_regs))
>  		return PTR_ERR(private->config_regs);
>  
>  	/* Iterate over sibling DISP function blocks */
> -	for_each_child_of_node(dev->of_node->parent, node) {
> -		const struct of_device_id *of_id;
> +	for_each_child_of_node(phandle->parent, node) {
>  		enum mtk_ddp_comp_type comp_type;
>  		int comp_id;
>  
> @@ -576,22 +591,11 @@ static int mtk_drm_sys_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>  			 mtk_drm_sys_resume);
>  
> -static const struct of_device_id mtk_drm_of_ids[] = {
> -	{ .compatible = "mediatek,mt2701-mmsys",
> -	  .data = &mt2701_mmsys_driver_data},
> -	{ .compatible = "mediatek,mt2712-mmsys",
> -	  .data = &mt2712_mmsys_driver_data},
> -	{ .compatible = "mediatek,mt8173-mmsys",
> -	  .data = &mt8173_mmsys_driver_data},
> -	{ }
> -};
> -
>  static struct platform_driver mtk_drm_platform_driver = {
>  	.probe	= mtk_drm_probe,
>  	.remove	= mtk_drm_remove,
>  	.driver	= {
>  		.name	= "mediatek-drm",
> -		.of_match_table = mtk_drm_of_ids,
>  		.pm     = &mtk_drm_pm_ops,
>  	},
>  };
> diff --git a/drivers/soc/mediatek/mt8173-mmsys.c b/drivers/soc/mediatek/mt8173-mmsys.c
> index 48e6c157d28e..c894db5b6ca9 100644
> --- a/drivers/soc/mediatek/mt8173-mmsys.c
> +++ b/drivers/soc/mediatek/mt8173-mmsys.c
> @@ -103,6 +103,7 @@ static int mt8173_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
>  	struct clk_onecell_data *clk_data;
> +	struct platform_device *drm;
>  	int ret;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> @@ -118,6 +119,11 @@ static int mt8173_mmsys_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> +					    PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
>  	return 0;
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
