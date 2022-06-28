Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA52EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrzmFs10H92JYp84/Qtv4kfV3k7fIuvAuuffe9cWowc=; b=AGe7ajDArcBzcBZsPVr8JDZqyZ
	g5+ChfHiqb4ajAXRW7im84BfefILjQ1dujN8kZiEtd69V5tEU0Fwty+VFgMcUebbx7h8SzUwKb/rI
	2o09PhT0wCzc6QYVMTBfII1anmi4lw+HSGg7nAYxPybAP0wsxAvma0kM1VqA5K1WsaSEES8XO0deq
	1XAih0bTZyJWgoF7lugMRlEwJ/OsUa/cIPgsPuvgRLeT+gUSvv/cN6inO3y2U9fvrkWjEm0UNl31p
	H74mcPYA4cjV/kg/YbvUCcysh2YLgnrKdzvsLB1C5HQNhwfT+62tAfkBC4/33YXn9SIxj0K7uvAkU
	ooyV96PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64SQ-004cFe-4Q; Tue, 28 Jun 2022 06:12:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64GE-004WAc-Tl; Tue, 28 Jun 2022 05:59:44 +0000
X-UUID: 505095dcc6fa48a4886fb830132af3d4-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:95cfadf5-dcbe-4bc9-9dd5-ad89d0a7aad1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:257ed262-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 505095dcc6fa48a4886fb830132af3d4-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1591945687; Mon, 27 Jun 2022 22:59:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 13:54:34 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jun 2022 13:22:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 28 Jun 2022 13:22:16 +0800
Message-ID: <d4b7ec15e66650833e8d5b44510310e7b74773cd.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 28 Jun 2022 13:22:16 +0800
In-Reply-To: <20220627080341.5087-6-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
	 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225943_036240_E041F6D1 
X-CRM114-Status: GOOD (  27.12  )
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

Hi, Bo-Chen:

On Mon, 2022-06-27 at 16:03 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       |   10 +
>  drivers/gpu/drm/mediatek/Makefile      |    1 +
>  drivers/gpu/drm/mediatek/mtk_dp.c      | 2198
> ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  543 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    3 +
>  6 files changed, 2758 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig
> b/drivers/gpu/drm/mediatek/Kconfig
> index 2976d21e9a34..6d3af73e7e8c 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -15,12 +15,22 @@ config DRM_MEDIATEK
>  	select MTK_SMI
>  	select PHY_MTK_MIPI_DSI
>  	select VIDEOMODE_HELPERS
> +	select DRM_MEDIATEK_DP

Remove this.

>  	help
>  	  Choose this option if you have a Mediatek SoCs.
>  	  The module will be called mediatek-drm
>  	  This driver provides kernel mode setting and
>  	  buffer management to userspace.
>  
> +config DRM_MEDIATEK_DP
> +	tristate "DRM DPTX Support for MediaTek SoCs"
> +	depends on DRM_MEDIATEK
> +	select PHY_MTK_DP
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_DP_HELPER
> +	help
> +	  DRM/KMS Display Port driver for MediaTek SoCs.
> +
>  

[snip]

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 78e79c8449c8..8023f1bd5f7e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1033,6 +1033,9 @@ static struct platform_driver * const
> mtk_drm_drivers[] = {
>  	&mtk_disp_ovl_driver,
>  	&mtk_disp_rdma_driver,
>  	&mtk_dpi_driver,
> +#if IS_REACHABLE(CONFIG_DRM_MEDIATEK_DP)
> +	&mtk_dp_driver,
> +#endif

Remove this, and treat dp driver like hdmi driver.

Regards,
CK

>  	&mtk_drm_platform_driver,
>  	&mtk_dsi_driver,
>  	&mtk_ethdr_driver,
> 


