Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0364C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 641D720674
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y59i60Xr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FY5oJK5M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 641D720674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nEToVu3KlsPdbNDIac0PTrGVbklOVZk1syXEWasD8ic=; b=Y59i60XrDNFhIzBOo5WU5KXFi
	vYtCzVau4JU4jSu8AfOxWyHdgfp6/yw6DEOs81/fdMOuXzMxqT9DtXSC7h84e5hYpDnJjSW1oSuxy
	j1bgadXxSzxC+LyQrDU4bzZfBlyGV+PqCV0jHUKYG0rDKRelo2JVOEALKfby+O+Lg0Nla8GJBMOqp
	NHZqyMyOexSTj1dVgLOW6qugS58nH3IdcMdWqS7M97Vjln1UjkQ2EYTMUvosBREq+k6n4uRcrAV+a
	hjspjZTqOzVjuLWo3psxfGRvHTf9hDpQhRCX6aU23dSI6O/hidr9ipAiSogPKsze0C5sl/0J0wzQA
	lGNN0PVVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWx9B-0000tZ-Ug; Mon, 26 Oct 2020 07:42:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWx99-0000so-Ba; Mon, 26 Oct 2020 07:42:28 +0000
X-UUID: 8e20be91348a4410994d3aa42ad56312-20201025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KDA+LpW6FDBz49qbTaYvO3XwD3JWyDQOAMzmFaf86MU=; 
 b=FY5oJK5ML6A3RSr6mGVfmfhTB1aflx+0ZvdApeiQLyv1j+ENNIHC9NgCmXjSVJP2h1LEiwu3vRLyWu3hzzPbW6MLaqvpfiFQSh+YjdXGWzGHSUxn04M0SweaLuE08TXzzkXj9+zU4+b3kqYPXkjXRIfcPfPX4l0X5QIQPrhRLxg=;
X-UUID: 8e20be91348a4410994d3aa42ad56312-20201025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 815386442; Sun, 25 Oct 2020 23:42:03 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 00:42:01 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 26 Oct 2020 15:41:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 15:41:22 +0800
Message-ID: <1603698083.26323.87.camel@mhfsdcap03>
Subject: Re: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable
 for MediaTek
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Mon, 26 Oct 2020 15:41:23 +0800
In-Reply-To: <a5713949-1d95-40f1-d35d-d99735b48294@arm.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-12-yong.wu@mediatek.com>
 <a5713949-1d95-40f1-d35d-d99735b48294@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 020A65BDCF4EA27467567D031B54810B516A69E7C2B6BB71FC4C0F5EDD0582DF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_034227_546086_9C295E00 
X-CRM114-Status: GOOD (  25.01  )
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
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 15:10 +0100, Robin Murphy wrote:
> On 2020-09-30 08:06, Yong Wu wrote:
> > The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
> > (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
> > 34bit.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
> >   drivers/iommu/mtk_iommu.c          |  2 +-
> >   2 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index 8362fdf76657..306bae2755ed 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -50,10 +50,17 @@
> >    */
> >   #define ARM_V7S_ADDR_BITS		32
> >   #define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> > +/* MediaTek: totally 34bits, 14bits at lvl1 and 8bits at lvl2. */
> > +#define _ARM_V7S_LVL_BITS_MTK(lvl)	(20 - (lvl) * 6)
> 
> This should defined in terms of both lvl and cfg->ias. The formula here 
> is nothing more than a disgusting trick I made up since a linear 
> interpolation happened to fit the required numbers. That said, all of 
> these bits pretending that short-descriptor is a well-defined recursive 
> format only served to allow the rest of the code to look more like the 
> LPAE code - IIRC they've already diverged a fair bit since then, so 
> frankly a lot of this could stand to be unpicked and made considerably 
> clearer by simply accepting that level 1 and level 2 are different from 
> each other.

If the formula is not good and make it clearer, How about this?


/*
 * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level
2,
-* and 12 bits in a page. With some carefully-chosen coefficients we can
-* hide the ugly inconsistencies behind these macros and at least let
the
-* rest of the code pretend to be somewhat sane.
+* and 12 bits in a page.
+*
+* MediaTek extend 2 bits to reach 34 bits, 14 bits at lvl1 and 8 bits
at lvl2.
 */

-#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
+#define _ARM_V7S_LVL1_BITS_NR(cfg)     (((cfg)->ias == 32) ? 12 : 14)
+#define _ARM_V7S_LVL2_BITS_NR		8
+
+#define _ARM_V7S_LVL_BITS(lvl, cfg)    \
+      (((lvl) == 1) ? _ARM_V7S_LVL1_BITS_NR(cfg):_ARM_V7S_LVL2_BITS_NR)

> Robin.
> 
> >   #define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
> >   #define ARM_V7S_TABLE_SHIFT		10
> >   
> > -#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl))
> > +#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	({				\
> > +	int _lvl = lvl;							\
> > +	!arm_v7s_is_mtk_enabled(cfg) ?					\
> > +	 (1 << _ARM_V7S_LVL_BITS(_lvl)) : (1 << _ARM_V7S_LVL_BITS_MTK(_lvl));\
> > +})
> > +
> >   #define ARM_V7S_TABLE_SIZE(lvl, cfg)					\
> >   	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
> >   
> > @@ -63,7 +70,7 @@
> >   #define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
> >   #define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({			\
> >   	int _l = lvl;							\
> > -	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
> > +	((addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
> >   })
> >   
> >   /*
> > @@ -755,7 +762,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> >   {
> >   	struct arm_v7s_io_pgtable *data;
> >   
> > -	if (cfg->ias > ARM_V7S_ADDR_BITS)
> > +	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
> >   		return NULL;
> >   
> >   	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index f6a2e3eb59d2..6e85c9976a33 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -316,7 +316,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
> >   			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
> >   			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
> >   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
> > -		.ias = 32,
> > +		.ias = 34,
> >   		.oas = 35,
> >   		.tlb = &mtk_iommu_flush_ops,
> >   		.iommu_dev = data->dev,
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
