Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF71BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 03:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EL5Gn/PWAmkxHfKczighZu0jRfWSiNfWkC/uaf2QjFU=; b=1c0Sj6JixK6Evq
	myp1S2p9yN1vhXXjXg22i2OyqdLvRDa1RvybpGOphb+KMHlQKeSoO+j3pnlQnF8PzsW3BGEIvWT+S
	6QOl1CiSCSqds7O5lRhkjbVMvqNB1LbVvSigQEWXjj5L0Da5+UwSAIFrT2ltleu6mAZ7VprggrTpi
	PeiLbLEjMKIjvFLubZCjI2Q7XIqvi91vkCUuqwF+WJRYv3Tcv6clm/jgwoC5VuMft4+ethMVy6BFI
	aC0q4YoDbp1CtF+SMFJvueSyxjN1IofVhES+dM1zRdtkgcukw8DDtLvv+//+hb7stx7fEUr30n0Q/
	lYr9MjnSgqBABBvM75jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5gOF-002Ctv-Lu; Fri, 07 Jan 2022 03:58:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5gOB-002Crx-1r
 for linux-mediatek@lists.infradead.org; Fri, 07 Jan 2022 03:58:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id o12so11061283lfk.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Jan 2022 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKNMJyJbEEL5q9peHIeW1VWZHuVFJtpU7pIceN/pwjU=;
 b=Ct5qh0NnIjgjBBI8xvXdVNKrKFDmuJqDQ6lk+nREa2ajHPDsDrFmIqTCK/ih45n/+i
 MxVvKQX4wxPd/KqFTbXeaMVUspFFe2zOFPIHwD8+X/hDyeWjkxKrw/miIwgpNC8CyAQY
 dWpmeQvSJ9tTMcsSrDml7yTQw1BbaBypeNN3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKNMJyJbEEL5q9peHIeW1VWZHuVFJtpU7pIceN/pwjU=;
 b=h//3NlkBhgYba/u8kbMlo0vvRuZzwWdCuZ33Q6MltcDien0jfwOe86TLTxuOpi/scJ
 OdlHlDZ35pLGJKM+i12rSQiy/1QewgyFOmm0GEKfGR0I0nsxpM9Ag2auqxe+vbsiw+Up
 MlsNb8wQqLiQqJvvyad0BLdxZIgjgNf/tMTgaIscZA/Ekh1Z7dqQkRzBhwzfuL+17YGf
 EpgCUJEjG9q7hpLXeFOi5yWzq9Qj73YjeCAvtb/Q4trQCvDxhdo2fZV0nMp6DpY/2wR4
 sExeCF/U6kXwOJsZxpGibqIOYv6l16Q+YoVBBcLp239IbDZRYLvdCKLe5K5OWtY9YmLw
 Ls9Q==
X-Gm-Message-State: AOAM531JgEwcy8JI+HJPFoNR8ivhLOXy9XklTI/6R62RdXkPZZ7B59Dp
 z7AP09CEJ0c4jwSEzdEqxzY3L6M2e/GZ2TbQsBO2og==
X-Google-Smtp-Source: ABdhPJwB2LOLwXDSwFYbn94VKmzms3kaczzZBBcQQ0Iamv202Lew+ehb6NgWIJQfYAZCzjaWayYDS1PcdtAvATpbHog=
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr43356738ljp.201.1641527880239; 
 Thu, 06 Jan 2022 19:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
 <509b82079256ffaa0d844ae5a79a436fced16f3f.camel@mediatek.com>
In-Reply-To: <509b82079256ffaa0d844ae5a79a436fced16f3f.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jan 2022 11:57:49 +0800
Message-ID: <CAGXv+5EmnGFDnZE01mFfC=WHReOLdbuqCpAmwJNMvm6N93wRew@mail.gmail.com>
Subject: Re: [PATCH 2/3] phy: mediatek: phy-mtk-mipi-dsi: Reorder and stop
 implicit header inclusion
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, kishon@ti.com, vkoul@kernel.org, 
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_195803_125812_C10AA8D6 
X-CRM114-Status: GOOD (  24.44  )
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

On Thu, Jan 6, 2022 at 4:48 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
> > All the headers for phy-mtk-mipi-{dsi,dsi-mt8173,dsi-mt8183}.c were
> > included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
> > increase readability and sensibly reduce build times, the inclusions
> > should be done per-file, also avoiding to include unused headers and
> > should not be implicit.
> >
> > For this reason, move the inclusions to each file and remove unused
> > ones.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c |  4 ++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c |  4 ++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi.c        |  7 +++++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi.h        | 10 ++--------
> >  4 files changed, 17 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > index 95a0d9a3cca7..59f028da9d3e 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > @@ -4,7 +4,11 @@
> >   * Author: jitao.shi <jitao.shi@mediatek.com>
> >   */
> >
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  #define MIPITX_DSI_CON               0x00
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > index 01b59527669e..6c6b192485ba 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > @@ -4,7 +4,11 @@
> >   * Author: jitao.shi <jitao.shi@mediatek.com>
> >   */
> >
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  #define MIPITX_LANE_CON              0x000c
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > index 51b1b1d4ad38..6f7425b0bf5b 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > @@ -3,7 +3,14 @@
> >   * Copyright (c) 2015 MediaTek Inc.
> >   */
> >
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw
> > *hw)
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > index 8d32e9027a15..4eb5fc91e083 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > @@ -7,16 +7,10 @@
> >  #ifndef _MTK_MIPI_TX_H
> >  #define _MTK_MIPI_TX_H
> >
> > -#include <linux/clk.h>
> >  #include <linux/clk-provider.h>
> > -#include <linux/delay.h>
> > -#include <linux/io.h>
> > -#include <linux/module.h>
> > -#include <linux/nvmem-consumer.h>
> > -#include <linux/of_device.h>
> > -#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +#include <linux/regmap.h>
> >  #include <linux/phy/phy.h>
> > -#include <linux/slab.h>
> >
> I don't think it's good idea to move the common headers into .c files

Header files should be included directly by the file that uses facilities
provided by said header file. Required ones should not be transitively
included through other header files, as that introduces a subtle dependency.

Also, needlessly including header files in places that aren't using them
increases build time. See the 2000+ patch series from Ingo Molnar [1]
increasing build performance by cleaning up header files.

ChenYu

[1] https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/

> >  struct mtk_mipitx_data {
> >       const u32 mppll_preserve;
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
