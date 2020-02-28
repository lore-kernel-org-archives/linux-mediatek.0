Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45384C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 09:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCFA24672
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 09:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+X2sIib";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZRx8M3Wn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCFA24672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDyEhU9ChuOF408+Qnm/hNh9ui/tM7nr8whyoVHrPT4=; b=N+X2sIibRm3paF
	Isu05mz8hsWswdQNbbmR7xncSvUvLk7TnDcuKHv3fSaA5vcPe3Czi3ndBTFAuMxaVcM/0+8bMGuTE
	j4qzKUigf1HQMA5TFXnt8s8vjQuYghg6bfFE1gE7Vl9e1DNU+Gze3h6o8iiJ9p83IXXvsRemeEMV/
	9NK4thTyjePHFCI47CmbDF9S5P+mNzCK8c2t6YrMlcLGwj6yTujm9ebNDfTo0XEZya22CNSRd2AVk
	uOz2jaTnSf/z388WjS+HqQ+Ty/jXruT/bBqFSvw7sOJNzOijrde89Q7pZkwOlTW3kPEgzJ7WrrJiN
	vhS5LAb56qBxYqj520FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7c5i-00011y-FC; Fri, 28 Feb 2020 09:37:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7c5g-00010u-7K; Fri, 28 Feb 2020 09:37:53 +0000
X-UUID: 64a042e964224cdbabc90aa7eedf7ee4-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wbDyMawynlrwHWkUP0rf/CmT5tZ9aeV3JKqgN+jnUl8=; 
 b=ZRx8M3Wnifgb+h9tl0gfO6h5jaIQLReCZBPxWaOoSwovd/QlrWYu7DNqjAV7NACZooSZvcV1UjGyrTZFHhGlelpTLEpVpDaTzAsdymzfuVlK1mzucRwLmXvIUAEG4Lg9dM29X9j1G1KMI2s9myAZmEISNLp5h5GGR4IRTf7Lc8I=;
X-UUID: 64a042e964224cdbabc90aa7eedf7ee4-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 822250393; Fri, 28 Feb 2020 01:37:47 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 01:38:28 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 17:36:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 17:37:27 +0800
Message-ID: <1582882664.22475.6.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 28 Feb 2020 17:37:44 +0800
In-Reply-To: <20200227180858.1514157-5-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-5-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_013752_269173_22E569AF 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Thu, 2020-02-27 at 19:08 +0100, Enric Balletbo i Serra wrote:
> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
> Those functions will allow DRM driver and others to control the data
> path routing.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v10:
> - Introduced a new patch to move routing control into mmsys driver.
> - Removed the patch to use regmap as is not needed anymore.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  13 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  13 +-
>  drivers/soc/mediatek/mtk-mmsys.c        | 275 ++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h  |  19 ++
>  6 files changed, 306 insertions(+), 277 deletions(-)
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index fd4042de12f2..3c89449bea6e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>  
>  #include <asm/barrier.h>
>  #include <soc/mediatek/smi.h>
> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> -		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
> -					 mtk_crtc->ddp_comp[i]->id,
> -					 mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_mmsys_ddp_connect(mtk_crtc->config_regs,
> +				      mtk_crtc->ddp_comp[i]->id,
> +				      mtk_crtc->ddp_comp[i + 1]->id);

When CONFIG_MTK_MMSYS is not enable, this would built fail. So make some
modification in Kconfig.

>  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>  					mtk_crtc->ddp_comp[i]->id);
>  	}
> @@ -355,9 +356,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  					   mtk_crtc->ddp_comp[i]->id);
>  	mtk_disp_mutex_disable(mtk_crtc->mutex);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> -		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
> -					      mtk_crtc->ddp_comp[i]->id,
> -					      mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_mmsys_ddp_disconnect(mtk_crtc->config_regs,
> +					 mtk_crtc->ddp_comp[i]->id,
> +					 mtk_crtc->ddp_comp[i + 1]->id);
>  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
>  					   mtk_crtc->ddp_comp[i]->id);
>  	}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index b885f60f474c..014c1bbe1df2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -13,26 +13,6 @@
>  #include "mtk_drm_ddp.h"
>  #include "mtk_drm_ddp_comp.h"
>  

[snip]

> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> new file mode 100644
> index 000000000000..02fd86e62a8d
> --- /dev/null
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_MMSYS_H
> +#define __MTK_MMSYS_H
> +
> +enum mtk_ddp_comp_id;
> +
> +void mtk_mmsys_ddp_connect(void __iomem *config_regs,

I prefer the first parameter to be 'struct device *dev' which is the
device pointer of mmsys device. and mmsys driver could use this pointer
to get its register address.

Regards,
CK

> +			   enum mtk_ddp_comp_id cur,
> +			   enum mtk_ddp_comp_id next);
> +
> +void mtk_mmsys_ddp_disconnect(void __iomem *config_regs,
> +			      enum mtk_ddp_comp_id cur,
> +			      enum mtk_ddp_comp_id next);
> +
> +#endif /* __MTK_MMSYS_H */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
