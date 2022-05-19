Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xgb6xcFCIXcjEEuWjl8MLYPp0yDXyzxYkbbOZgFp7A=; b=V05fqWMelD+MTv
	XlMKbue2CDZARCG74opcgWoixQDenwxZpMJwWf/U5IgVSo+kyp2ItfCQTKHPl5qZyITfditOw2mBB
	UrOQRGJmkbauWRCF5E5MyOc8rWMxTOTCSzztOVWUUAXs3xLigtIGkDbhsOzTT1/5/ioZvyjceqeOB
	YLIZ8NaOuPz/UoI3jl+LJy2/uwnxJbeebpQMR+i6ApSXiJNqgUeAF8u28DP6tME0a/L9N1p3tZC3i
	OpYyRuXI8X3Pxp//4eW6vriNljsEiDNVzlhDmYR5JTa5LkAHeX/bFhHk4jDMNyPeHBT/n5UbrTHKh
	/AGYno+Zle5n8hU7N5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrkST-008lC8-4N; Thu, 19 May 2022 18:01:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrkSH-008lA5-OQ; Thu, 19 May 2022 18:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3798CB8277E;
 Thu, 19 May 2022 18:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5540FC385AA;
 Thu, 19 May 2022 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652983254;
 bh=tMwvvcFd7Pc3TDADnKu1IpLVMpBVRu1prfu10GKvoVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWIl28N9vBe+Kbo5ix6DGCxrW3rbrzUeJgHQN5Xz5xWmTOcJTRXjMf7CT5J08iuFE
 B4zaW/Fnn8X7I97NlUxtAFkBx7itzrexLh5vnMa2eBTPHJn3pHnR2i/UF+x9iFFoIm
 E/MpB7p/lirlqoqkK68qt3j9uHSDsc5J2AS06tsa3WDsSV9IKFprclElB8QtZXqe+Y
 Rx49V2RAcgWWw5BZQ2HCboxG5GcWUMbirDdnBZTIKjUWahMzdTtLLLWrGVWDM/nFeF
 bXxCgt8P2s1S+9ku6SmwtQK1FKqpWCMQa2Z9wjSEA8xHhCPFDZ3moCSzq7YXtIsifc
 VH5/8wpGKBsHA==
Date: Thu, 19 May 2022 23:30:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: Re: [PATCH v2 1/2] dmaengine: mediatek-cqdma: Add SoC-specific match
 data
Message-ID: <YoaF0mOudZ7zll/7@matsya>
References: <20220503140624.117213-1-angelogioacchino.delregno@collabora.com>
 <20220503140624.117213-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503140624.117213-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_110058_127106_DBECD404 
X-CRM114-Status: GOOD (  27.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03-05-22, 16:06, AngeloGioacchino Del Regno wrote:
> On some SoCs the DST2 and SRC2 registers may be at a different offset:
> add a match data structure and assign it to mt6765 as a preparation
> for adding support for more SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 35 +++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index f8847c48ba03..a2fb538d9483 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -48,8 +48,6 @@
>  #define MTK_CQDMA_DST			0x20
>  #define MTK_CQDMA_LEN1			0x24
>  #define MTK_CQDMA_LEN2			0x28
> -#define MTK_CQDMA_SRC2			0x60
> -#define MTK_CQDMA_DST2			0x64
>  
>  /* Registers setting */
>  #define MTK_CQDMA_EN_BIT		BIT(0)
> @@ -126,9 +124,20 @@ struct mtk_cqdma_vchan {
>  	bool issue_synchronize;
>  };
>  
> +/**
> + * struct mtk_cqdma_plat_data - SoC specific parameters
> + * @reg_dst2:               dst2 register offset
> + * @reg_src2:               src2 register offset
> + */
> +struct mtk_cqdma_plat_data {
> +	u8 reg_src2;
> +	u8 reg_dst2;
> +};
> +
>  /**
>   * struct mtk_cqdma_device - The struct holding info describing CQDMA
>   *                          device
> + * @plat:                   SoC-specific platform data
>   * @ddev:                   An instance for struct dma_device
>   * @clk:                    The clock that device internal is using
>   * @dma_requests:           The number of VCs the device supports to
> @@ -137,6 +146,7 @@ struct mtk_cqdma_vchan {
>   * @pc:                     The pointer to all the underlying PCs
>   */
>  struct mtk_cqdma_device {
> +	const struct mtk_cqdma_plat_data *plat;
>  	struct dma_device ddev;
>  	struct clk *clk;
>  
> @@ -231,6 +241,8 @@ static int mtk_cqdma_hard_reset(struct mtk_cqdma_pchan *pc)
>  static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
>  			    struct mtk_cqdma_vdesc *cvd)
>  {
> +	struct mtk_cqdma_device *cqdma = to_cqdma_dev(cvd->ch);
> +
>  	/* wait for the previous transaction done */
>  	if (mtk_cqdma_poll_engine_done(pc, true) < 0)
>  		dev_err(cqdma2dev(to_cqdma_dev(cvd->ch)), "cqdma wait transaction timeout\n");
> @@ -243,17 +255,17 @@ static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
>  	/* setup the source */
>  	mtk_dma_set(pc, MTK_CQDMA_SRC, cvd->src & MTK_CQDMA_ADDR_LIMIT);
>  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	mtk_dma_set(pc, MTK_CQDMA_SRC2, cvd->src >> MTK_CQDMA_ADDR2_SHFIT);
> +	mtk_dma_set(pc, cqdma->plat->reg_src2, cvd->src >> MTK_CQDMA_ADDR2_SHFIT);
>  #else
> -	mtk_dma_set(pc, MTK_CQDMA_SRC2, 0);
> +	mtk_dma_set(pc, cqdma->plat->reg_src2, 0);
>  #endif
>  
>  	/* setup the destination */
>  	mtk_dma_set(pc, MTK_CQDMA_DST, cvd->dest & MTK_CQDMA_ADDR_LIMIT);
>  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	mtk_dma_set(pc, MTK_CQDMA_DST2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
> +	mtk_dma_set(pc, cqdma->plat->reg_dst2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
>  #else
> -	mtk_dma_set(pc, MTK_CQDMA_DST2, 0);
> +	mtk_dma_set(pc, cqdma->plat->reg_dst2, 0);
>  #endif
>  
>  	/* setup the length */
> @@ -740,8 +752,13 @@ static void mtk_cqdma_hw_deinit(struct mtk_cqdma_device *cqdma)
>  	pm_runtime_disable(cqdma2dev(cqdma));
>  }
>  
> +static const struct mtk_cqdma_plat_data cqdma_mt6765 = {
> +	.reg_dst2 = 0x64,
> +	.reg_src2 = 0x60,

Please use the macros instead of magic numbers here

> +};
> +
>  static const struct of_device_id mtk_cqdma_match[] = {
> -	{ .compatible = "mediatek,mt6765-cqdma" },
> +	{ .compatible = "mediatek,mt6765-cqdma", .data = &cqdma_mt6765 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
> @@ -758,6 +775,10 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
>  	if (!cqdma)
>  		return -ENOMEM;
>  
> +	cqdma->plat = device_get_match_data(&pdev->dev);
> +	if (cqdma->plat)
> +		return -EINVAL;
> +
>  	dd = &cqdma->ddev;
>  
>  	cqdma->clk = devm_clk_get(&pdev->dev, "cqdma");
> -- 
> 2.35.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
