Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E73C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZgS2iJNSu3c42246+lbSSuVyF80Z0xMXbwlVxhtUjI=; b=yQ386iQl6wemvRTFe0ok/2Kah4
	92IIz3Wk6MuOV7wPgK3kg7nQM5oMVXZVvnXljoMf2tffdbG+A411fGcEmXjuG/QIN25vIDYblu0WQ
	NA/Rzo0+NJVMsYhLSA4PdRrP8xUfagyb5PG22eQegaCVSlDss2gr3pOEaA/ixUyB6748TyizSiKmK
	HLftvENkdVGGmTOenT78jWNC+0eNN2OUiZlrOas/nMr9kfJJRIod0FEfXJiv74EznuesPHkBOI1Bs
	YLh1lwy6mldeVaqyKfP4AbwXHsWzE60UONXSf+mblIUgmTEbffjp62fzrtjbQuKnfIdagLTTfmabR
	iBRFU6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Ttl-00EvA9-D0; Wed, 15 Jun 2022 14:21:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1TtX-00Ev4D-Ju; Wed, 15 Jun 2022 14:21:21 +0000
X-UUID: ee7d23920fda492caf68c1856086d68d-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a4ca2413-2038-4d3e-b173-7fecfaea02b6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:d9549c48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ee7d23920fda492caf68c1856086d68d-20220615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1897157548; Wed, 15 Jun 2022 07:21:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 07:21:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 22:21:00 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Jun 2022 22:20:59 +0800
From: <yf.wang@mediatek.com>
To: <will@kernel.org>
CC: <Libo.Kang@mediatek.com>, <Yong.Wu@mediatek.com>,
	<iommu@lists.linux-foundation.org>, <isaacm@codeaurora.org>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <ning.li@mediatek.com>,
	<quic_c_gdjako@quicinc.com>, <robin.murphy@arm.com>, <sven@svenpeter.dev>,
	<wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: Re: [PATCH v8 1/3] iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
Date: Wed, 15 Jun 2022 22:14:11 +0800
Message-ID: <20220615141411.5119-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220614125630.GA8159@willie-the-truck>
References: <20220614125630.GA8159@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_072119_684916_DC4ED1B4 
X-CRM114-Status: GOOD (  25.93  )
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

On Tue, 2022-06-14 at 13:56 +0100, Will Deacon wrote:
> Hi,
> 
> For some reason, this series has landed in my spam folder so
> apologies
> for the delay :/
> 
> 
> > +static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
> > +				    struct io_pgtable_cfg *cfg)
> > +{
> > +	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
> > +
> > +	if (!arm_v7s_is_mtk_enabled(cfg))
> > +		return pte;
> > +
> > +	return to_iopte_mtk(paddr, pte);
> 
> nit, but can we rename and rework this so it reads a bit better,
> please?
> Something like:
> 
> 
> 	if (arm_v7s_is_mtk_enabled(cfg))
> 		return to_mtk_iopte(paddr, pte);
> 
> 	return pte;
> 
> 

Hi Will,
Thanks for your suggestion, PATCH v9 version will modify it.


> >  static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
> >  				  struct io_pgtable_cfg *cfg)
> >  {
> > @@ -234,6 +239,7 @@ static arm_v7s_iopte *iopte_deref(arm_v7s_iopte
> > pte, int lvl,
> >  static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
> >  				   struct arm_v7s_io_pgtable *data)
> >  {
> > +	gfp_t gfp_l1 = __GFP_ZERO | ARM_V7S_TABLE_GFP_DMA;
> >  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> >  	struct device *dev = cfg->iommu_dev;
> >  	phys_addr_t phys;
> > @@ -241,9 +247,11 @@ static void *__arm_v7s_alloc_table(int lvl,
> > gfp_t gfp,
> >  	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
> >  	void *table = NULL;
> >  
> > +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> > +		gfp_l1 = GFP_KERNEL | __GFP_ZERO;
> 
> I think it's a bit grotty to override the flags inline like this
> (same for
> the slab flag later on). Something like this is a bit cleaner:
> 
> 
> 	/*
> 	 * Comment explaining why GFP_KERNEL is desirable here.
> 	 * I'm assuming it's because the walker can address all of
> memory.
> 	 */
> 	gfp_l1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
> 		 GFP_KERNEL : ARM_V7S_TABLE_GFP_DMA;
> 
> 	...
> 
> 	__get_free_pages(gfp_l1 | __GFP_ZERO, ...);
> 
> 
> and similar for the slab flag.
> 

Hi Will,
Thanks for your suggestion, PATCH v9 version will modify it.


> >  	if (lvl == 1)
> > -		table = (void *)__get_free_pages(
> > -			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA,
> > get_order(size));
> > +		table = (void *)__get_free_pages(gfp_l1,
> > get_order(size));
> >  	else if (lvl == 2)
> >  		table = kmem_cache_zalloc(data->l2_tables, gfp);
> >  
> > @@ -251,7 +259,8 @@ static void *__arm_v7s_alloc_table(int lvl,
> > gfp_t gfp,
> >  		return NULL;
> >  
> >  	phys = virt_to_phys(table);
> > -	if (phys != (arm_v7s_iopte)phys) {
> > +	if (phys != (arm_v7s_iopte)phys &&
> > +	    !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)) {
> >  		/* Doesn't fit in PTE */
> 
> Shouldn't we be checking that the address is within 35 bits here?
> Perhaps we
> should generate a mask from the oas instead of just using the cast.
> 

Hi Will,
Thanks for your suggestion, PATCH v9 version will add checking that the address is within 35 bits:

phys = virt_to_phys(table);
if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
    phys >= (1ULL << cfg->oas) : phys != (arm_v7s_iopte)phys) {
	/* Doesn't fit in PTE */


Thanks,
Yunfei.

