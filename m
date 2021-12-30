Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6wYpmHPRhM06eZfQ9N6dqljWuKAGmdSRLulWiin3OM=; b=rTaG1e9oWb75L5
	xUfa/HIJuNjh8HH9rWghkArvXxNT+1uHyrPCANsWRqU+aQ6DlWMlvIirw1B0MGc5mKvKC+Zu5D30u
	mvHl9gfYwbDdOezF8PggWebJ/BXpggL4uze6Pk6QAe7HWE3if20vEbKQiMzF9lz0Uv75YK7ZrkEIG
	p/vV0hkzpc5H3GqH0WGRgd8IhMK3/HZAu22EVXJklxyjYlvrTC7eESRtGZ7PDPvPiStgwCqXDZPWh
	laQCBzFEQsHCzM7GItmktaRZctnLXPO3pLNZEQHRVNKu578tQ9cQTlKR0f1I5i1BwLQE1hopt2nhD
	vzJcTmU91P7igPmuS8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kqM-003a7Z-8s; Thu, 30 Dec 2021 02:07:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kq4-003a51-4O; Thu, 30 Dec 2021 02:06:45 +0000
X-UUID: be106e29c5b84e1f9eb24c33baa8a579-20211229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sPOTvMuDJjvlDzy7nqG24GE8k+hFonDBmuW7nB8SSCA=; 
 b=HudQ/kUfDno2Ih1Z6V+bVFQ4AOGSI6DrObbZ3T3M+HkBvBGCNRlWqQasPC3clArbHRlWPZALrcEXwYB6910i5/BY2hmwp+l1dSf6Zv6iELf3SAWB4GSS5R9bzjGvISagU5YMMjViO3zrzqpNvJhUN92fdKzC5NTbHYzGBRjLnlM=;
X-UUID: be106e29c5b84e1f9eb24c33baa8a579-20211229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1615845474; Wed, 29 Dec 2021 19:06:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Dec 2021 18:06:33 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 30 Dec 2021 10:06:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Dec 2021 10:06:30 +0800
Message-ID: <75b2773d1d170f42bae0774dbc58d1458cb25502.camel@mediatek.com>
Subject: Re: [PATCH v2 3/5] phy: mediatek: add helpers to update bits of
 registers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Thu, 30 Dec 2021 10:06:31 +0800
In-Reply-To: <047803b9-d09f-d4f8-a674-317cc19dd055@collabora.com>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
 <20211218082802.5256-3-chunfeng.yun@mediatek.com>
 <047803b9-d09f-d4f8-a674-317cc19dd055@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_180644_217983_D3745502 
X-CRM114-Status: GOOD (  22.67  )
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

On Fri, 2021-12-24 at 11:10 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/12/21 09:28, Chunfeng Yun ha scritto:
> > Add three helpers mtk_phy_clear/set/update_bits() for registers
> > operation
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: new patch, add register access helpers,
> >      Add updatel() macro suggested by Vinod, here add more ones
> > instead.
> > ---
> >   drivers/phy/mediatek/phy-mtk-io.h | 38
> > +++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> >   create mode 100644 drivers/phy/mediatek/phy-mtk-io.h
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-io.h
> > b/drivers/phy/mediatek/phy-mtk-io.h
> > new file mode 100644
> > index 000000000000..500fcdab165d
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-io.h
> > @@ -0,0 +1,38 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + *
> > + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > + */
> > +
> > +#ifndef __PHY_MTK_H__
> > +#define __PHY_MTK_H__
> > +
> > +#include <linux/io.h>
> > +
> > +static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
> > +{
> > +	u32 tmp = readl(reg);
> > +
> > +	tmp &= ~bits;
> > +	writel(tmp, reg);
> > +}
> > +
> > +static inline void mtk_phy_set_bits(void __iomem *reg, u32 bits)
> > +{
> > +	u32 tmp = readl(reg);
> > +
> > +	tmp |= bits;
> > +	writel(tmp, reg);
> > +}
> > +
> > +static inline void mtk_phy_update_bits(void __iomem *reg, u32
> > mask, u32 val)
> > +{
> > +	u32 tmp = readl(reg);
> > +
> > +	tmp &= ~mask;
> > +	tmp |= val & mask;
> > +	writel(tmp, reg);
> > +}
> > +
> > +#endif
> > 
> 
> These helpers are almost exactly duplicating what
> regmap_update_bits() is doing.
> I appreciate the effort to stop open-coding the same sequences over
> and over by
> adding such helper functions, 
I agree with you.
> but I think that the proper way of doing what you
> are proposing is not to add custom functions but rather reuse what
> the Linux APIs
> give you.
I also like to use common APIs ASAP, but not found suitable ones.
This may be a problem, I found that some similar custom helps already
added under phy fold.

> 
> What about doing a conversion to use regmap on this driver?
No, we don't use regmap here, these registers are monopolized by t-phy, 
it's not syscon.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
