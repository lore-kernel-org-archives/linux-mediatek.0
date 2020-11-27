Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B023DC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:22:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36018221FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwkptnpT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rSoryBLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36018221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w5JE7y+QBAttOQZMD4bMCzFOks4M8HqC/7EXVj0JSsc=; b=SwkptnpTKcBUKRYKhVwUalRk6
	Bwn5knBjeawjgx+rgxzSYsbqhqOZQoHv+stbAnXgS0s1v3b//JKRLPOsJVN1HwJ7iQ8ThJReHbPrU
	J7wKnfaucCSYP9rXzVS23UK6FzzUm7wOEyrzC7NlAnR5N0tz9QEDuBHPYLB++msFezT90D/ncl+vh
	QplBu4fuhBKSI0Mu340gpZLX4dJ/1PJYRfWBon83QofAgYrGG919UOQlhG0AIqNzhAshfpneeq952
	dxjw6YMZQblfjsc+VT73oC5cIZ9Znf1a/ywrZhbWyvNbCgb7hPtjEzQECe6ht7e4mC9AGCP2/ZkY2
	MqP2Iz8jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiX8f-0005sY-KZ; Fri, 27 Nov 2020 06:21:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiX8a-0005pr-Ci; Fri, 27 Nov 2020 06:21:45 +0000
X-UUID: a9f74f4536bd435083ad869a475bb7bd-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k6991k1USSeF9xBY2RrFpj24tWMV0+Y0E7njcNgEzrA=; 
 b=rSoryBLVHnFriwI3Qs7ZufeGHicLmFLdtkI6rcwUqGH175aMaLER4Hkj69cOuhwxDmnbPXjpg+Rs9w1PckK6vl6iXu+ggwYIpCBanyJMJO/1JF8hhMgS6rs7t0qcAry/MK8wIGV1oJhnjxaDNlW2i79RGHaXJFIeFQYxE8MP1lo=;
X-UUID: a9f74f4536bd435083ad869a475bb7bd-20201126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1934430638; Thu, 26 Nov 2020 22:21:39 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 22:21:36 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 14:21:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 14:21:31 +0800
Message-ID: <1606458092.26323.192.camel@mhfsdcap03>
Subject: Re: [PATCH v4 17/24] iommu/mediatek: Add single domain
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 27 Nov 2020 14:21:32 +0800
In-Reply-To: <22e49f08-6d23-86cf-bb9c-79d54ce55beb@arm.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-18-yong.wu@mediatek.com>
 <22e49f08-6d23-86cf-bb9c-79d54ce55beb@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFD6FF2D0FFC111E8E3A9221E6491E4E883A7AD97F964DC7A2DB8863C42809542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_012144_628274_519D3A68 
X-CRM114-Status: GOOD (  22.42  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-26 at 17:11 +0000, Robin Murphy wrote:
> On 2020-11-11 12:38, Yong Wu wrote:
> > Defaultly the iova range is 0-4G. here we add a single-domain(0-4G)
> > for the previous SoC. this also is a preparing patch for supporting
> > multi-domains.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index bf3f4e0f4748..a7727a3899d1 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -161,6 +161,10 @@ struct mtk_iommu_iova_region {
> >   	unsigned long long	size;
> >   };
> >   
> > +static const struct mtk_iommu_iova_region single_domain[] = {
> > +	{.iova_base = 0,		.size = SZ_4G},
> > +};
> 
> Hang on, given how the previous patch works, surely this means you're 
> now going to *reserve* the entire address space? That doesn't seem 
> right... :/

Could you help share more? in which case it is not right?

In the code:
domain->geometry.aperture_end = iova_base + size - 1. 

this is same with DMA_BIT_MASK(32). It looks don't change anything.

> 
> Robin.
> 
> > +
> >   /*
> >    * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
> >    * for the performance.
> > @@ -922,6 +926,8 @@ static const struct mtk_iommu_plat_data mt2712_data = {
> >   	.m4u_plat     = M4U_MT2712,
> >   	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
> >   };
> >   
> > @@ -929,6 +935,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
> >   	.m4u_plat      = M4U_MT6779,
> >   	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
> >   	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
> > +	.iova_region   = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
> >   };
> >   
> > @@ -944,6 +952,8 @@ static const struct mtk_iommu_plat_data mt8173_data = {
> >   	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> >   			HAS_LEGACY_IVRP_PADDR,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
> >   };
> >   
> > @@ -951,6 +961,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
> >   	.m4u_plat     = M4U_MT8183,
> >   	.flags        = RESET_AXI,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
> >   };
> >   
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
