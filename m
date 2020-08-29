Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2075C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 08:51:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F034208A9
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 08:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrwgYUYa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oujsTXUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F034208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4HocYWavSpuQPh5qhyONH/TNT80ag+0eP/khuqb0C1c=; b=DrwgYUYaq4kZFlKqAyGTwL37x
	Em+zGh93QFTOcVQjotSU2NmynwB8srJY3lswZkqPhKQaSN/rVj9AbCXGO89FcFM+hEQUXAZlUw/mo
	DpOjw3GyXDmVJ8SZ9saRTDzPCGcXbYFOCExkXGfjuDNKujCXfqGJe5XjK6LktKTOJfFYM6ZFymlma
	LA6T01Jpeym9D3ju0/50C1bcqtJ38TWnXG51NSiIjIHpfmTm+6zH7XA8fAR53tmciyc6x3PBJ5Inu
	32n3YQeU4aJcpUqXnStJiJN6uZvKQ+anfuXnm/Ie/ySgI7JWNT1XvDUETq1QB51MGzIt7+sntGpPQ
	FFF4K7vwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBwaI-0006nk-Ow; Sat, 29 Aug 2020 08:51:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBwaC-0006mw-MP; Sat, 29 Aug 2020 08:51:35 +0000
X-UUID: 92cf99a54b3240f6a9fb8595410eff54-20200829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qB65JvNr4zmGYx3nhQrYXy0tBUEmKp+M+ZtGMwCgkrg=; 
 b=oujsTXUCDqf+QWdrAu7a/79gwwtkl5e6g3+g1HAGGm5sMzA/qsDpG4N/rmU06a+Ls1KIpXdVA9/opTd0M683IQ96dFs9PWeRuT7u/0wwpnUlyXPo/p832x1H3V/ubbaCTOQ2mxWE9DdMvEFVjfT93slVvf2NNuQQHoiOh6HAdAg=;
X-UUID: 92cf99a54b3240f6a9fb8595410eff54-20200829
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1699459301; Sat, 29 Aug 2020 00:51:24 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 Aug 2020 01:51:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 Aug 2020 16:51:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 29 Aug 2020 16:51:19 +0800
Message-ID: <1598691080.9982.9.camel@mtkswgap22>
Subject: Re: [RESEND PATCH v4] iommu/mediatek: check 4GB mode by reading
 infracfg
From: Miles Chen <miles.chen@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Sat, 29 Aug 2020 16:51:20 +0800
In-Reply-To: <e34db4dc-49a6-d414-e438-b528703ffb80@arm.com>
References: <20200826085618.2889-1-miles.chen@mediatek.com>
 <1598506280.19851.5.camel@mhfsdcap03>
 <e34db4dc-49a6-d414-e438-b528703ffb80@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC0124F12646A90ABE3CE289DF8E2C577772453E21C8EABC2308FFBE2B5335F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_045132_945604_D45954CC 
X-CRM114-Status: GOOD (  35.35  )
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
 David Hildenbrand <david@redhat.com>, Joerg
 Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-27 at 20:27 +0100, Robin Murphy wrote:
