Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA0C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:22:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7D620714
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMbIh0Zz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GzSM7x+3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7D620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/dd0/8yRhBHFdPMiRNMtjGj5CZTkUbWVm3ji52TmIrA=; b=UMbIh0Zz5kwj6dap8PnDR9/aI
	SSFXJe9hrhNJbJNjjdEb9fTqS3aCdKyYymXjbuJp4E5mfVqlMAK+aKXNi1zH8b7Ec3T5vwCKMmqYy
	3ov0sG9dlcaBVtlQ0bdZIBvA7mhtVoZl86+ltIAlVSg86RLgTXw3WSVkpYXo9muyEZTUh9laZF9YF
	IvxrdflTpaaWJ7AhpABRrFyc1KCfjpy7QSDrwV0alLC7Qz59gR3ojNvAVGx8nseCLMULDlwz9jd3T
	4UUgcakafTZG7IHlheOykbw07UUfT3owvclRc26tlAvPfnv8QOxcQmL5Gy3c94BllqZvGc6N5QaXp
	+ByXVTmwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy950-0006RH-Iw; Wed, 22 Jul 2020 07:22:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy94y-0006Pg-4k; Wed, 22 Jul 2020 07:22:17 +0000
X-UUID: 4a925552fb714bae8af6462f8714a91d-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eioeC0FtTQ1I836sh9xci60mvaR1B/7eikG6MlrGfMw=; 
 b=GzSM7x+3WhSHiJTMHzda03Y/OPhLtgYvcIEPOx6MRIV1N4WUI6WVhKcFrFUvDA23gU/CxdFrBlKny1MhEJ+yDyKj/Aogko3GsMV9/2fLSUasp8IpHPeZFqR9awebD92sOOKEdfdFIOwt2gerOTGKVRsYkTZq441sO4mkdX5+IQU=;
X-UUID: 4a925552fb714bae8af6462f8714a91d-20200721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1064690977; Tue, 21 Jul 2020 23:16:00 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 00:15:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 15:15:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 15:15:50 +0800
Message-ID: <1595402150.10848.1.camel@mtkswgap22>
Subject: Re: [PATCH v2] iommu/mediatek: check 4GB mode by reading infracfg
From: Miles Chen <miles.chen@mediatek.com>
To: David Hildenbrand <david@redhat.com>
Date: Wed, 22 Jul 2020 15:15:50 +0800
In-Reply-To: <cc04ce89-9790-b127-19e5-8f2f1b91ad4f@redhat.com>
References: <20200721021619.25575-1-miles.chen@mediatek.com>
 <cc04ce89-9790-b127-19e5-8f2f1b91ad4f@redhat.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 125A2A6B996131DF2178586BE457C60F26919FB3EC0293BA66AB66B8DF6B504B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_032216_393487_8F6B7366 
X-CRM114-Status: GOOD (  29.57  )
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
Cc: Rob Herring <robh@kernel.org>, wsd_upstream@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 11:10 +0200, David Hildenbrand wrote:
> On 21.07.20 04:16, Miles Chen wrote:
> > In previous discussion [1] and [2], we found that it is risky to
> > use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> > 
> > Check 4GB mode by reading infracfg register, remove the usage
> > of the un-exported symbol max_pfn.
> > 
> > This is a step towards building mtk_iommu as a kernel module.
> > 
> > Change since v1:
> > 1. remove the phandle usage, search for infracfg instead [3]
> > 2. use infracfg instead of infracfg_regmap
> > 3. move infracfg definitaions to linux/soc/mediatek/infracfg.h
> > 4. update enable_4GB only when has_4gb_mode
> 
> Nit: We tend to place such information below the "---" (adding a second
> one) such that this information is discarded when the patch is picked up.

Thanks, I'll add a "---" before the "Change since..." in patch v3.
> 
> > 
> > [1] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/3/733__;!!CTRNKA9wMg0ARbw!wrP2H0azuZkTHSnM_ETki4kT_FMF0Cl7abQX8tIHX0iTr65JkvMCe4jDt84d_YhBrA$ 
> > [2] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/4/136__;!!CTRNKA9wMg0ARbw!wrP2H0azuZkTHSnM_ETki4kT_FMF0Cl7abQX8tIHX0iTr65JkvMCe4jDt86IGhmouQ$ 
> > [3] https://urldefense.com/v3/__https://lkml.org/lkml/2020/7/15/1147__;!!CTRNKA9wMg0ARbw!wrP2H0azuZkTHSnM_ETki4kT_FMF0Cl7abQX8tIHX0iTr65JkvMCe4jDt855z4xdqw$ 
> > 
> > Cc: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Chao Hao <chao.hao@mediatek.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c             | 26 +++++++++++++++++++++-----
> >  include/linux/soc/mediatek/infracfg.h |  3 +++
> >  2 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2be96f1cdbd2..16765f532853 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -3,7 +3,6 @@
> >   * Copyright (c) 2015-2016 MediaTek Inc.
> >   * Author: Yong Wu <yong.wu@mediatek.com>
> >   */
> > -#include <linux/memblock.h>
> >  #include <linux/bug.h>
> >  #include <linux/clk.h>
> >  #include <linux/component.h>
> > @@ -15,13 +14,16 @@
> >  #include <linux/iommu.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/list.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_iommu.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/soc/mediatek/infracfg.h>
> >  #include <asm/barrier.h>
> >  #include <soc/mediatek/smi.h>
> >  
> > @@ -599,8 +601,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  	struct resource         *res;
> >  	resource_size_t		ioaddr;
> >  	struct component_match  *match = NULL;
> > +	struct regmap		*infracfg;
> >  	void                    *protect;
> >  	int                     i, larb_nr, ret;
> > +	u32			val;
> >  
> >  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >  	if (!data)
> > @@ -614,10 +618,22 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> >  
> > -	/* Whether the current dram is over 4GB */
> > -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> > -	if (!data->plat_data->has_4gb_mode)
> > -		data->enable_4GB = false;
> > +	data->enable_4GB = false;
> > +	if (data->plat_data->has_4gb_mode) {
> > +		infracfg = syscon_regmap_lookup_by_compatible(
> > +				"mediatek,mt8173-infracfg");
> > +		if (IS_ERR(infracfg)) {
> > +			infracfg = syscon_regmap_lookup_by_compatible(
> > +					"mediatek,mt2712-infracfg");
> > +			if (IS_ERR(infracfg))
> > +				return PTR_ERR(infracfg);
> > +
> > +		}
> > +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
> > +		if (ret)
> > +			return ret;
> > +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> 
> (I am absolutely not familiar with syscon_regmap_lookup_by ..., I am
> missing some context, so sorry for the stupid questions)
> 
> Who sets the regmap value and based on what? Who decides that 4GB mode
> is supported or not? And who decides if 4GB mode is *required* or not?
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
