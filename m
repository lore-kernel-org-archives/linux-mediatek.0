Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AF8C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 08:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8772071A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 08:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ii4toMyZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qSkg5pGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8772071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1I4ln++QUDXPRGXrSUfBGfLDmS2AtGUkIuEnkU5TxA=; b=Ii4toMyZSKbYMEyHCOYoP4jog
	7ucackhYD9XD7YctYcU7RvIgjxIpx6eLKCRLFKVuNvx4/U+SCfX6H+3LKBVuEes7SPYG+DUwND+XW
	kQZEsx+OKm3/oJu/KguzqgUmm8H0GxkG1bWR1rNlsqqPWfiOJdVZQzKClxDpWVS6e84aGWaNSMnET
	CkO1LUvCBquSn35Yz8j4Nl4CCrWr8Vb9aNdq5lpkWAitNAl4dOE5+3sOcoF10UzLUeMK4/9g1WeM5
	a2p1AaJTnOnACMHXqJhJG56au+VcLPos9L+uHwj9LiqgDJnFnaXT/PH7YcNiuZRiUJ+KTVGIqcDQ8
	2zAd2rolA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwLhf-0005I9-9c; Fri, 17 Jul 2020 08:26:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwLhc-0005Gz-7x; Fri, 17 Jul 2020 08:26:45 +0000
X-UUID: 333ac1e095cc4c99be49b365b907339e-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MrihObMU7n6YHGhXYYDfe7xLLhNpwqJjPTZD5pCRXi4=; 
 b=qSkg5pGZ7/GUqDa+KYmKpnSkiESL+hypmwvZ5i4IEGNH4WK6YywNGJCxL8h9/9NaHi0W9EMw68I+Bszeitn3N1dHLHw4cNF+I3U9TFPqE/uqPKcUNA6nlKJV0zYbBXVWTxPFkvamJ/Zr+VCei7kegzPh1id3EGAJuYoBXnY6V9c=;
X-UUID: 333ac1e095cc4c99be49b365b907339e-20200717
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 205278319; Fri, 17 Jul 2020 00:26:50 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 01:26:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 16:26:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jul 2020 16:26:29 +0800
Message-ID: <1594974391.12796.25.camel@mtkswgap22>
Subject: Re: [PATCH 4/4] iommu/mediatek: check 4GB mode by reading infracfg
From: Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 17 Jul 2020 16:26:31 +0800
In-Reply-To: <84333997-735c-4a91-6d47-1dcb5c4a6078@gmail.com>
References: <20200702093721.6063-1-miles.chen@mediatek.com>
 <20200702093721.6063-4-miles.chen@mediatek.com>
 <84333997-735c-4a91-6d47-1dcb5c4a6078@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_042644_447861_16F82400 
X-CRM114-Status: GOOD (  28.20  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com, David
 Hildenbrand <david@redhat.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-15 at 23:05 +0200, Matthias Brugger wrote:
> 
> On 02/07/2020 11:37, Miles Chen wrote:
> > In previous disscusion [1] and [2], we found that it is risky to
> > use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> > 
> > Check 4GB mode by reading infracfg register, remove the usage
> > of the unexported symbol max_pfn.
> > 
> > [1] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/3/733__;!!CTRNKA9wMg0ARbw!16gAfVnSY87W4t5kE4iw20QPxBgS_SHBvPKlePKU7CGIb18nUzuRUjHumcf4oYVhIQ$ 
> > [2] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/4/136__;!!CTRNKA9wMg0ARbw!16gAfVnSY87W4t5kE4iw20QPxBgS_SHBvPKlePKU7CGIb18nUzuRUjHumcfr4i9p5g$ 
> > 
> > Cc: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++----
> >   1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2be96f1cdbd2..09be57bd8d74 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -3,7 +3,6 @@
> >    * Copyright (c) 2015-2016 MediaTek Inc.
> >    * Author: Yong Wu <yong.wu@mediatek.com>
> >    */
> > -#include <linux/memblock.h>
> >   #include <linux/bug.h>
> >   #include <linux/clk.h>
> >   #include <linux/component.h>
> > @@ -15,11 +14,13 @@
> >   #include <linux/iommu.h>
> >   #include <linux/iopoll.h>
> >   #include <linux/list.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_iommu.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/of_platform.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <asm/barrier.h>
> > @@ -91,6 +92,9 @@
> >   #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
> >   #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
> >   
> > +#define REG_INFRA_MISC				0xf00
> > +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> > +
> 
> As this is used for infracfg, I think it would be good to add it to 
> include/linux/soc/mediatek/infracfg.h and include that file here.
Thanks for your comment.

ok. I'll do this in next version.
> 
> >   #define MTK_PROTECT_PA_ALIGN			128
> >   
> >   /*
> > @@ -599,8 +603,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   	struct resource         *res;
> >   	resource_size_t		ioaddr;
> >   	struct component_match  *match = NULL;
> > +	struct regmap		*infracfg_regmap;
> 
> Maybe call it just infracfg.

ok. I'll do this in next version. 
> 
> >   	void                    *protect;
> >   	int                     i, larb_nr, ret;
> > +	u32			val;
> >   
> >   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >   	if (!data)
> > @@ -614,10 +620,18 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   		return -ENOMEM;
> >   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> >   
> > -	/* Whether the current dram is over 4GB */
> > -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> > -	if (!data->plat_data->has_4gb_mode)
> > +	if (data->plat_data->has_4gb_mode) {
> > +		infracfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +				"mediatek,infracfg");
> > +		if (IS_ERR(infracfg_regmap))
> > +			return PTR_ERR(infracfg_regmap);
> 
> Do we need to error out, or could we be conservative and set endable_4GB = false?

We have to error out in this case because the 4gb_mode setting must be
consistent with the h/w setting.

> 
> > +		ret = regmap_read(infracfg_regmap, REG_INFRA_MISC, &val);
> > +		if (ret)
> > +			return ret;
> > +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> > +	} else {
> >   		data->enable_4GB = false;
> 
> Move that before the if() and update enable_4GB only in case of has_4gb_mode.

ok. I'll do this in next version.

Miles
> 
> > +	}
> >   
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	data->base = devm_ioremap_resource(dev, res);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
