Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB6C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whEo3FlJzvrCgsZU2Vky7sq+5FTXkctNcdlBeQtXQAo=; b=eLQ0ezZ9hNtTcbqJoDiI+0o+2F
	QYI9PB1PEvHHYGuU76qY++y6tsTk0zcCR9N89iYce8uV47l0/bj/Ql5WsOEEPEsEdAgZ/+NHh5MDI
	eRAG7sqQtGLjS8SUj8hRiJkiWqUTYOgDQKCZcDIzs3PAN2IDkXserBp4OvGHTUlWlq5Qg7APyMQiq
	RrPgXL33J0RTxpjVpfWEJufB+dkE42APZM/sEw+quP+OnkUjzrYPXuAizJXbHqZULRVrrMrgdoQb0
	o/Oa0AOz1kwqYaOzUzFB7P7bdpI6YVH3p64jV3Dcr8YcCtGfn56pRJg/utU+rCEP9oYULRa7XNxpM
	Vr6pZ0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obcKT-002Xfu-6R; Fri, 23 Sep 2022 06:38:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obcGS-002Vjc-Rd; Fri, 23 Sep 2022 06:34:22 +0000
X-UUID: df9162e938de4efbac52a834b44b2004-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=whEo3FlJzvrCgsZU2Vky7sq+5FTXkctNcdlBeQtXQAo=;
	b=gSGirSlJfwnn1YUrcEkshxTt6ZFu6sBBZWKGmBhBlVUb3OznoLDEsrGzGI3mCqmYj2wUpZBB4EnlW62PY85dmLpf8b+Tu7WiEGYUvp5zyo6aCtd45sX2w5UygLeLlKRyC5MSP5lz2/ydVMWIbECot4evBKhxWh9RcdYCy+tEQtA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cd31a035-e039-4b26-bf6c-2429f83cc4c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:fe7cfae3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: df9162e938de4efbac52a834b44b2004-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1565659900; Thu, 22 Sep 2022 23:34:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 14:03:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Sep 2022 14:03:35 +0800
Message-ID: <50c77b7b4854037f927880dc8775392a7b2e59fc.camel@mediatek.com>
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
Date: Fri, 23 Sep 2022 14:03:35 +0800
In-Reply-To: <3d8fdcf5-c2cb-be63-48d5-d84d50aeace3@collabora.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
	 <20220920090038.15133-2-chunfeng.yun@mediatek.com>
	 <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
	 <a3f98aa1d3d10b76b1fb5e6c2e3d64cedd0bf127.camel@mediatek.com>
	 <3d8fdcf5-c2cb-be63-48d5-d84d50aeace3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_233420_944264_1BA8BB24 
X-CRM114-Status: GOOD (  23.80  )
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

On Thu, 2022-09-22 at 09:17 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/09/22 04:36, Chunfeng Yun ha scritto:
> > On Wed, 2022-09-21 at 10:15 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> > > > Due to FIELD_PREP() macro can be used to prepare a bitfield
> > > > value,
> > > > local ones can be remove; add the new helper to make bitfield
> > > > update
> > > > easier.
> > > > 
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > >    drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
> > > >    1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/phy/mediatek/phy-mtk-io.h
> > > > b/drivers/phy/mediatek/phy-mtk-io.h
> > > > index 500fcdab165d..a723d4afc9b4 100644
> > > > --- a/drivers/phy/mediatek/phy-mtk-io.h
> > > > +++ b/drivers/phy/mediatek/phy-mtk-io.h
> > > > @@ -8,6 +8,7 @@
> > > >    #ifndef __PHY_MTK_H__
> > > >    #define __PHY_MTK_H__
> > > >    
> > > > +#include <linux/bitfield.h>
> > > >    #include <linux/io.h>
> > > >    
> > > >    static inline void mtk_phy_clear_bits(void __iomem *reg, u32
> > > > bits)
> > > > @@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void
> > > > __iomem *reg, u32 mask, u32 val)
> > > >    	writel(tmp, reg);
> > > >    }
> > > >    
> > > > +/* field @mask should be constant and continuous */
> > > 
> > > "Field @mask shall be [...]"
> > >                ^^^^^
> > 
> > Ok, will modify it
> > 
> > > 
> > > > +static inline void mtk_phy_update_field(void __iomem *reg, u32
> > > > mask, u32 val)
> > > 
> > > ...so, (void __iomem *reg, const u32 mask, u32 val)
> > 
> > Maybe no need const, @mask will be checked it in compile time when
> > use FIELD_PREP(), means @mask is a constant value, but not a
> > variable.
> > 
> 
> Adding const is not *required*, but `mask` is, effectively, a
> constant, hence
> it fully makes sense to add const.
Prefer to leave it unchanged, there is no 'const' in
function mtk_phy_update_bits(), if add 'const', will cause build
warning. and FIELD_PREP() already do many checks in compile time.

Thanks

> 
> > Thanks
> > 
> > > 
> > > > +{
> > > > +	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
> > > > +}
> > > > +
> > > >    #endif
> > > 
> > > 
> 
> 
> 


