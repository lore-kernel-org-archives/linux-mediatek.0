Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Odfe65Eto3dv84fYqYEwUyUpKbWn+GvAn3IzHCmYlZY=; b=QWg4W2LPE6b0HS
	IkDZa7HPzmHL7KeHQNWZLvzk3fzCcmzovRluRJ9G7tnRbPND9sNjMfy4rT0w2+xzHfwfkreCbQndK
	/Pe4Ojqyn+dlLULGmxFUbb6Vm8PsltJNKEjGU4doUx+yGqoBFWqUoghi8Nh6Sp7LTRT3T+a/ftHxD
	mwe3Cf2wAteU98Z/FavqT+jWPeKNlQM+51j6sMlC3VE2bpmjeUzsAxHaGn3UZ7SWeMTp+j4U7dxdO
	kwHWu3fmbB+XodI1P7kHQtbH+e/Eo2oj/IVOVxmu0bIXUBUla3DQ1f/qLIgdnPoKWUc/LLz+X4SaN
	/3/Eszhawokb8hIMK/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUy2-009r1Y-Fp; Tue, 22 Mar 2022 03:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUxy-009qzq-6J; Tue, 22 Mar 2022 03:13:52 +0000
X-UUID: c3b6c6a277ae4fcb8111fcdcda873509-20220321
X-UUID: c3b6c6a277ae4fcb8111fcdcda873509-20220321
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1801421784; Mon, 21 Mar 2022 20:13:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 20:13:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 11:13:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:13:06 +0800
Message-ID: <17ed6c2a5f40cabd8e39097213811a2149c37c90.camel@mediatek.com>
Subject: Re: [PATCH v16 05/22] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
 <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Mar 2022 11:13:06 +0800
In-Reply-To: <20220318142009.2796-6-nancy.lin@mediatek.com>
References: <20220318142009.2796-1-nancy.lin@mediatek.com>
 <20220318142009.2796-6-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_201350_253686_D8E17936 
X-CRM114-Status: GOOD (  26.70  )
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

On Fri, 2022-03-18 at 22:19 +0800, Nancy.Lin wrote:
> Add mmsys config API. The config API is used for config mmsys reg.
> Some mmsys regs need to be setting according to the HW engine binding
> to the mmsys simultaneously.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 62
> ++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 34 ++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h       | 10 +++++
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 +++++++
>  4 files changed, 122 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> index 369fb0aab56d..8b7adbd22919 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -139,6 +139,21 @@
>  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> 0xf68
>  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> 0
>  
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> +#define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> +#define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> +#define MT8195_VDO1_MERGE3_ASYNC_CFG_WD	0xe60
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG		0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
> +#define MT8195_VDO1_MIXER_IN2_ALPHA	0xd34
> +#define MT8195_VDO1_MIXER_IN3_ALPHA	0xd38
> +#define MT8195_VDO1_MIXER_IN4_ALPHA	0xd3c
> +#define MT8195_VDO1_MIXER_IN1_PAD	0xd40
> +#define MT8195_VDO1_MIXER_IN2_PAD	0xd44
> +#define MT8195_VDO1_MIXER_IN3_PAD	0xd48
> +#define MT8195_VDO1_MIXER_IN4_PAD	0xd4c
> +
>  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] =
> {
>  	{
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> @@ -263,4 +278,51 @@ static const struct mtk_mmsys_routes
> mmsys_mt8195_routing_table[] = {
>  	}
>  };
>  
> +/*
> + * mtk_mmsys_config table is used for config mmsys reg in runtime.
> + * MMSYS_CONFIG_MERGE_ASYNC_WIDTH: config merge async width
> + * MMSYS_CONFIG_MERGE_ASYNC_HEIGHT: config merge async height
> + * MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH: config hdr_be async width
> + * MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT: config hdr_be async height
> + * MMSYS_CONFIG_MIXER_IN_ALPHA_ODD: config mixer odd channel 9bit
> alpha value
> + * MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN: config mixer even channel 9bit
> alpha value
> + * MMSYS_CONFIG_MIXER_IN_CH_SWAP: config mixer input RGB channel
> swap
> + * MMSYS_CONFIG_HDR_ALPHA_SEL: config alpha source
> + * MMSYS_CONFIG_MIXER_IN_MODE: config mixer pad mode(bypass/even
> extend mode)
> + * MMSYS_CONFIG_MIXER_IN_BIWIDTH: config mixer pad width. formula:
> width / 2 - 1
> + */
> +static const struct mtk_mmsys_config mmsys_mt8195_config_table[] = {
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 0,
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 0,
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 1,
> MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 1,
> MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 2,
> MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 2,
> MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 3,
> MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 3,
> MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(29, 16), 16},

I would like a function to set these value

mtk_mmsys_merge_async_config(int idx, int width, int height)

and describe what does the term 'async' mean.

> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(29, 16), 16},

