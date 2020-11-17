Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACB3C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 03:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ABFD24697
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 03:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mj0xtZqH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NwAMHIKP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ABFD24697
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAq8QEhVC7TpDVyZDOqDG+6zwczu2Knb88ResJhtJkY=; b=mj0xtZqHe5w5rjqriFYDjxCxP
	Xu7gxtsHM7ddYYp6RIRUMw0uuuPsdlTH0PIil3E7g7Ysv7pItY6tCcx+gyFpqVB+9fqvRHf3/6OLC
	2OTT/GywgYPjXQuMdo8TBE3ieme83T5b7Q+5kgp1kax4rhEZEXAJmAkMgKRcsT6BLMRinL60QQjfu
	MtPmWCK3x151mm7t6+qoYQFZr/oe77xhzO7Gv0OUqn4YYKSmrBMJYFxevNBE8GH9VxlRR+DjiExGp
	bDWhzovFa3foxqHSTdNiN+h6nU9z91YshZBYfV0Q1qQ/WhiK6AJ5lWk4Su2lqVZIDY7M75e9+gl25
	5j2Y3aE+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kermt-0006GO-MA; Tue, 17 Nov 2020 03:36:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kermp-0006Ei-1v
 for linux-mediatek@lists.infradead.org; Tue, 17 Nov 2020 03:36:09 +0000
X-UUID: 3ee4b8c9a7e84583971e8981e83239eb-20201116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9lXqFzp2pUfNGG0hxIdRdfJ3T4i/tYEZMqpOmdgUWe4=; 
 b=NwAMHIKPDUxghXmhheTZaX8TbvdtnnUNCGj+cRrNViRVLxUKTajis6Y6KZnEEuu9nkF3FUfzGK7TtuRFmTZ3J+8g9lReaRDxiO/26J88l+TfWU1wskFi5GmUncqdWzEr7gNnN9/1NfZlPJjWXKYDPs2ZV3PZF2WxjVQz6llTGog=;
X-UUID: 3ee4b8c9a7e84583971e8981e83239eb-20201116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2065659588; Mon, 16 Nov 2020 19:36:03 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 19:35:56 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Nov 2020 11:35:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Nov 2020 11:35:50 +0800
Message-ID: <1605584151.31607.35.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 11:35:51 +0800
In-Reply-To: <20201116231407.94-3-chunkuang.hu@kernel.org>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B95D2D481DAC4A3038D14ED72C3D9D030F57D0A6ED6B197E021B229AAED557D92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_223607_888949_1124243F 
X-CRM114-Status: GOOD (  17.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,
On Tue, 2020-11-17 at 07:14 +0800, Chun-Kuang Hu wrote:
> mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_mipi_dsi_phy driver into phy driver folder.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
You forgot to add acked-by me

> ---
>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 5 +++++
>  .../mediatek/phy-mtk-mipi-dsi-mt8173.c}                    | 2 +-
>  .../mediatek/phy-mtk-mipi-dsi-mt8183.c}                    | 2 +-
>  .../mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c}      | 2 +-
>  .../mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h}      | 0
>  8 files changed, 15 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 24c4890a6e65..2976d21e9a34 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,10 +28,3 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> -
> -config PHY_MTK_MIPI_DSI
> -	tristate "Mediatek MIPI-DSI-PHY Driver"
> -	depends on ARCH_MEDIATEK && OF
> -	select GENERIC_PHY
> -	help
> -	  Support MIPI DSI PHY for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index baa188000543..a892edec5563 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -19,9 +19,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> -
> -phy-mtk-mipi-dsi-drv-objs := mtk_mipi_tx.o \
> -			     mtk_mt8173_mipi_tx.o \
> -			     mtk_mt8183_mipi_tx.o
> -
> -obj-$(CONFIG_PHY_MTK_MIPI_DSI) += phy-mtk-mipi-dsi-drv.o
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 50c5e9306e19..574b8e6398d2 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -42,3 +42,10 @@ config PHY_MTK_HDMI
>  	select GENERIC_PHY
>  	help
>  	  Support HDMI PHY for Mediatek SoCs.
> +
> +config PHY_MTK_MIPI_DSI
> +	tristate "MediaTek MIPI-DSI Driver"
> +	depends on ARCH_MEDIATEK && OF
> +	select GENERIC_PHY
> +	help
> +	  Support MIPI DSI for Mediatek SoCs.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 6325e38709ed..ace660fbed3a 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -11,3 +11,8 @@ phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
>  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
> +
> +phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> +phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
> +phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
> +obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> index f18db14d8b63..7a847954594f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> @@ -4,7 +4,7 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_DSI_CON		0x00
>  #define RG_DSI_LDOCORE_EN		BIT(0)
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> index 9f3e55aeebb2..99108426d57c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> @@ -4,7 +4,7 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_LANE_CON		0x000c
>  #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index f2a892e16c27..18c481251f04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -3,7 +3,7 @@
>   * Copyright (c) 2015 MediaTek Inc.
>   */
>  
> -#include "mtk_mipi_tx.h"
> +#include "phy-mtk-mipi-dsi.h"
>  
>  inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
>  {
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
