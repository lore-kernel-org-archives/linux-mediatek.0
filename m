Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F91EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsSJoiPeljyTpkUU3VhZCMh2GNc2S2/h4veO/uXkXJE=; b=VLSQdF5HsmKUh0
	9A0ffKT1DU+RtJRHF+uIBM4LLn28+QnjKKUMkVFRSZtor1Mbs44tuqbCSTD3LwlCkAZ4uSL4Ah/Of
	M4O+aeA/Lhs7SbJVvpztOd5muMqBVGkesqNCItsslJoYaqlKaJsMTsqoDQvoS/bn7BJDQ8hdqPLny
	RoOMWQzSwe3cl1GV0UwhttDasRchaXE+Tp9X7+H/mSeECLqKRnJLJJwuWoNQJ8Y63+bhVbBbY9kYQ
	NIUciDO/qX0qogKpI/i2ZhMqzG5pmKP0w6WoXvk33TgWCIAJwc3s7O3jLOVF9AcrA28qFGBFhZr4/
	s50IcBmyqin1Q4USGh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ORv-00H7DJ-LF; Thu, 06 Jan 2022 08:48:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ORr-00H7C7-Ps; Thu, 06 Jan 2022 08:48:41 +0000
X-UUID: 5aef2650074d4d029da16bb365dea8e4-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uB9XI7j4SB26amz3x7QKvwzxoWm0mOvg3a8f7hiIa5o=; 
 b=kho4X7gxWwiWEERtXhKw0DfZLLr09J8izqqaEiAjiH8+bOtJgL2DGiSL5nID8ORQA85hGOvmGYNDnCu5+9/8y1EoHrsiiEfnWK7yxM8nKQMJ8Zjbj1/WvUqf/msWCq8jZ6KwHLywObZsbtlLTYgWWvw+EQjz0GlExK6wwahfcwQ=;
X-UUID: 5aef2650074d4d029da16bb365dea8e4-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 597681819; Thu, 06 Jan 2022 01:48:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 00:38:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 16:38:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 16:38:32 +0800
Message-ID: <509b82079256ffaa0d844ae5a79a436fced16f3f.camel@mediatek.com>
Subject: Re: [PATCH 2/3] phy: mediatek: phy-mtk-mipi-dsi: Reorder and stop
 implicit header inclusion
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 6 Jan 2022 16:38:32 +0800
In-Reply-To: <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_004839_872074_8FA27526 
X-CRM114-Status: GOOD (  16.84  )
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

On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
> All the headers for phy-mtk-mipi-{dsi,dsi-mt8173,dsi-mt8183}.c were
> included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
> increase readability and sensibly reduce build times, the inclusions
> should be done per-file, also avoiding to include unused headers and
> should not be implicit.
> 
> For this reason, move the inclusions to each file and remove unused
> ones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c |  4 ++++
>  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c |  4 ++++
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c        |  7 +++++++
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.h        | 10 ++--------
>  4 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> index 95a0d9a3cca7..59f028da9d3e 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> @@ -4,7 +4,11 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/phy/phy.h>
>  #include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_DSI_CON		0x00
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> index 01b59527669e..6c6b192485ba 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> @@ -4,7 +4,11 @@
>   * Author: jitao.shi <jitao.shi@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/phy/phy.h>
>  #include "phy-mtk-mipi-dsi.h"
>  
>  #define MIPITX_LANE_CON		0x000c
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index 51b1b1d4ad38..6f7425b0bf5b 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -3,7 +3,14 @@
>   * Copyright (c) 2015 MediaTek Inc.
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/phy/phy.h>
>  #include "phy-mtk-mipi-dsi.h"
>  
>  inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw
> *hw)
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> index 8d32e9027a15..4eb5fc91e083 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> @@ -7,16 +7,10 @@
>  #ifndef _MTK_MIPI_TX_H
>  #define _MTK_MIPI_TX_H
>  
> -#include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/module.h>
> -#include <linux/nvmem-consumer.h>
> -#include <linux/of_device.h>
> -#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/regmap.h>
>  #include <linux/phy/phy.h>
> -#include <linux/slab.h>
>  
I don't think it's good idea to move the common headers into .c files

>  struct mtk_mipitx_data {
>  	const u32 mppll_preserve;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
