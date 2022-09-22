Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB3ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 02:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjK3+xpCe9u1MNFb+0HGnTV+whYp7DGiShsoGVeYjKA=; b=ZdwZ/RL4ttUhgxFGlrH95WhGgh
	CurWepHBKed83d5RmNMwrUd7mn9HMcKk8jASkqCSAaFrRJ48SYU7dMm09Uu/W9Cd+UNve8xHUdVK/
	eahKz47Nde+O1g2kLsqeexeb4Jz1fKAb/on1seX6epPeQ793OXFoCjjIkL8oYTXsSiTYGw6el5Wnf
	/SWq3g88tRFUo/nZqRViRxM8h800zKqnpogkMi8gr4uVqAatapyOsc8rdI7Fp+BN8QN0zUdXl8gZA
	KU+fMicXjwsUWmoJxjc1EWsr0mgyqaf0yZrNNxE4W689K4BXqEtpX1H6MIhd++FZpeisff0iHGslY
	uhYm7sRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCFc-00DBIz-VJ; Thu, 22 Sep 2022 02:47:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCFR-00DBGw-TH; Thu, 22 Sep 2022 02:47:35 +0000
X-UUID: f4b226194853444598910141fda3b2f4-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FjK3+xpCe9u1MNFb+0HGnTV+whYp7DGiShsoGVeYjKA=;
	b=cQNCiX/l0pmhvRPC7YkptnRyY+0hmrp62MXb6jHRBOBh1nH/dpVH8Gpq41xAW3SWV65rBm9GoBgrEJnIkizmkHD163oonOvwuDnV4Ok3rfCbyU8K8EJAF1xF8yCENtzwt3ivQzVRACW4+yYflf6wAB27SreCfOqtDTYOMXm8i3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:81a1b118-93e5-4b9d-977d-9fcfa6810efe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:5f833af7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f4b226194853444598910141fda3b2f4-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1234755833; Wed, 21 Sep 2022 19:36:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 10:36:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 10:36:17 +0800
Message-ID: <a3f98aa1d3d10b76b1fb5e6c2e3d64cedd0bf127.camel@mediatek.com>
Subject: Re: [PATCH 01/18] phy: mediatek: add a new helper to update bitfield
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Kishon Vijay Abraham I
	<kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, "Stanley
 Chu" <stanley.chu@mediatek.com>
Date: Thu, 22 Sep 2022 10:36:17 +0800
In-Reply-To: <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
	 <20220920090038.15133-2-chunfeng.yun@mediatek.com>
	 <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_194733_964593_ADCC394B 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, 2022-09-21 at 10:15 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> > Due to FIELD_PREP() macro can be used to prepare a bitfield value,
> > local ones can be remove; add the new helper to make bitfield
> > update
> > easier.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-io.h
> > b/drivers/phy/mediatek/phy-mtk-io.h
> > index 500fcdab165d..a723d4afc9b4 100644
> > --- a/drivers/phy/mediatek/phy-mtk-io.h
> > +++ b/drivers/phy/mediatek/phy-mtk-io.h
> > @@ -8,6 +8,7 @@
> >   #ifndef __PHY_MTK_H__
> >   #define __PHY_MTK_H__
> >   
> > +#include <linux/bitfield.h>
> >   #include <linux/io.h>
> >   
> >   static inline void mtk_phy_clear_bits(void __iomem *reg, u32
> > bits)
> > @@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void
> > __iomem *reg, u32 mask, u32 val)
> >   	writel(tmp, reg);
> >   }
> >   
> > +/* field @mask should be constant and continuous */
> 
> "Field @mask shall be [...]"
>               ^^^^^
Ok, will modify it

> 
> > +static inline void mtk_phy_update_field(void __iomem *reg, u32
> > mask, u32 val)
> 
> ...so, (void __iomem *reg, const u32 mask, u32 val)
Maybe no need const, @mask will be checked it in compile time when
use FIELD_PREP(), means @mask is a constant value, but not a variable.

Thanks

> 
> > +{
> > +	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
> > +}
> > +
> >   #endif
> 
> 


