Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNAci5GAVABeId4pBToLyM/zuDhyh3VLa8L85cGywBY=; b=l3N+Zd4cg6lFS0
	IhTnBlVtAnLcBTK+tDw1nCcPsEXeWnu70aVSbMmZO+w26muY7wwDRjmJ4cQ6xWT+Uwyzy/XIDKWYa
	+L2CJv2jCf5tmizAVrIajh1O32EQOa6CXA4OiP39/gyb36MyE1cBvdonySC4mu605innDur4y2Ffg
	uKY+wscV03pwzUzM4IE9cmeqgCiyp+rZxwp9MXImIdmqsSlf/7SCRcMEllFzdxMDAy1yvV9XaAeeM
	gGxRXQ5YmP9LIMjzCEHpxNHsd3m7J26ByzpmPBeC6WgCCE9Baw+ZpkmixXuBHhXlzwNEpKTVWUX0f
	5ZJqj5MEDHpgS82x0z2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6sP7-00Azhg-VD; Mon, 10 Jan 2022 10:59:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6sP3-00Azet-Jo; Mon, 10 Jan 2022 10:59:56 +0000
X-UUID: 0170306191af4461a0dde774c598625f-20220110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e1z2vW+dG3mYjPQm+86HzhOk/HJ1TwPQIuflxBd9i2o=; 
 b=nCNoallw6Lv1wNFN06Qa9Ea8Dr503mq9PgqkPq27vzdknqND1LxR7+YwRoBp8onOR3riDDuDy28YhWojegTNQMX6OrVa8LcxiShJ3CIVLm8QCmNniKEt/5N2rjOiy1r25oVwEvoPUG8SJArZpfkjuNdj0ZejfX1V8h8eshK2qTw=;
X-UUID: 0170306191af4461a0dde774c598625f-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1265538345; Mon, 10 Jan 2022 03:59:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 02:59:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 18:59:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 18:59:42 +0800
Message-ID: <83400d36640fc6256972041c882d080ce9aa5fdd.camel@mediatek.com>
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
 <anan.sun@mediatek.com>, <yen-chang.chen@mediatek.com>
Date: Mon, 10 Jan 2022 18:59:42 +0800
In-Reply-To: <85987e9a-dfb0-c241-1dde-43c050a78b51@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-10-yong.wu@mediatek.com>
 <bfa33e94-c2e5-5dab-c9af-b674e1669daa@collabora.com>
 <22faee018a36a49e4a507b69d087432c8cd689ec.camel@mediatek.com>
 <85987e9a-dfb0-c241-1dde-43c050a78b51@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_025955_070983_4D8E4DE6 
X-CRM114-Status: GOOD (  32.26  )
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

On Mon, 2022-01-10 at 10:16 +0100, AngeloGioacchino Del Regno wrote:
> Il 09/01/22 03:48, Yong Wu ha scritto:
> > On Tue, 2022-01-04 at 16:55 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 23/09/21 13:58, Yong Wu ha scritto:
> > > > The tlb_sync_all is called from these three functions:
> > > > a) flush_iotlb_all: it will be called for each a iommu HW.
> > > > b) tlb_flush_range_sync: it already has for_each_m4u.
> > > > c) in irq: When IOMMU HW translation fault, Only need flush
> > > > itself.
> > > > 
> > > > Thus, No need for_each_m4u in this tlb_sync_all. Remove it.
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >    drivers/iommu/mtk_iommu.c | 18 +++++++-----------
> > > >    1 file changed, 7 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/mtk_iommu.c
> > > > b/drivers/iommu/mtk_iommu.c
> > > > index 6f4f6624e3ac..0b4c30baa864 100644
> > > > --- a/drivers/iommu/mtk_iommu.c
> > > > +++ b/drivers/iommu/mtk_iommu.c
> > > > @@ -206,19 +206,15 @@ static struct mtk_iommu_domain
> > > > *to_mtk_domain(struct iommu_domain *dom)
> > > >    
> > > >    static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data
> > > > *data)
> > > >    {
> > > > -	struct list_head *head = data->hw_list;
> > > > -
> > > > -	for_each_m4u(data, head) {
> > > > -		if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > > > -			continue;
> > > > +	if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > > > +		return;
> > > >    
> > > > -		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > > > -			       data->base + data->plat_data-
> > > > > inv_sel_reg);
> > > > 
> > > > -		writel_relaxed(F_ALL_INVLD, data->base +
> > > > REG_MMU_INVALIDATE);
> > > > -		wmb(); /* Make sure the tlb flush all done */
> > > > +	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > > > +		       data->base + data->plat_data-
> > > > >inv_sel_reg);
> > > > +	writel_relaxed(F_ALL_INVLD, data->base +
> > > > REG_MMU_INVALIDATE);
> > > > +	wmb(); /* Make sure the tlb flush all done */
> > > 
> > > There aren't a lot of writes here - not anymore, since you are no
> > > longer doing
> > > this for_each_m4u()...
> > > ...so, please change writel_relaxed() to writel() calls, allowing
> > > you
> > > to also
> > > remove the write barrier at the end (since in the non relaxed
> > > version, order is already ensured).
> > 
> > In the "writel", the "__iowmb()" runs before "write_relaxed". Then
> > how
> > to guarantee the last register was wrote into the HW. Here the
> > flush
> > all don't have sync(waiting it complete)
> > 
> 
> That's right, I'm sorry for the invalid proposal.
> 
> Though, there's something else to mention here... if writing
> (F_INVLD_EN1 | F_INVLD_EN0) to inv_sel_reg is *required* to happen
> before
> writing F_ALL_INVLD to REG_MMU_INVALIDATE (which I think is exactly
> the
> case here), then, in order to ensure write ordering, you should still
> use
> writel() instead of the relaxed accessor; after which, since (as you
> mentioned)
> there is no sync readback loop, you can keep that wmb() at the end.

The writel_relaxed also makes sure the order. I did try this:


https://patchwork.kernel.org/project/linux-mediatek/patch/1570627143-29441-3-git-send-email-yong.wu@mediatek.com/

> 
> > > 
> > > >    
> > > > -		pm_runtime_put(data->dev);
> > > > -	}
> > > > +	pm_runtime_put(data->dev);
> > > >    }
> > > >    
> > > >    static void mtk_iommu_tlb_flush_range_sync(unsigned long
> > > > iova,
> > > > size_t size,
> > > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
