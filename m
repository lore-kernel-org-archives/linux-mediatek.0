Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04579C2D0F0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 16:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02782071A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 16:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q17cpb82";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9InK6EC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02782071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lytYrSko1Nj+ocWxnSNQtlyROC7vTRAMW/YMXmi5iU8=; b=q17cpb82D3ca9K
	fsoAQELNd9/X7SfRhAI9xEzyrpJ87gDdFgvIDchJ+CHY9M+/5/28LPg544w5y+6qloZB1pIyAjEgL
	tevGuHQRmFmX9ulaQ2y15lgHEZxhVJGcESfJm/4+0gz7G98N29AuLRgmV9m//vSwJ7Yj7Bc2TZCZJ
	VSJcI3cxsA5uxQ/yAk1IFrISTHT7xbtYl/Un2LGOXGupomErk86F8Q8OXg2bfwxPWYh6JxrlYnX9b
	qyYF+8QTZo4SyNoLda5ocuIWHE98GfKX0YtwgJlC5+7L8K/IvZZ2YBEYKn72xs9+Utwt4vvO7lUXH
	XtE+n5nZnfa+drQ08K+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJfrB-0003eR-Cd; Wed, 01 Apr 2020 16:04:45 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJfr8-0003dw-91
 for linux-mediatek@lists.infradead.org; Wed, 01 Apr 2020 16:04:43 +0000
Received: by mail-wr1-x443.google.com with SMTP id u10so693570wro.7
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2020 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/7toVtMdgZDXlBcQP9THJ413Ry2c3Jly4FDy5/J2wE=;
 b=n9InK6ECCCWWQB0iFi3k2SfIIq25sBmkt//gH1CNyCmWibvmOWrfFjZpPQyg2ejYyP
 F76NHG2NqmFNCMWJdC2bGhk+E4rexxXr0zYUeUvSrusjPIcZ7UG1z5YrNsWTotC3lkWq
 fbSeu92sT2Iw7WaCme2b8XYVLpuqD5zyNXg4gdLpeIjUbX25Fc14WBsBq+qANwMtYWnt
 UpCOYVkpLhl0NVbKHqPaa3Qfipw2urYOGLyWMN/Hp+IO+sGihAA6RqowMWWvaM4+fWPk
 8oo9bhHGvmYzIFdfmTcPETkVrLDg8V7d/XcI2McYU5Y98ie4WYMDHR7Ezh49q79Ju0mL
 FA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r/7toVtMdgZDXlBcQP9THJ413Ry2c3Jly4FDy5/J2wE=;
 b=L3sTT8RIBeg+AqJxk+5UnVXUYG5JSTtjSBeidXyFrblMR+Vaad7dlp2IEhyiNeEERS
 a3bAi3WQvUX/YDVI4USKLV7C2mEu38nvhJmQiwHZg22ZbGHNvlhumWnDwMpAzIeysnvL
 9JqfdRHkCeALji5NlQueTHzpzLO07kRdtoexUGxvGkjDKp2aU9oIvybYb8A3nbnNmrDf
 8eMhg4NC0iUIxFrqlCRelPsdcaattG1ekVSXzmzn+tvXnJqA2Qyu+G2k7k2Z2Gzs79nD
 jz+ZBEpEaeWJGJV0mwM/F8ByigxP7qT8ysiKtptC+ndjKG/nZByanEGy2mIHv52YN8V9
 myLA==
X-Gm-Message-State: ANhLgQ2pV7ntPqszcaXC/DezPNPQZy2SOhA/b6I3yWSGfI0RednqtI2k
 9lzw5MvzD8N8piL6PoOk4s4=
X-Google-Smtp-Source: ADFU+vuOifRHkO8TahCXVLrGGFAiEhTjeItyYfJhJALj9g0vWu28di4J4Lgq7hzudB3Ifxm76HjoLQ==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr26251128wrc.120.1585757079065; 
 Wed, 01 Apr 2020 09:04:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id k185sm3246604wmb.7.2020.04.01.09.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 09:04:37 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-4-chunkuang.hu@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c8ef5e91-252c-4d06-4a2e-5c91e725d0eb@gmail.com>
Date: Wed, 1 Apr 2020 18:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331155728.18032-4-chunkuang.hu@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_090442_343386_28506D66 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 31/03/2020 17:57, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_hdmi_phy driver into phy driver folder.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 7 +++++++
>  .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
>  .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
>  .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
>  .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
>  8 files changed, 17 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index ff6a1eb4ae83..2427d5bf699d 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -26,10 +26,3 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> -
> -config PHY_MTK_HDMI
> -    tristate "MediaTek HDMI-PHY Driver"
> -    depends on ARCH_MEDIATEK && OF
> -    select GENERIC_PHY
> -    help
> -          Enable this to support HDMI-PHY
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index fcbef23aa6ce..77b0fd86063d 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -22,9 +22,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> -
> -phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
> -			 mtk_mt2701_hdmi_phy.o \
> -			 mtk_mt8173_hdmi_phy.o
> -
> -obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index dee757c957f2..10f0ec2d5b54 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -35,3 +35,10 @@ config PHY_MTK_XSPHY
>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
>  	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
>  	  multiple USB2.0, USB3.1 GEN2 ports.
> +
> +config PHY_MTK_HDMI
> +    tristate "MediaTek HDMI-PHY Driver"
> +    depends on ARCH_MEDIATEK && OF
> +    select GENERIC_PHY
> +    help
> +          Enable this to support HDMI-PHY
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 08a8e6a97b1e..cda074c53235 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -6,3 +6,10 @@
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> +
> +phy-mtk-hdmi-drv-objs := phy-mtk-hdmi.o \
> +			 phy-mtk-hdmi-mt2701.o \
> +			 phy-mtk-hdmi-mt8173.o
> +
> +obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index 99fe05cd3598..a6cb1dea3d0c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -4,7 +4,7 @@
>   * Author: Chunhui Dai <chunhui.dai@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0	0x00
>  #define RG_HDMITX_DRV_IBIAS		0
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> index b55f51675205..3521c4893c53 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0		0x00
>  #define RG_HDMITX_PLL_EN		BIT(31)
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi.c
> index fe022acddbef..8fc83f01a720 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  static int mtk_hdmi_phy_power_on(struct phy *phy);
>  static int mtk_hdmi_phy_power_off(struct phy *phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> rename to drivers/phy/mediatek/phy-mtk-hdmi.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
