Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3463FCA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9BE21655
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cyzQ0upj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9BE21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gP8I1H45nR9bjd/uM4MCiRf1nKeU3reZaUWhI4lD6W0=; b=cyzQ0upjnndQg8
	QR6oD4w/TUwqOL4J+WG6ZGVwepUce6Rble2UkRRmGV7DDEa1I6HnsRlmUdIG/ehEnTo5WDKIr1LQI
	++3E5hxbp7jgDStndhKf1yWTPU3gMtmJgpfTKSNVrICi7Sb7WF1dgL/PQptP/MRDvyabQn0UtEVyc
	EvGhAT+bQgpJJEEuhho9ZgtP1w+FdP/AjeKq6vDeYe5aN9FR6WKbJXsp4hpQtlmSsO/mwJGFEQwEy
	Eh2dptui7kJTIix8DyO6THI5lXk0nz0n+Zetnt0EoBDOxC2kj1J0fV2IeAapwPaPMPdB7TgWSJ04G
	XJEuR5xtrec1oc9Lvssw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXSX-0006RI-Sg; Thu, 24 Oct 2019 07:23:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXSD-0005z6-AC; Thu, 24 Oct 2019 07:22:42 +0000
X-UUID: c3db00983a284a6d89a80c4adfa00a3d-20191023
X-UUID: c3db00983a284a6d89a80c4adfa00a3d-20191023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 920150192; Wed, 23 Oct 2019 23:22:20 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 00:22:33 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 24 Oct 2019 15:22:31 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 15:22:30 +0800
Message-ID: <1571901752.19130.135.camel@mhfsdcap03>
Subject: Re: [PATCH v4 3/7] iommu/mediatek: Use gather to achieve the tlb
 range flush
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Thu, 24 Oct 2019 15:22:32 +0800
In-Reply-To: <20191023165543.GB27471@willie-the-truck>
References: <1571196792-12382-1-git-send-email-yong.wu@mediatek.com>
 <1571196792-12382-4-git-send-email-yong.wu@mediatek.com>
 <20191023165543.GB27471@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B3428B34711F9D4340351C5FBF71C7D9A7707DD264962EFF9A5C5A10E427B3F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_002241_358657_A06BBCE1 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, Nicolas
 Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, edison.hsieh@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-10-23 at 17:55 +0100, Will Deacon wrote:
> On Wed, Oct 16, 2019 at 11:33:08AM +0800, Yong Wu wrote:
> > Use the iommu_gather mechanism to achieve the tlb range flush.
> > Gather the iova range in the "tlb_add_page", then flush the merged iova
> > range in iotlb_sync.
> > 
> > Suggested-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index c2f6c78..81ac95f 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -245,11 +245,9 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >  					    void *cookie)
> >  {
> >  	struct mtk_iommu_data *data = cookie;
> > -	unsigned long flags;
> > +	struct iommu_domain *domain = &data->m4u_dom->domain;
> >  
> > -	spin_lock_irqsave(&data->tlb_lock, flags);
> > -	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
> > -	spin_unlock_irqrestore(&data->tlb_lock, flags);
> > +	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
> 
> You need to be careful here, because iommu_iotlb_gather_add_page() can
> call iommu_tlb_sync() in some situations and you don't hold the lock.

The mtk_iommu_iotlb_sync below already has the lock in it, so I delete
the lock here.

> 
> >  static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> > @@ -469,9 +467,15 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
> >  				 struct iommu_iotlb_gather *gather)
> >  {
> >  	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
> > +	size_t length = gather->end - gather->start;
> >  	unsigned long flags;
> >  
> > +	if (gather->start == ULONG_MAX)
> > +		return;
> > +
> >  	spin_lock_irqsave(&data->tlb_lock, flags);
> > +	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
> > +				       false, data);
> >  	mtk_iommu_tlb_sync(data);
> >  	spin_unlock_irqrestore(&data->tlb_lock, flags);
> 
> Modulo my comment above, this fixes my previous comment. Given that mainline
> is already broken, I guess the runtime bisectability isn't a problem.

As the reply in [2/7]. the mainline is not broken after [2/7], it only
go to the previous status before commit(4d689b619445).

After using the iommu_gather, the iova will be the merged range in this
iotlb_sync, it is just fit to do the tlb-flush/tlb-sync. then it fixes
our potential issue(No tlb-sync for the previous tlb-flush range).

> 
> Will



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
