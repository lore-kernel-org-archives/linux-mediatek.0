Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65805C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 11:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1342361507
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 11:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1342361507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykT1CbrYZXV/cwJa8VlsWzkV79BX4XZEmSUByGq1UOU=; b=q6y9+D5PPbMFyX9mcb6xqytGiy
	YO8y/0P+/oFN+xP2eVi5RnT1139+FjdlwUzVVShql1HeqEY0aOQidfeo3mmFQgXtv2R2HrNMufv5y
	UoGccdwb7tAXw/S/3XJ/n88fVICVbotz1o2/9Dja0RcXsLdYB2hndoZ8OJp0ea6DWxBJZar63I+w6
	8JRkHAcLjYf3idIeSMrKBDMHH5e0ivlVKjdGTJ7wHVmyq7WPk877MlNilSmgxQ7/2tf4pAGAxnsAg
	2v2wMOvliLzByjVNwW4PLgXPQoIGSKHd0N4nMvYiAcRfEtaEYdO4nSnGEV/jqnb/2ZDFxXl1cp5BQ
	GNi7gwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWGHD-00HYNi-P8; Fri, 01 Oct 2021 11:00:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWGH0-00HYKg-J5; Fri, 01 Oct 2021 11:00:16 +0000
Received: from [IPv6:2a02:810a:880:f54:dd31:3048:d332:54e2] (unknown
 [IPv6:2a02:810a:880:f54:dd31:3048:d332:54e2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 679911F4554A;
 Fri,  1 Oct 2021 12:00:12 +0100 (BST)
Subject: Re: [PATCH v10, 2/5] drm/mediatek: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-3-yongqiang.niu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fffdc65c-9c74-3183-f8cf-293134144042@collabora.com>
Date: Fri, 1 Oct 2021 13:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930155222.5861-3-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_040014_944116_DA08C43D 
X-CRM114-Status: GOOD (  22.65  )
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



On 30.09.21 17:52, Yongqiang Niu wrote:
> This patch add component POSTMASK.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   2 files changed, 73 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 4a2abcf3e5f9..89170ad825fd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -62,6 +62,12 @@
>   #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
>   #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
>   
> +#define DISP_POSTMASK_EN			0x0000
> +#define POSTMASK_EN					BIT(0)
> +#define DISP_POSTMASK_CFG			0x0020
> +#define POSTMASK_RELAY_MODE				BIT(0)
> +#define DISP_POSTMASK_SIZE			0x0030
> +
>   struct mtk_ddp_comp_dev {
>   	struct clk *clk;
>   	void __iomem *regs;
> @@ -214,6 +220,32 @@ static void mtk_dither_stop(struct device *dev)
>   	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
>   }
>   
> +static void mtk_postmask_config(struct device *dev, unsigned int w,
> +				unsigned int h, unsigned int vrefresh,
> +				unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_POSTMASK_SIZE);
> +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> +		      priv->regs, DISP_POSTMASK_CFG);
> +}
> +
> +static void mtk_postmask_start(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +}
> +
> +static void mtk_postmask_stop(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +}
> +
>   static const struct mtk_ddp_comp_funcs ddp_aal = {
>   	.clk_enable = mtk_aal_clk_enable,
>   	.clk_disable = mtk_aal_clk_disable,
> @@ -289,6 +321,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
>   	.bgclr_in_off = mtk_ovl_bgclr_in_off,
>   };
>   
> +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> +	.clk_enable = mtk_ddp_clk_enable,
> +	.clk_disable = mtk_ddp_clk_disable,
> +	.config = mtk_postmask_config,
> +	.start = mtk_postmask_start,
> +	.stop = mtk_postmask_stop,
> +};
> +
>   static const struct mtk_ddp_comp_funcs ddp_rdma = {
>   	.clk_enable = mtk_rdma_clk_enable,
>   	.clk_disable = mtk_rdma_clk_disable,
> @@ -324,6 +364,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>   	[MTK_DISP_MUTEX] = "mutex",
>   	[MTK_DISP_OD] = "od",
>   	[MTK_DISP_BLS] = "bls",
> +	[MTK_DISP_POSTMASK] = "postmask",
>   };
>   
>   struct mtk_ddp_comp_match {
> @@ -333,36 +374,37 @@ struct mtk_ddp_comp_match {
>   };
>   
>   static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
> -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
> -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
> -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
> -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
> -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
> -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
> -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
> -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
> -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
> -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
> -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
> -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
> -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
> -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
> +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
> +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
> +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
> +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
> +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
> +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
> +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
> +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
> +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
> +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
> +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
> +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
> +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
> +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },

Hi, I can't see where is DDP_COMPONENT_POSTMASK0 defined.

Thanks,
Dafna

> +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
> +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
> +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
> +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
> +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
>   };
>   
>   static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..cd1dec6b4cdf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>   	MTK_DISP_UFOE,
>   	MTK_DSI,
>   	MTK_DPI,
> +	MTK_DISP_POSTMASK,
>   	MTK_DISP_PWM,
>   	MTK_DISP_MUTEX,
>   	MTK_DISP_OD,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
