Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zT0vKwq8KqMnVfbLtBemg1MwGpx/4y23LODtRabAWlU=; b=KBeDBsY1l9rmtY
	JZwVBk0kdfzOZVEDIlsQrWtDnfDwLzWYb1uflcWs+yhBsCMtOyjJ9ZnBh3+p1zMI2wgcJIhuuHGif
	ie0oQBCUqZw6bIQWZqALypsNzL7Xdz18W7uQvdvASQyBrgEYoUxrD0e6ur1LZ/eLe8QhWBLcxln9V
	Dl3tHvnb7WhG+qtkiaFW5zErCf3BKdv2GEPo5Bgq4VSFS/SJBbzFsQKt5CltQKsSpPfNrZjrgxw+X
	zNf2qWZg3ispsbAeglRPVbrR9XrwUNrWcWjioPOdeCyXUnYTo+oePDIuK7qa7UCabKf5faQMh80xy
	vFoYnK6M94JK0V8sQ4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5OyS-00HD6O-Ol; Thu, 06 Jan 2022 09:22:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5OyP-00HD4m-QI; Thu, 06 Jan 2022 09:22:19 +0000
X-UUID: 424d952097134d24b702e9a6dc3402c8-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YqFkuLXPM110+xURTsmv5GvG77ZjBzDfJrv5YfcM58k=; 
 b=g0swXi8uupUt6CPJ4DIDyhMs1NbCoQho2cj31dQSVUESAjXpdmqs6mpHnlIloLQBVDBGKXPgIUZouLZ1xN7NgRDMQXU0bN+2halc0ovrCLRxsXQ7Th75Ih3u3pq2BNRNap/24ytzgb5j9Jj+a8h6Gce60+uIiS1G87UZRu5sVxA=;
X-UUID: 424d952097134d24b702e9a6dc3402c8-20220106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1323463140; Thu, 06 Jan 2022 02:22:14 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 01:22:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 17:22:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:22:05 +0800
Message-ID: <c3773ed47126bf3810bc7d78e3ec293f144ccd7f.camel@mediatek.com>
Subject: Re: [PATCH 3/4] phy: mediatek: phy-mtk-hdmi: Reorder and stop
 implicit header inclusion
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 6 Jan 2022 17:22:05 +0800
In-Reply-To: <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_012217_884729_F6898180 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, 2022-01-03 at 16:30 +0100, AngeloGioacchino Del Regno wrote:
> All the headers for phy-mtk-{hdmi,hdmi-mt2701,hdmi-mt8183}.c were
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
>  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c |  5 +++++
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c |  5 +++++
>  drivers/phy/mediatek/phy-mtk-hdmi.c        |  8 ++++++++
>  drivers/phy/mediatek/phy-mtk-hdmi.h        | 10 +---------
>  4 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index 09e0dd7499d8..270c5f538483 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -4,6 +4,11 @@
>   * Author: Chunhui Dai <chunhui.dai@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
>  #include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0	0x00
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> index e317bf4a9db9..87ba9a3687b7 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> @@ -4,6 +4,11 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
>  #include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0		0x00
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index b4193cb4e4e3..e037fa89696c 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -4,6 +4,14 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/phy/phy.h>
>  #include "phy-mtk-hdmi.h"
>  
>  inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h
> b/drivers/phy/mediatek/phy-mtk-hdmi.h
> index a0571271d730..ef81e44a235d 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.h
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
> @@ -6,17 +6,9 @@
>  
>  #ifndef _MTK_HDMI_PHY_H
>  #define _MTK_HDMI_PHY_H
> -#include <linux/clk.h>
> +
>  #include <linux/clk-provider.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/phy/phy.h>
> -#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/types.h>
Please do not move common headers also into .c files

>  
>  struct mtk_hdmi_phy;
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
