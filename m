Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6991BC56201
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 06:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9421022206
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 06:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6XI8qRd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jFAcBTi+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9421022206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gq2EbQP4eL7DexELHqQdnwhpvdP9HU1WXEaNzAUktAM=; b=F6XI8qRdy6nHI4/gyjC3dUHrB
	nirsR9/jK6vONSgj0aGi1QdbRbrQ9/V4dhK0VKOr37RqXm+67ZBj8qLcmoA+x/G5QuMmJfpkxsb0o
	LpMTjyddWCMhcsBpyCnLpQAkSESx6jP3ihWJOSRKyJWzkeJiR1S4k2aTrOxm+46CzIlN145ElbfbV
	Czm5tKhjsws4Yg4TIqOSRp+QdV+SB1ed+ugkUy8x1lhpMIXkUd8+sCT3LkXvbbPMltS/iKE+SL5K4
	nNdbmAuwVvs95VfXF0YN9sNcT9vhadRD/VBHL4wwl1zFoYkfLA77POeYBY1JF/C0SUHlqKJKf/QyD
	KFKNlNzgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYNpp-0007KV-Iy; Fri, 30 Oct 2020 06:24:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYNpm-0007K6-QQ
 for linux-mediatek@lists.infradead.org; Fri, 30 Oct 2020 06:24:24 +0000
X-UUID: 4851ad6b32a64c4c89c26f4e89950e81-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YW4q5ZJRm8kC2ou+oovRsbefAl2EDK2GL+44143nPrc=; 
 b=jFAcBTi+hXNJeRD5HTU1aX1W+EMS+wc3DC7HxNTwO50DR5FPFf3vleREos23czHpyqwjXiPbe69iH5jLRSNF/SkTjp4P6JuAk1roNb698mndZeeYXShsvclNskLOE/xc/XYAx791fCYeKROldR0jfMcAWcRsC0bfhbV0RV+1/j0=;
X-UUID: 4851ad6b32a64c4c89c26f4e89950e81-20201029
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1838649013; Thu, 29 Oct 2020 22:24:14 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 23:24:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 30 Oct 2020 14:24:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 14:24:08 +0800
Message-ID: <1604039049.31607.13.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 30 Oct 2020 14:24:09 +0800
In-Reply-To: <20201029152702.533-3-chunkuang.hu@kernel.org>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C109F125DCD51B7526C344C915E61B96ACE847500F15FDE08582526232B511C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_022423_102502_5ADAA33D 
X-CRM114-Status: GOOD (  18.01  )
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
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-29 at 23:27 +0800, Chun-Kuang Hu wrote:
> mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_mipi_dsi_phy driver into phy driver folder.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Please add phy maintaniner "Vinod Koul <vkoul@kernel.org>"

Thanks

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
