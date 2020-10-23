Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E800C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 06:05:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8698221775
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 06:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vty6LBZZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gwit8wZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8698221775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvj/hjt3gj2mjgMOCxg0Y+3XGSwM9qffDG2/INIzukc=; b=Vty6LBZZrj1qzMcQbjPdQgpfc
	xhoSwtuB0gJRlpwamt1O6yfFfmpPyfz93i9sNwLtdK15UEl9Tthc4OUd2tkq3PSZVG/FZ0PIkVreK
	vJjPTfMQ6OsPgtNZFrnJPCYrO9RPOUkCYXOPuN18crr/prcJmdwwE1G9OrFYQc1fmf77w5gA+PTp/
	eJGqb6lQUzbvhGYBK0MY6qMIWBSbLZmmI2g1Bl8PdO8vxfsjgCt/X4mq4bpBEhaDOl478SVLowkqv
	kErQzIq3wLKliyxtSIWUd9IcUU4VrjGwM28qwoZQUK/RvjYwEuKxpHUERmh7tytRsZmgRcAvvCWH9
	DRutNg45A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVqC6-0004il-DS; Fri, 23 Oct 2020 06:04:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVqC1-0004hp-22; Fri, 23 Oct 2020 06:04:50 +0000
X-UUID: 17bbb5a2b130491ab58f9d19b8f2bf69-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lH/fAKl+nvEoU7Skw3vE5YheKD9t/B0oqKliE0vzg1A=; 
 b=Gwit8wZryELP+BwrT4Ik4ryyDWTgSvmO9HKnyGjmlgkquglCM42EJFcuUgCOscXbPng+5QtJca10V/v0U1QRmEV12kCgP1H9goRI53zc32xAB6BP5ciGJRXwzJLaQWOn4Oo72dMgIOe436ZngtUKsykkuItvz+pDi0M762lK9+Q=;
X-UUID: 17bbb5a2b130491ab58f9d19b8f2bf69-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502723255; Thu, 22 Oct 2020 22:04:41 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 23:04:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 14:04:31 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 14:04:31 +0800
Message-ID: <1603432677.2024.3.camel@mbjsdccf07>
Subject: Re: [PATCH 2/4] iommu/mediatek: Add iotlb_sync_range() support
From: chao hao <Chao.Hao@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 23 Oct 2020 13:57:57 +0800
In-Reply-To: <7fbe0305-91e4-949e-7d84-bf91e81d6b27@arm.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
 <20201019113100.23661-3-chao.hao@mediatek.com>
 <7fbe0305-91e4-949e-7d84-bf91e81d6b27@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC5627839FE2C07D6347EA6BEF454BC7E6659A3C76B307EF4A2A088B5303E3F32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_020449_876158_3670258E 
X-CRM114-Status: GOOD (  31.62  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-21 at 17:55 +0100, Robin Murphy wrote:
> On 2020-10-19 12:30, Chao Hao wrote:
> > MTK_IOMMU driver writes one page entry and does tlb flush at a time
> > currently. More optimal would be to aggregate the writes and flush
> > BUS buffer in the end.
> 
> That's exactly what iommu_iotlb_gather_add_page() is meant to achieve. 
> Rather than jumping straight into hacking up a new API to go round the 
> back of the existing API design, it would be far better to ask the 
> question of why that's not behaving as expected.

Thanks for you review!

iommu_iotlb_gather_add_page is put in io_pgtable_tlb_add_page().
io_pgtable_tlb_add_page() only be called in
unmapping and mapping flow doesn't have it in linux iommu driver, but
mtk iommu needs to do tlb sync in mapping
and unmapping to avoid old data being in the iommu tlb.

In addtion, we hope to do tlb sync once when all the pages mapping done.
iommu_iotlb_gather_add_page maybe do
tlb sync more than once. because one whole buffer consists of different
page size(1MB/64K/4K).

Based on the previous considerations,  don't find more appropriate the
way of tlb sync for mtk iommu, so we add a new API.

> 
> > For 50MB buffer mapping, if mtk_iommu driver use iotlb_sync_range()
> > instead of tlb_add_range() and tlb_flush_walk/leaf(), it can increase
> > 50% performance or more(depending on size of every page size) in
> > comparison to flushing after each page entry update. So we prefer to
> > use iotlb_sync_range() to replace iotlb_sync(), tlb_add_range() and
> > tlb_flush_walk/leaf() for MTK platforms.
> 
> In the case of mapping, it sounds like what you actually want to do is 
> hook up .iotlb_sync_map and generally make IO_PGTABLE_QUIRK_TLBI_ON_MAP 
> cleverer, because the current implementation is as dumb as it could 
> possibly be. 

iotlb_sync_map only has one parameter(iommu_domain), but mtk
iommu_domain maybe include the whole iova space, if mtk_iommu to do tlb
sync based on iommu_domain, it is equivalent to do tlb flush all in
fact.
iommu driver will do tlb sync in every mapping page when mtk iommu sets
IO_PGTABLE_QUIRK_TLBI_ON_MAP(io_pgtable_tlb_flush_walk),
as is the commit message mentioned, it will drop mapping performance in
mtk platform.


> In fact if we simply passed an address range to 
> .iotlb_sync_map, io-pgtable probably wouldn't need to be involved at all 
> any more.

I know it is not a good idea probably by adding a new api, but I found
out that tlb sync only to be done after mapping one page, so if
mtk_iommu hope to do tlb sync once after all the pages map done, could
you give me some advices? thanks!

> 
> Robin.
> 
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 785b228d39a6..d3400c15ff7b 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -224,6 +224,11 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   	}
> >   }
> >   
> > +static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
> > +{
> > +	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
> > +}
> > +
> >   static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >   					    unsigned long iova, size_t granule,
> >   					    void *cookie)
> > @@ -536,6 +541,7 @@ static const struct iommu_ops mtk_iommu_ops = {
> >   	.map		= mtk_iommu_map,
> >   	.unmap		= mtk_iommu_unmap,
> >   	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
> > +	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
> >   	.iotlb_sync	= mtk_iommu_iotlb_sync,
> >   	.iova_to_phys	= mtk_iommu_iova_to_phys,
> >   	.probe_device	= mtk_iommu_probe_device,
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
