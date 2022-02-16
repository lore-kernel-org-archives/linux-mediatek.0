Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E69C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3AR5r4S3vJgJYLjQBGYIYNZSw8ip98EHJ4fu6TeKrk=; b=D258KnEGXNFyXW
	MF80T0YOHQeEL0URYPfCsZ5Qrd73BgeQeTNv+caYNdmBF6CQ6RmaF2GqNoC/qcE3cDblrJVjQOEwD
	5jeamYMkoHZFabuVlEX2wBJOkVKoJ+p/ZkQRU6U6DbVHrKQFhd65JL1p/WGga/HlpNK61KHHfpblv
	Sh0SK9nw2Rdh8FXeGXAvZGPRt+M2KP2W22806GCd66TBOLqe4cPFP5KThpHgiVynMl091JMebWkSM
	/upRg7Sze+2xav4JSu6TP0Z+RmLUqGYS1a/qRkbADVK1GDgGKEl3dD74NM9P6Z9BhE9/6x8qFb6fL
	fTO6dR+91Q1vDnKZbNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK9YU-005GM1-Pp; Wed, 16 Feb 2022 01:56:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK9YH-005GGl-1m; Wed, 16 Feb 2022 01:56:18 +0000
X-UUID: f4478d54dc3948d98357b6ae586515b3-20220215
X-UUID: f4478d54dc3948d98357b6ae586515b3-20220215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 758125284; Tue, 15 Feb 2022 18:56:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 17:56:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 09:56:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 09:56:12 +0800
Message-ID: <3691cb945fdec02271d06cdb5fb8fac1350b49c8.camel@mediatek.com>
Subject: Re: [v2,6/6] drm/mediatek: add display support for MT8186
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <airlied@linux.ie>,
 <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <yongqiang.niu@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fparent@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 16 Feb 2022 09:56:12 +0800
In-Reply-To: <20220215075953.3310-7-rex-bc.chen@mediatek.com>
References: <20220215075953.3310-1-rex-bc.chen@mediatek.com>
 <20220215075953.3310-7-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_175617_133693_4C696E1B 
X-CRM114-Status: GOOD (  17.07  )
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

Hi, Rex:

On Tue, 2022-02-15 at 15:59 +0800, Rex-BC Chen wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> - Add driver data for MT8186 in mtk_drm_drv.c.
> - Add mtk-disp-ovl and mt-disp-ovl-2l support for MT8186.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 39
> +++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2146299e5f52..5fa56c7b9f5f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -456,6 +456,22 @@ static const struct mtk_disp_ovl_data
> mt8183_ovl_2l_driver_data = {
>  	.fmt_rgb565_is_0 = true,
>  };
>  
> +static const struct mtk_disp_ovl_data mt8186_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +};


mt8186_ovl_driver_data is identical to  mt8192_ovl_driver_data, so drop
this one and use mt8192_ovl_driver_data instead.

> +
> +static const struct mtk_disp_ovl_data mt8186_ovl_2l_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 2,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +};

Ditto.

Regards,
CK

> +
>  static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
>  	.addr = DISP_REG_OVL_ADDR_MT8173,
>  	.gmc_bits = 10,
> @@ -479,8 +495,12 @@ static const struct of_device_id
> mtk_disp_ovl_driver_dt_match[] = {
>  	  .data = &mt8173_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-ovl",
>  	  .data = &mt8183_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8186-disp-ovl",
> +	  .data = &mt8186_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = &mt8183_ovl_2l_driver_data},
> +	{ .compatible = "mediatek,mt8186-disp-ovl-2l",
> +	  .data = &mt8186_ovl_2l_driver_data},
>  	{ .compatible = "mediatek,mt8192-disp-ovl",
>  	  .data = &mt8192_ovl_driver_data},
>  	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6efb423ccc92..754b1be25d0d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -158,6 +158,24 @@ static const enum mtk_ddp_comp_id
> mt8183_mtk_ddp_ext[] = {
>  	DDP_COMPONENT_DPI0,
>  };
>  
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>  static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
>  	DDP_COMPONENT_OVL0,
>  	DDP_COMPONENT_OVL_2L0,
> @@ -221,6 +239,13 @@ static const struct mtk_mmsys_driver_data
> mt8183_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data =
> {
> +	.main_path = mt8186_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
> +	.ext_path = mt8186_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
> {
>  	.main_path = mt8192_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -463,6 +488,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8186-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8192-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8173-disp-od",
> @@ -475,14 +502,20 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8183-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8186-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8192-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>  	  .data = (void *)MTK_DISP_OVL_2L },
> +	{ .compatible = "mediatek,mt8186-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
>  	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt8192-disp-postmask",
>  	  .data = (void *)MTK_DISP_POSTMASK },
> +	{ .compatible = "mediatek,mt8186-disp-postmask",
> +	  .data = (void *)MTK_DISP_POSTMASK},
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8167-disp-pwm",
> @@ -511,12 +544,16 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8183-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8186-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt2701-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8183-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = (void *)MTK_DSI },
>  	{ }
>  };
>  
> @@ -533,6 +570,8 @@ static const struct of_device_id mtk_drm_of_ids[]
> = {
>  	  .data = &mt8173_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8183-mmsys",
>  	  .data = &mt8183_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8186-mmsys",
> +	  .data = &mt8186_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8192-mmsys",
>  	  .data = &mt8192_mmsys_driver_data},
>  	{ }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
