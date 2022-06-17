Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A1C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 06:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOt0pVqLZ92B78LMsFtZDxinSx24E7ZPRSnnPISDasM=; b=k+u5bWnGW4aUx5LVLH0b/9k4Fd
	K2w30EWUrfc6mIhEtXBrHQ7o50yQagP/GMAm4IkfZcHGRX8PfAqD8reBykJD98npoTTqyaN2KzCL5
	IhEhcb++vhE8OPAA7LYVZBm2j09lmrm4jGuEf5gWBJzLaLeWuw0u9g5qKQk81ENKscS/yxCUDJ+Yp
	/WJw8RQfhESrzFmHNADGlr+vkruiP4Px+RM23ek7q55bq/eisK2nwx4D79R+Si7vQP3kyyHBeKDzL
	Lp3pPoPYSOElrvALOQS7Ywsyj9mkSYZ/0Pife+LMJP7b0aa+Bc1qoGXfZEdlsbtuQGP4HvV2/5/gt
	mnB3WR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2559-005h4f-DT; Fri, 17 Jun 2022 06:03:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2556-005h3B-6t; Fri, 17 Jun 2022 06:03:45 +0000
X-UUID: 96c9b87afd0a468a8952fc0b7b3d2c67-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a91dbf55-ca75-497b-9d1f-67ecb0b64b93,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:1c55dc48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 96c9b87afd0a468a8952fc0b7b3d2c67-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1552206582; Thu, 16 Jun 2022 23:03:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 22:53:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:53:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:53:34 +0800
Message-ID: <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
Subject: Re: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display
 path
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 17 Jun 2022 13:53:34 +0800
In-Reply-To: <20220530201436.902505-5-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
	 <20220530201436.902505-5-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_230344_308706_95308720 
X-CRM114-Status: GOOD (  15.99  )
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
> Right now only the DSI path connections are described in the mt8365
> mmsys driver. The external path will be DPI/HDMI. This commit adds
> the connections for DPI/HDMI.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h
> b/drivers/soc/mediatek/mt8365-mmsys.h
> index 24129a6c25f8..7abaf048d91e 100644
> --- a/drivers/soc/mediatek/mt8365-mmsys.h
> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
> @@ -10,6 +10,9 @@
>  #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
>  #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
>  #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
> +#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
> +#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
>  
>  #define MT8365_RDMA0_SOUT_COLOR0			0x1
>  #define MT8365_DITHER_MOUT_EN_DSI0			0x1
> @@ -18,6 +21,10 @@
>  #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
>  #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
>  #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
> +#define MT8365_RDMA1_SOUT_DPI0				0x1
> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
> +#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>  
>  static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] =
> {
>  	{
> @@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes
> mt8365_mmsys_routing_table[] = {
>  		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
>  		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0,
> MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
>  	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
> +		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK,
> MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
> +		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
> +		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
> +	},
>  };
>  
>  #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */


