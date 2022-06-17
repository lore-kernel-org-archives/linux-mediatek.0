Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7035C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 05:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4lwHw888Yo8A0cfRHCphhLz5NHcXoBtAEpKhNE9bww=; b=2UF/Bw3qytGph84YucsAXnNiB4
	SgJTw1y4wzOrL2ueuX8+wlqq4kIV1Fnlx+vajaw5HdurVFna2SA7QPKLGu9ItrH5cE9k7FBUpzr/X
	gflDjBx+XoOU7isgYqOZfp806ecIa8PfQkKd2Q8tOctpRuhauQJJHWOQQZz9/BqOBLp3ep4nByyfo
	Gedndb/61TP6ZEL1GNzYWSqRs7pK8FGdxQE6NEas+eUZ4VsOlCu7LNr+eMiH6VnvtT+jGCwVKVhR+
	J22S3oeXVM+IkST2mlQlmQ0ugebwc14EG3ECem0ia3BZPvB5IisMd8cHDozrXH0Rt8pgJ3N/xiQpI
	c7pM52NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24sJ-005eOc-0H; Fri, 17 Jun 2022 05:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24sG-005eN4-I2; Fri, 17 Jun 2022 05:50:30 +0000
X-UUID: 5367edd125df4b4a826a17cfb3167665-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e0fc8b56-fee3-4478-ba75-be9352fae388,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:547698f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5367edd125df4b4a826a17cfb3167665-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 872005767; Thu, 16 Jun 2022 22:50:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 22:50:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:50:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:50:19 +0800
Message-ID: <e63682c60d3f3c29c941c1ff5db10903466d3d34.camel@mediatek.com>
Subject: Re: [PATCH 4/7] soc: mediatek: mutex: add MT8365 support
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 17 Jun 2022 13:50:18 +0800
In-Reply-To: <20220530201436.902505-4-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
	 <20220530201436.902505-4-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_225028_683361_A0CA994D 
X-CRM114-Status: GOOD (  15.38  )
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

Hi, Fabien:

On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> Add mutex support for MT8365 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 40
> ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 981d56967e7a..b8d5c4a62542 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -110,6 +110,20 @@
>  #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
>  #define MT8195_MUTEX_MOD_DISP_PWM0		27
>  
> +#define MT8365_MUTEX_MOD_DISP_OVL0		7
> +#define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
> +#define MT8365_MUTEX_MOD_DISP_RDMA0		9
> +#define MT8365_MUTEX_MOD_DISP_RDMA1		10
> +#define MT8365_MUTEX_MOD_DISP_WDMA0		11
> +#define MT8365_MUTEX_MOD_DISP_COLOR0		12
> +#define MT8365_MUTEX_MOD_DISP_CCORR		13
> +#define MT8365_MUTEX_MOD_DISP_AAL		14
> +#define MT8365_MUTEX_MOD_DISP_GAMMA		15
> +#define MT8365_MUTEX_MOD_DISP_DITHER		16
> +#define MT8365_MUTEX_MOD_DISP_DSI0		17
> +#define MT8365_MUTEX_MOD_DISP_PWM0		20
> +#define MT8365_MUTEX_MOD_DISP_DPI0		22
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -315,6 +329,22 @@ static const unsigned int
> mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
>  };
>  
> +static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
> +	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
> +	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> +	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
> +	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
> +	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
> +	[DDP_COMPONENT_OVL0] = MT8365_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8365_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_PWM0] = MT8365_MUTEX_MOD_DISP_PWM0,
> +	[DDP_COMPONENT_RDMA0] = MT8365_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8365_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8365_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -423,6 +453,14 @@ static const struct mtk_mutex_data
> mt8195_mutex_driver_data = {
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8365_mutex_driver_data = {
> +	.mutex_mod = mt8365_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -665,6 +703,8 @@ static const struct of_device_id
> mutex_driver_dt_match[] = {
>  	  .data = &mt8192_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8195-disp-mutex",
>  	  .data = &mt8195_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8365-disp-mutex",
> +	  .data = &mt8365_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);


