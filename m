Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2129C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06pgebU4CUQjU4NajEiYgbtzB9CvkUzNy4wRoZJJcqQ=; b=32ckxjb8JEjgKV
	+KdFEac3/k9Jcyv2zpXB2ocH1Of/1w+TRHFY2jAaC5Y93dR9hHy1k1Uy5cLKFyoVz77VsaVwtwp4m
	lbXPxkc6gWysJGWUvyKIRyK8SRfacFVQHUjvzrw0ren2nDgws7knK8BZ4GXptMFesIql5dVK26SvS
	o/vpNwnSyhLnfZ+xSib7Le0r3jKgzPxOSR3ou6590BJGu+NS6SXyLIbif0TM54QsdA2OuotqXkc13
	x5tobjcxvk+8omwamNm5L8m3FxSLXcUsHMk6/rBLw1ujIqF6mdnzbaBVZ44kuWItuNJTegdSlJYwP
	jbBPcrv1vXPrJIKB0X/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMZ3-00AJto-Ff; Fri, 29 Apr 2022 09:05:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMZ1-00AJs7-42; Fri, 29 Apr 2022 09:05:24 +0000
X-UUID: fae415992cd24df29a587a8aab13f1ed-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4dc9358e-7825-49e7-9c98-c2f63a80261d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b9c42b2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: fae415992cd24df29a587a8aab13f1ed-20220429
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 552634815; Fri, 29 Apr 2022 02:05:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:05:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 29 Apr 2022 17:05:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:05:11 +0800
Message-ID: <e413eebc2b4a48ba2e7119951e99f9823773c92a.camel@mediatek.com>
Subject: Re: [PATCH v18 07/21] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 29 Apr 2022 17:05:06 +0800
In-Reply-To: <20220428105408.11189-8-nancy.lin@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
 <20220428105408.11189-8-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_020523_218227_6A342ADF 
X-CRM114-Status: GOOD (  22.17  )
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

Hi, Nancy:

On Thu, 2022-04-28 at 18:53 +0800, Nancy.Lin wrote:
> MT8195 vdosys1 has more than 32 reset bits and a different reset base
> than other chips. Modify mmsys for support 64 bit and different reset
> base. Add the number of reset bits in mmsys private data and move the
> whole "reset register code section" behind the "get mmsys->data" code
> section for getting the num_resets in mmsys->data.

It's better to break this patch into two patches.

1. mmsys support 64 reset bits.
2. add mt8195 mmsys reset support.

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
>  drivers/soc/mediatek/mtk-mmsys.c    | 39 ++++++++++++++++++---------
> --
>  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
>  3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> index 5469073e3073..0a286fa5a824 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -139,6 +139,7 @@
>  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> 0xf68
>  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> 0
>  
> +#define MT8195_VDO1_SW0_RST_B		0x1d0
>  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
>  #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
>  #define MT8195_VDO1_HDR_TOP_CFG		0xd00
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 0315813b7df6..5fae31e3316f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,8 @@
>  #include "mt8195-mmsys.h"
>  #include "mt8365-mmsys.h"
>  
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt2701-mm",
>  	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> mt8173_mmsys_driver_data = {
>  	.routes = mmsys_default_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> mt8183_mmsys_driver_data = {
>  	.routes = mmsys_mt8183_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> mt8186_mmsys_driver_data = {
>  	.routes = mmsys_mt8186_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> @@ -148,6 +153,8 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys1_driver_data = {
>  	.clk_driver = "clk-mt8195-vdo1",
>  	.routes = mmsys_mt8195_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
> +	.num_resets = 64,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> @@ -234,18 +241,22 @@ static int mtk_mmsys_reset_update(struct
> reset_controller_dev *rcdev, unsigned l
>  {
>  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> rcdev);
>  	unsigned long flags;
> +	u32 offset;
>  	u32 reg;
>  
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
> +
>  	spin_lock_irqsave(&mmsys->lock, flags);
>  
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset +
> offset);
>  
>  	if (assert)
>  		reg &= ~BIT(id);
>  	else
>  		reg |= BIT(id);
>  
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset +
> offset);
>  
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
>  
> @@ -358,18 +369,6 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;
> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> -	mmsys->rcdev.of_node = pdev->dev.of_node;
> -	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> -		return ret;
> -	}
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(dev, "Couldn't get mmsys resource\n");
> @@ -391,6 +390,18 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		mmsys->data = match_data->drv_data[0];
>  	}
>  
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> +	mmsys->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> >rcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't register mmsys reset
> controller: %d\n", ret);
> +		return ret;
> +	}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
>  	if (ret)
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index f01ba206481d..20a271b80b3b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	const u16 sw0_rst_offset;
> +	const u32 num_resets;
>  };
>  
>  struct mtk_mmsys_match_data {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
