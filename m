Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 02:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+omjfoZKyK9OhvzYR3tMRrIoMAUsP36CdsK1N3292l4=; b=LD1jygNjBqHrRH
	YMzXcDEfcxvvIWgAMNkcOcEQzQr7QK9AD++ce8Ra/hI4WjwIlZwicxmjJl9jONbbR3tdNee3D0Krt
	ttVFrOMiOWUOKK9EohCgeWnLMZrJ+adJQK6t3HUTIRYaabbcF543ar0Nz+MBwbDqQkbeSkmb5uoM9
	dD6qz06CW3geRBWdOLu1njROT2Jn6MkX0NhrM50Z1W7wGqjbeJNJew1HPawAjvedcrSRBO3+rZPAz
	rEpcnhzvB4crVo2LZCeR0JJv5xeESsvDCmlT2adxhe4CJQkXFh14zH2CvqoqMSc+wMy6X/q5UMTSt
	jrLW+k23og2Q1IoR+gIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9HqN-00DHH5-5r; Mon, 17 Jan 2022 02:34:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9HqK-00DHGa-FM
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 02:34:02 +0000
X-UUID: aa6d7b2512284858b62b417c0724887c-20220116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vEGv9FKi6ZTbSEGH0cwjIijAUScGh3ANjMxvizIzLWQ=; 
 b=oP0JU5Y60e9FrGj0meS/xMJgsog0NBOGMoH8MTGdBkus0OpruLtkORiGDnKiKTcMQXyzNHp3L3NY3JZjPuSsvuIZmZKe13NGRjnECCUXMPj8W40IxE3RT3hpWFCvJZpg5HgNNkLCIE6suSZBEojnzUNA25SYLlnhNUJHSLXOMyk=;
X-UUID: aa6d7b2512284858b62b417c0724887c-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1621641283; Sun, 16 Jan 2022 19:33:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 18:30:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 10:30:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 10:30:04 +0800
Message-ID: <53b6b78f48728f5a802707375092911ffa407289.camel@mediatek.com>
Subject: Re: [PATCH v1 2/4] spi: spi-mtk-nor: improve device table for
 adding more capabilities
From: Guochun Mao <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, Bin Zhang
 <bin.zhang@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Mon, 17 Jan 2022 10:30:04 +0800
In-Reply-To: <698a603b-574c-01ca-9e6b-edecdbc5959e@collabora.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-3-guochun.mao@mediatek.com>
 <698a603b-574c-01ca-9e6b-edecdbc5959e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_183400_551974_2373EF98 
X-CRM114-Status: GOOD (  27.46  )
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

Hello Angelo,

Thanks for your comments.

On Fri, 2022-01-14 at 11:40 +0100, AngeloGioacchino Del Regno wrote:
> Il 14/01/22 07:24, guochun.mao@mediatek.com ha scritto:
> > From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Hello Guochun,
> 
> thanks for the patch! However, I have some comments...
> 
> > 
> > Define a structure for adding more capabilities.
> 
> Please also mention that you're adding the extra_dummy_bit feature
> in the commit description.
> 
> > 
> > +struct mtk_nor_caps {
> > +	u32 dma_bits;
> 
> dma_bits can be u8: I really don't think that we'll ever see more
> than
> 0xff bits...
> 

I'll fix it next version.

> > +	u32 extra_dummy_bit;
> 
> This one looks a bit strange, can you please add a comment explaining
> the
> reason why we have this "extra dummy bit"?
> 

This one is adding for mt8186, which extra_dummy_bit is set to be 1.
Due to the IP design, it need a extra_dummy bit when reading nor
flash's register(status/config...).

Do you think I should move the modification to another patch
"[PATCH v1 3/4]spi:spi-mtk-nor:add new soc mt8186 sopport" ?
Or I just add this comment here?

> > 
> >   	// trigger op
> > -	writel(prg_len * BITS_PER_BYTE, sp->base +
> > MTK_NOR_REG_PRG_CNT);
> > +	if (rx_len)
> > +		writel(prg_len * BITS_PER_BYTE + sp->caps-
> > >extra_dummy_bit,
> > +		       sp->base + MTK_NOR_REG_PRG_CNT);
> > +	else
> > +		writel(prg_len * BITS_PER_BYTE, sp->base +
> > MTK_NOR_REG_PRG_CNT);
> > +
> >   	ret = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
> >   			       prg_len * BITS_PER_BYTE);
> >   	if (ret)
> > @@ -743,9 +754,19 @@ static const struct spi_controller_mem_ops
> > mtk_nor_mem_ops = {
> >   	.exec_op = mtk_nor_exec_op
> >   };
> >   
> > +const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
> > +	.dma_bits = 32,
> > +	.extra_dummy_bit = 0,
> > +};
> > +
> > +const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
> > +	.dma_bits = 36,
> > +	.extra_dummy_bit = 0,
> > +};
> > +
> >   static const struct of_device_id mtk_nor_match[] = {
> > -	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
> > -	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
> > +	{ .compatible = "mediatek,mt8173-nor", .data =
> > &mtk_nor_caps_mt8173 },
> > +	{ .compatible = "mediatek,mt8192-nor", .data =
> > &mtk_nor_caps_mt8192 },
> >   	{ /* sentinel */ }
>   };
> >   MODULE_DEVICE_TABLE(of, mtk_nor_match);
> > @@ -754,10 +775,10 @@ static int mtk_nor_probe(struct
> > platform_device *pdev)
> >   {
> >   	struct spi_controller *ctlr;
> >   	struct mtk_nor *sp;
> > +	struct mtk_nor_caps *caps;
> >   	void __iomem *base;
> >   	struct clk *spi_clk, *ctlr_clk, *axi_clk;
> >   	int ret, irq;
> > -	unsigned long dma_bits;
> >   
> >   	base = devm_platform_ioremap_resource(pdev, 0);
> >   	if (IS_ERR(base))
> > @@ -775,9 +796,11 @@ static int mtk_nor_probe(struct
> > platform_device *pdev)
> >   	if (IS_ERR(axi_clk))
> >   		return PTR_ERR(axi_clk);
>   
> > -	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
> > -	if (dma_set_mask_and_coherent(&pdev->dev,
> > DMA_BIT_MASK(dma_bits))) {
> > -		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n",
> > dma_bits);
> > +	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev-
> > >dev);
> > +	if (dma_set_mask_and_coherent(&pdev->dev,
> > +				      DMA_BIT_MASK(caps->dma_bits))) {
> 
> While you're at it, can you please also make this return the right
> value?
> The function dma_set_mask_and_coherent() may return an error code, so
> it's
> worth it to just return that.
> 
> P.S.: 83 columns is ok
> 

ok, I'll fix it next version.
Thanks.

BR,
Guochun
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