> On 2020-08-27 06:31, Yong Wu wrote:
> > On Wed, 2020-08-26 at 16:56 +0800, Miles Chen wrote:
> >> In previous discussion [1] and [2], we found that it is risky to
> >> use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> >>
> >> Check 4GB mode by reading infracfg register, remove the usage
> >> of the un-exported symbol max_pfn.
> >>
> >> This is a step towards building mtk_iommu as a kernel module.
> >>
> >> [1] https://lore.kernel.org/lkml/20200603161132.2441-1-miles.chen@mediatek.com/
> >> [2] https://lore.kernel.org/lkml/20200604080120.2628-1-miles.chen@mediatek.com/
> >> [3] https://lore.kernel.org/lkml/20200715205120.GA778876@bogus/
> >>
> >> Cc: Mike Rapoport <rppt@linux.ibm.com>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Yong Wu <yong.wu@mediatek.com>
> >> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> >> Cc: Christoph Hellwig <hch@lst.de>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> >> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> >>
> >> ---
> >>
> >> Change since v3
> >> - use lore.kernel.org links
> >> - move "change since..." after "---"
> >>
> >> Change since v2:
> >> - determine compatible string by m4u_plat
> >> - rebase to next-20200720
> >> - add "---"
> >>
> >> Change since v1:
> >> - remove the phandle usage, search for infracfg instead [3]
> >> - use infracfg instead of infracfg_regmap
> >> - move infracfg definitaions to linux/soc/mediatek/infracfg.h
> >> - update enable_4GB only when has_4gb_mode
> >> ---
> >>   drivers/iommu/mtk_iommu.c             | 34 +++++++++++++++++++++++----
> >>   include/linux/soc/mediatek/infracfg.h |  3 +++
> >>   2 files changed, 32 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >> index 785b228d39a6..adc350150492 100644
> >> --- a/drivers/iommu/mtk_iommu.c
> >> +++ b/drivers/iommu/mtk_iommu.c
> >> @@ -3,7 +3,6 @@
> >>    * Copyright (c) 2015-2016 MediaTek Inc.
> >>    * Author: Yong Wu <yong.wu@mediatek.com>
> >>    */
> >> -#include <linux/memblock.h>
> >>   #include <linux/bug.h>
> >>   #include <linux/clk.h>
> >>   #include <linux/component.h>
> >> @@ -15,13 +14,16 @@
> >>   #include <linux/iommu.h>
> >>   #include <linux/iopoll.h>
> >>   #include <linux/list.h>
> >> +#include <linux/mfd/syscon.h>
> >>   #include <linux/of_address.h>
> >>   #include <linux/of_iommu.h>
> >>   #include <linux/of_irq.h>
> >>   #include <linux/of_platform.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/regmap.h>
> >>   #include <linux/slab.h>
> >>   #include <linux/spinlock.h>
> >> +#include <linux/soc/mediatek/infracfg.h>
> >>   #include <asm/barrier.h>
> >>   #include <soc/mediatek/smi.h>
> >>   
> >> @@ -640,8 +642,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >>   	struct resource         *res;
> >>   	resource_size_t		ioaddr;
> >>   	struct component_match  *match = NULL;
> >> +	struct regmap		*infracfg;
> >>   	void                    *protect;
> >>   	int                     i, larb_nr, ret;
> >> +	u32			val;
> >> +	char                    *p;
> >>   
> >>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >>   	if (!data)
> >> @@ -655,10 +660,29 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >>   		return -ENOMEM;
> >>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> >>   
> >> -	/* Whether the current dram is over 4GB */
> >> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> >> -	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
> >> -		data->enable_4GB = false;
> >> +	data->enable_4GB = false;
> 
> Nit: this isn't really necessary, since the structure is kzalloc()ed.

Thanks for the comment, I will remove this this in v5.
> 
> >> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
> >> +		switch (data->plat_data->m4u_plat) {
> >> +		case M4U_MT2712:
> >> +			p = "mediatek,mt2712-infracfg";
> >> +			break;
> >> +		case M4U_MT8173:
> >> +			p = "mediatek,mt8173-infracfg";
> >> +			break;
> >> +		default:
> >> +			p = NULL;
> >> +		}
> >> +
> > 
> > This can be simplified:
> > 
> >          if (data->plat_data->m4u_plat == M4U_MT2712)
> > 		p = "mediatek,mt2712-infracfg";
> > 	else if(data->plat_data->m4u_plat == M4U_MT8173)
> > 		p = "mediatek,mt8173-infracfg";
> > 	else
> > 		return -EINVAL;
> 
> Right, at this point the HAS_4GB_MODE flag is entirely redundant and 
> should be removed. FWIW I still think your suggestion of putting the 
> infracfg names into plat_data would be even better and cleaner - there's 
> plenty of precedent for that sort of thing (see "git grep '\.clk_name'" 
> for example).
> 
> Robin.

hmm, I have no strong opinion about this. We have discussed this
approach before and built this patch based on the discussion.
https://lore.kernel.org/patchwork/patch/1276801/



Miles
> 
> > 
> > Then,
> > Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> > 	
> > 
> >> +		infracfg = syscon_regmap_lookup_by_compatible(p);
> >> +
> >> +		if (IS_ERR(infracfg))
> >> +			return PTR_ERR(infracfg);
> >> +
> >> +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
> >> +		if (ret)
> >> +			return ret;
> >> +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> >> +	}
> >>   
> >>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>   	data->base = devm_ioremap_resource(dev, res);
> >> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> >> index fd25f0148566..233463d789c6 100644
> >> --- a/include/linux/soc/mediatek/infracfg.h
> >> +++ b/include/linux/soc/mediatek/infracfg.h
> >> @@ -32,6 +32,9 @@
> >>   #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
> >>   						 BIT(7) | BIT(8))
> >>   
> >> +#define REG_INFRA_MISC				0xf00
> >> +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> >> +
> >>   int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> >>   		bool reg_update);
> >>   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
