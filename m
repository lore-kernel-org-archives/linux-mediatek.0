Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A621C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:17:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A32207AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A32207AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KpNLozeHkDl65WKc4BzriuASXEHQ7V3RyIn6HqUQQLQ=; b=l9M8n8P3BZPVj/OXPPQrzdi7E
	XdrmQqYB8XvA8hYmwdRXeAT1JR5TyIATTMmHvDpe9gI3lWs2D4EN/yN7Qbifzf2E4oPEJMfEa/anG
	YFD9OIfXmCKWfvHCxCUoteRzXZJtjspwP7tjitDitcyVGIRnMhFeuZ2bZ6SNSsj1/V/E1JaUJtxta
	MC1VI4eWm4/xX7NBMdpHSbSV4nfGXqO8O+7v5Ybzs+IR6l4Dd/+09Q7SZyhGj902+d9/ZUjUSDlOW
	abhlbK8kANRwSn4lmv7tPH55s8z/Vg0SHgoDKmr4sxpX7mmDhOQJfvqZZ0t2/ypnobRE743DJZwU7
	pZU5zt+CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuD0d-0000QZ-TT; Tue, 29 Dec 2020 11:17:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuD0a-0000Pv-Lj; Tue, 29 Dec 2020 11:17:46 +0000
X-UUID: 028884f780d742ffb02fa486b6fd54c1-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kjdDDsR62/sn1Fub2YpVwLbpjVry+o489WtdnLg/RPA=; 
 b=FHvIf0hXeHXEin7HOzba4Z4z9pH6en1yNnVohXqpsCnVjb7Gf17pCn3LSF6WlUPF4yKvoEOdACD12QMxkRvR2hVYW28fg/CSjUZ8lydniqZajsRRZ+1e4J3X0JfD6Lh0y8hm9jnEqFaCdSQ87rQrFx80LjFuPin8R6aquGY9P4o=;
X-UUID: 028884f780d742ffb02fa486b6fd54c1-20201229
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814916895; Tue, 29 Dec 2020 03:17:42 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 03:17:41 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 19:17:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 19:17:37 +0800
Message-ID: <1609240657.26323.298.camel@mhfsdcap03>
Subject: Re: [PATCH v5 09/27] iommu/io-pgtable-arm-v7s: Extend PA34 for
 MediaTek
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 19:17:37 +0800
In-Reply-To: <X+L96uZU2aZWfjSP@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-10-yong.wu@mediatek.com>
 <X+L96uZU2aZWfjSP@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D8FBC57831CD7A85616D1A7462D4159D3B98DDE313D42CDF6FB3EC071BE3DD992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_061744_934907_3BFB82E8 
X-CRM114-Status: GOOD (  26.66  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:20 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:44PM +0800, Yong Wu wrote:
> > MediaTek extend the bit5 in lvl1 and lvl2 descriptor as PA34.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Acked-by: Will Deacon <will@kernel.org>
> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 9 +++++++--
> >  drivers/iommu/mtk_iommu.c          | 2 +-
> >  include/linux/io-pgtable.h         | 4 ++--
> >  3 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index e880745ab1e8..4d0aa079470f 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -112,9 +112,10 @@
> >  #define ARM_V7S_TEX_MASK		0x7
> >  #define ARM_V7S_ATTR_TEX(val)		(((val) & ARM_V7S_TEX_MASK) << ARM_V7S_TEX_SHIFT)
> >  
> > -/* MediaTek extend the two bits for PA 32bit/33bit */
> > +/* MediaTek extend the bits below for PA 32bit/33bit/34bit */
> >  #define ARM_V7S_ATTR_MTK_PA_BIT32	BIT(9)
> >  #define ARM_V7S_ATTR_MTK_PA_BIT33	BIT(4)
> > +#define ARM_V7S_ATTR_MTK_PA_BIT34	BIT(5)
> >  
> >  /* *well, except for TEX on level 2 large pages, of course :( */
> >  #define ARM_V7S_CONT_PAGE_TEX_SHIFT	6
> > @@ -194,6 +195,8 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
> >  		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
> >  	if (paddr & BIT_ULL(33))
> >  		pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
> > +	if (paddr & BIT_ULL(34))
> > +		pte |= ARM_V7S_ATTR_MTK_PA_BIT34;
> >  	return pte;
> >  }
> >  
> > @@ -218,6 +221,8 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
> >  		paddr |= BIT_ULL(32);
> >  	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
> >  		paddr |= BIT_ULL(33);
> > +	if (pte & ARM_V7S_ATTR_MTK_PA_BIT34)
> > +		paddr |= BIT_ULL(34);
> >  	return paddr;
> >  }
> >  
> > @@ -754,7 +759,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> >  	if (cfg->ias > ARM_V7S_ADDR_BITS)
> >  		return NULL;
> >  
> > -	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
> > +	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
> >  		return NULL;
> >  
> >  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 6451d83753e1..ec3c87d4b172 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -320,7 +320,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
> >  			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
> >  		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
> >  		.ias = 32,
> > -		.oas = 34,
> > +		.oas = 35,
> 
> Shouldn't this be set according to the real hardware capabilities,
> instead of always setting it to 35?

Here only make the code clean. 35 is ok for all the SoC.
But you are right from the HW point, the logic is like this:

if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
	dom->cfg.oas = data->enable_4GB ? 33 : 32;
else
	dom->cfg.oas = 35;

I will use this in next version.

> 
> Best regards,
> Tomasz
> 
> >  		.tlb = &mtk_iommu_flush_ops,
> >  		.iommu_dev = data->dev,
> >  	};
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index 4cde111e425b..1ae0757f4f94 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -77,8 +77,8 @@ struct io_pgtable_cfg {
> >  	 *	TLB maintenance when mapping as well as when unmapping.
> >  	 *
> >  	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) MediaTek IOMMUs extend
> > -	 *	to support up to 34 bits PA where the bit32 and bit33 are
> > -	 *	encoded in the bit9 and bit4 of the PTE respectively.
> > +	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
> > +	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
> >  	 *
> >  	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
> >  	 *	on unmap, for DMA domains using the flush queue mechanism for
> > -- 
> > 2.18.0
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
