Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957CCC4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 08:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7E4207BC
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 08:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMq6VBLg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pFD6Tgrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7E4207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4X0wcR/NVO1yeNBZTWkib2TF71cbrDB8tp5YCOREGWg=; b=jMq6VBLg+6KecIoneBCItcG2Z
	flRgyDA+EHkAz23yjvgYXYrKf4MNL0OkkyQHaWQQsgqDQEZYyY6h2xEbCluDh35cqIHC2ZjG8osQQ
	uVV8vP7QwJRoH4VSkQYNnDihVyRBDd8sjxoJBM44jsP3JVySU2MjwghBCW6SYLv76d4EJgDgkRoGL
	xJGSHsaUmrwxjiNTLOCA7xTu7ACRc2UWPH6v8GTeELrWuMY2KV9FDvcCla6MQ3WsSCYpKT5GlHv1m
	7apRtRlR+gOuJSDjyTgg/3fep66y6ANxGxA81/NpK80FNONHEDKn+AhdGmVbCBI6kZZ50Az3KRELx
	28BYs9pgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMSIK-0000tI-4W; Sun, 27 Sep 2020 08:44:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMSIE-0000qn-Ki; Sun, 27 Sep 2020 08:44:27 +0000
X-UUID: ff70de38ce114d1988266fd8ede9dc75-20200927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Lner+8cIRgrg0cDNcBnnCq0acUspa7hUGg30bAeP/UE=; 
 b=pFD6Tgrfv5dopQXE62tIo5gn5ppuG6Rtmvj8zQD6GN2h25xzqH8nFvBMU6jwm4rffVhfJq4sWKt6yHmYEq3ZkGplUmLFNh/6rGVgB6GsYLNI2TQbIwy8nLXuqgMHAWLZdCSkirI35c2cQM6Tb2MnMoNoQLyamtDXPnTWvTtUigs=;
X-UUID: ff70de38ce114d1988266fd8ede9dc75-20200927
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 69201424; Sun, 27 Sep 2020 00:30:34 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 01:30:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 16:30:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Sep 2020 16:30:23 +0800
Message-ID: <1601195424.7766.4.camel@mtksdaap41>
Subject: Re: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Sun, 27 Sep 2020 16:30:24 +0800
In-Reply-To: <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_044426_848911_EF3A1BFE 
X-CRM114-Status: GOOD (  25.29  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-25 at 14:54 +0800, Ikjoon Jang wrote:
> This patch enables 36bit dma address support to spi-mtk-nor.
> Currently this is enabled only for mt8192-nor.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/spi/spi-mtk-nor.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 8dbafee7f431..35205635ed42 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -78,6 +78,8 @@
>  #define MTK_NOR_REG_DMA_FADR		0x71c
>  #define MTK_NOR_REG_DMA_DADR		0x720
>  #define MTK_NOR_REG_DMA_END_DADR	0x724
> +#define MTK_NOR_REG_DMA_DADR_HB		0x738
> +#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
>  
>  /* maximum bytes of TX in PRG mode */
>  #define MTK_NOR_PRG_MAX_SIZE		6
> @@ -106,6 +108,7 @@ struct mtk_nor {
>  	unsigned int spi_freq;
>  	bool wbuf_en;
>  	bool has_irq;
> +	bool high_dma;
>  	struct completion op_done;
>  };
>  
> @@ -305,6 +308,11 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
>  	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
>  	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
>  
> +	if (sp->high_dma) {
> +		writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
> +		writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
> +	}
> +

Maybe use upper_32_bits() ?


>  	if (sp->has_irq) {
>  		reinit_completion(&sp->op_done);
>  		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
> @@ -635,7 +643,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
>  };
>  
>  static const struct of_device_id mtk_nor_match[] = {
> -	{ .compatible = "mediatek,mt8173-nor" },
> +	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
> +	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_nor_match);
> @@ -647,6 +656,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
>  	void __iomem *base;
>  	struct clk *spi_clk, *ctlr_clk;
>  	int ret, irq;
> +	unsigned long dma_bits;
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
> @@ -660,6 +670,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctlr_clk))
>  		return PTR_ERR(ctlr_clk);
>  
> +	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
> +	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
> +		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
> +		return -EINVAL;
> +	}
> +

As said in previous version. I don't see any place enable high_dma, so I
think this patch won't set >32bits for anychip. We need something like:

	sp->hidh_dma = dma_bits > 32;

Am I missing anything?

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
