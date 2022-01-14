Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E72C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uGjRlsH4S9aitM7/JvTDSGx+iEzP94w4atjwi0jh0g=; b=s6dgZ6LfR5QPPxs/MyIxLUflql
	N+/iSCgFB37R91f+ExJ/KT7n22rVl75tPdFV3OovNj6FoYM8RmmTHGYFB3MB5lhZP+8oZy4PcwR4r
	XUJMoFcX5p6BmMBSL5gkwcCpybXvswk4hbxbKsgSnfD4bV9b/PDU64gVys7YWYsAFq5Yx8PmA1kDr
	zl5enwnPlK4bR0y36QyHp54HI0yrh3x4JvT1an9igbChNcPk7Ya8CZ0+dBRwTyIbi78/eO7lF5WVF
	o3swLbADei8xk5TseBb+Tea8ZODvXpt5kTBMjmPiw1fj2XUuhEfcONPf3dwKR6cguka2G9RTeyt2d
	IUGCyjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8K0Y-008kSW-GN; Fri, 14 Jan 2022 10:40:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8K0V-008kRd-FV
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 10:40:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C17B71F467AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642156830;
 bh=j3GUVO0GVLNUEuI4Vg0aYnInOh0FyaOWtI5ryiIXgCE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F6Oe7lhdNyo6xhr0OgIZvLcFpPKOq8Nwn2H/llNDk4aN96vOdKjeaCpOHFBruZQK1
 eGBD6hbUeTXCmpfqja4ygRGlDZ0s/47yR8OCcHoQfehzrBh2gcEv8vVyiPz2XeONaw
 pE3qKwykC8nq7TIK+iVW41FDKxSQfLi/ftZPPdjlGTa4OARR104MinCFvPiekCF1P+
 pl1DhXgQla4AWFE/4OPa5xvchjDqlELEUHOgbtAdfM0wOt+t/DhP26+HAWkGvL7hfN
 n9Zz4GrQskaXPp2l6TI/p3LieuU9hwl7lgK2Eu4tN2U40eRe+6w7Hb7fi8JCZXx9k9
 pBeNOBLn2Y1mw==
Subject: Re: [PATCH v1 2/4] spi: spi-mtk-nor: improve device table for adding
 more capabilities
To: guochun.mao@mediatek.com, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-3-guochun.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <698a603b-574c-01ca-9e6b-edecdbc5959e@collabora.com>
Date: Fri, 14 Jan 2022 11:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114062408.9077-3-guochun.mao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_024031_871000_7101231E 
X-CRM114-Status: GOOD (  27.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/01/22 07:24, guochun.mao@mediatek.com ha scritto:
> From: Guochun Mao <guochun.mao@mediatek.com>

Hello Guochun,

thanks for the patch! However, I have some comments...

> 
> Define a structure for adding more capabilities.

Please also mention that you're adding the extra_dummy_bit feature
in the commit description.

> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> ---
>   drivers/spi/spi-mtk-nor.c | 40 +++++++++++++++++++++++++++++++--------
>   1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 5c93730615f8..f3bcdc1d4d8b 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -95,6 +95,11 @@
>   
>   #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
>   
> +struct mtk_nor_caps {
> +	u32 dma_bits;

dma_bits can be u8: I really don't think that we'll ever see more than
0xff bits...

> +	u32 extra_dummy_bit;

This one looks a bit strange, can you please add a comment explaining the
reason why we have this "extra dummy bit"?

> +};
> +
>   struct mtk_nor {
>   	struct spi_controller *ctlr;
>   	struct device *dev;
> @@ -109,6 +114,7 @@ struct mtk_nor {
>   	bool has_irq;
>   	bool high_dma;
>   	struct completion op_done;
> +	const struct mtk_nor_caps *caps;
>   };
>   
>   static inline void mtk_nor_rmw(struct mtk_nor *sp, u32 reg, u32 set, u32 clr)
> @@ -554,7 +560,12 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>   	}
>   
>   	// trigger op
> -	writel(prg_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
> +	if (rx_len)
> +		writel(prg_len * BITS_PER_BYTE + sp->caps->extra_dummy_bit,
> +		       sp->base + MTK_NOR_REG_PRG_CNT);
> +	else
> +		writel(prg_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
> +
>   	ret = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
>   			       prg_len * BITS_PER_BYTE);
>   	if (ret)
> @@ -743,9 +754,19 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
>   	.exec_op = mtk_nor_exec_op
>   };
>   
> +const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
> +	.dma_bits = 32,
> +	.extra_dummy_bit = 0,
> +};
> +
> +const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
> +	.dma_bits = 36,
> +	.extra_dummy_bit = 0,
> +};
> +
>   static const struct of_device_id mtk_nor_match[] = {
> -	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
> -	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
> +	{ .compatible = "mediatek,mt8173-nor", .data = &mtk_nor_caps_mt8173 },
> +	{ .compatible = "mediatek,mt8192-nor", .data = &mtk_nor_caps_mt8192 },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_nor_match);
> @@ -754,10 +775,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
>   {
>   	struct spi_controller *ctlr;
>   	struct mtk_nor *sp;
> +	struct mtk_nor_caps *caps;
>   	void __iomem *base;
>   	struct clk *spi_clk, *ctlr_clk, *axi_clk;
>   	int ret, irq;
> -	unsigned long dma_bits;
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
> @@ -775,9 +796,11 @@ static int mtk_nor_probe(struct platform_device *pdev)
>   	if (IS_ERR(axi_clk))
>   		return PTR_ERR(axi_clk);
>   
> -	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
> -	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
> -		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
> +	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
> +	if (dma_set_mask_and_coherent(&pdev->dev,
> +				      DMA_BIT_MASK(caps->dma_bits))) {

While you're at it, can you please also make this return the right value?
The function dma_set_mask_and_coherent() may return an error code, so it's
worth it to just return that.

P.S.: 83 columns is ok

	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(caps->dma_bits));
	if (ret) {

> +		dev_err(&pdev->dev, "failed to set dma mask(%u)\n",
> +			caps->dma_bits);
>   		return -EINVAL;
>   	}
>   
> @@ -808,7 +831,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
>   	sp->spi_clk = spi_clk;
>   	sp->ctlr_clk = ctlr_clk;
>   	sp->axi_clk = axi_clk;
> -	sp->high_dma = (dma_bits > 32);
> +	sp->caps = caps;
> +	sp->high_dma = caps->dma_bits > 32;
>   	sp->buffer = dmam_alloc_coherent(&pdev->dev,
>   				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
>   				&sp->buffer_dma, GFP_KERNEL);
> 

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
