Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57083C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 02:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAf3vDc876HYXTCrlWn33ArVnSfKz1AfkOdeRI+9qmI=; b=V8RQ+nzfRg6OzQ
	wxrC+XbeFSgVkUMOHaRqtNJrXU7XKV5mN+zPzQVibtRhSro1WiSe6U53T90N/NJmlPnuxdjM8NHM8
	v1al/t2nn5Fwxwmm+MFfCu4opKmdevIwYWvd5J2+JG0ae/vRx+KkcZcf/QtYKwWs+/dUh11d/mf1G
	AVUX5euX9E4jRzoSzgnZgBGRbNP/qTAeNlwLoJdVorq07MEyb3+iqqyAAvhW5nPHu1WGrhxxjiKVw
	j1ZF7OcaNJJ9XVFe1B5iifV+x+UMvjluc/a/JFgUrbOds+8V/Az2N1/We3+kzLgrpkkLuXSjpaUBF
	YdWDVpUnbM+iFT0bMfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6OG9-007GC9-5T; Sun, 09 Jan 2022 02:48:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6OG7-007GB3-3q; Sun, 09 Jan 2022 02:48:40 +0000
X-UUID: e2e63ad61d004f0e88f856bc1fbce98b-20220108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qlJvrm9XIk8Kawkl//6ihgSHy7alnGfFMB7oe/H5SBQ=; 
 b=uRR/zKLJVW9hiO7huJnSZHOUb1X1mWD1A7O9eASpWy3sfjOY+6ys5mLgFIy91Ws5LyhDrUf8DW3XJXQ0iQ5FWJ0wZvotivOil4q4qGqLI4l8xaLjad8hdITVibcZ/c0cj8YtEyNB5nrq8mYws5DdCPBR0Yvoq1PQ6Bz05/iAFQY=;
X-UUID: e2e63ad61d004f0e88f856bc1fbce98b-20220108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1955485108; Sat, 08 Jan 2022 19:48:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 18:48:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 9 Jan 2022 10:48:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 9 Jan 2022 10:48:27 +0800
Message-ID: <22faee018a36a49e4a507b69d087432c8cd689ec.camel@mediatek.com>
Subject: Re: [PATCH v3 09/33] iommu/mediatek: Remove for_each_m4u in
 tlb_sync_all
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <yen-chang.chen@mediatek.com>
Date: Sun, 9 Jan 2022 10:48:27 +0800
In-Reply-To: <bfa33e94-c2e5-5dab-c9af-b674e1669daa@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-10-yong.wu@mediatek.com>
 <bfa33e94-c2e5-5dab-c9af-b674e1669daa@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_184839_181549_ECDA3193 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, 2022-01-04 at 16:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/09/21 13:58, Yong Wu ha scritto:
> > The tlb_sync_all is called from these three functions:
> > a) flush_iotlb_all: it will be called for each a iommu HW.
> > b) tlb_flush_range_sync: it already has for_each_m4u.
> > c) in irq: When IOMMU HW translation fault, Only need flush itself.
> > 
> > Thus, No need for_each_m4u in this tlb_sync_all. Remove it.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 18 +++++++-----------
> >   1 file changed, 7 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 6f4f6624e3ac..0b4c30baa864 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -206,19 +206,15 @@ static struct mtk_iommu_domain
> > *to_mtk_domain(struct iommu_domain *dom)
> >   
> >   static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
> >   {
> > -	struct list_head *head = data->hw_list;
> > -
> > -	for_each_m4u(data, head) {
> > -		if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > -			continue;
> > +	if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > +		return;
> >   
> > -		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > -			       data->base + data->plat_data-
> > >inv_sel_reg);
> > -		writel_relaxed(F_ALL_INVLD, data->base +
> > REG_MMU_INVALIDATE);
> > -		wmb(); /* Make sure the tlb flush all done */
> > +	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > +		       data->base + data->plat_data->inv_sel_reg);
> > +	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> > +	wmb(); /* Make sure the tlb flush all done */
> 
> There aren't a lot of writes here - not anymore, since you are no
> longer doing
> this for_each_m4u()...
> ...so, please change writel_relaxed() to writel() calls, allowing you
> to also
> remove the write barrier at the end (since in the non relaxed
> version, order is already ensured).

In the "writel", the "__iowmb()" runs before "write_relaxed". Then how
to guarantee the last register was wrote into the HW. Here the flush
all don't have sync(waiting it complete)

> 
> >   
> > -		pm_runtime_put(data->dev);
> > -	}
> > +	pm_runtime_put(data->dev);
> >   }
> >   
> >   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova,
> > size_t size,
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