mtk_mmsys_hdr_confing(int be_width, int be_height, bool alpha_en)

> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 1,
> MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 1,
> MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 2,
> MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 2,
> MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 3,
> MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 3,
> MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 4,
> MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 4,
> MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(4, 4), 4},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 1, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(20, 20), 20},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 2, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(21, 21), 21},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 3, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(22, 22), 22},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 4, MT8195_VDO1_HDR_TOP_CFG,
> GENMASK(23, 23), 23},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 1, MT8195_VDO1_MIXER_IN1_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 2, MT8195_VDO1_MIXER_IN2_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 3, MT8195_VDO1_MIXER_IN3_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_MODE, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(1, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 1, MT8195_VDO1_MIXER_IN1_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 2, MT8195_VDO1_MIXER_IN2_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 3, MT8195_VDO1_MIXER_IN3_PAD,
> GENMASK(31, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 4, MT8195_VDO1_MIXER_IN4_PAD,
> GENMASK(31, 16), 16},

mtk_mmsys_mixer_in_config(int idx, u16 alpha, bool channel_swap, u8
mode, u32 biwidth)

Regards,
CK

> +};
> +
>  #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 0b77624cf6ca..6dd68483012c 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -83,6 +83,8 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys1_driver_data = {
>  	.clk_driver = "clk-mt8195-vdo1",
>  	.routes = mmsys_mt8195_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.config = mmsys_mt8195_config_table,
> +	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {
> @@ -187,6 +189,38 @@ static const struct reset_control_ops
> mtk_mmsys_reset_ops = {
>  	.reset = mtk_mmsys_reset,
>  };
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum
> mtk_mmsys_config_type config,
> +			  u32 id, u32 val)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_config *mmsys_config = mmsys->data-
> >config;
> +	u32 reg_val;
> +	u32 mask;
> +	u32 offset;
> +	int i;
> +	u32 tmp;
> +
> +	if (!mmsys->data->num_configs)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_configs; i++)
> +		if (config == mmsys_config[i].config && id ==
> mmsys_config[i].id)
> +			break;
> +
> +	if (i == mmsys->data->num_configs)
> +		return;
> +
> +	offset = mmsys_config[i].addr;
> +	mask = mmsys_config[i].mask;
> +	reg_val = val << mmsys_config[i].shift;
> +
> +	tmp = readl(mmsys->regs + offset);
> +
> +	tmp = (tmp & ~mask) | reg_val;
> +	writel(tmp, mmsys->regs + offset);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..78c7069bac0e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -86,11 +86,21 @@ struct mtk_mmsys_routes {
>  	u32 val;
>  };
>  
> +struct mtk_mmsys_config {
> +	enum mtk_mmsys_config_type config;
> +	u32 id;
> +	u32 addr;
> +	u32 mask;
> +	u32 shift;
> +};
> +
>  struct mtk_mmsys_driver_data {
>  	const char *clk_driver;
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	const u16 sw0_rst_offset;
> +	const struct mtk_mmsys_config *config;
> +	const unsigned int num_configs;
>  };
>  
>  /*
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index eaf7f7345519..b2d2310d7e7a 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -56,6 +56,19 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_ID_MAX,
>  };
>  
> +enum mtk_mmsys_config_type {
> +	MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_ALPHA_SEL,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_ODD,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN,
> +	MMSYS_CONFIG_MIXER_IN_CH_SWAP,
> +	MMSYS_CONFIG_MIXER_IN_MODE,
> +	MMSYS_CONFIG_MIXER_IN_BIWIDTH,
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id cur,
>  			   enum mtk_ddp_comp_id next);
> @@ -64,4 +77,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum
> mtk_mmsys_config_type config,
> +			  u32 id, u32 val);
> +
>  #endif /* __MTK_MMSYS_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
