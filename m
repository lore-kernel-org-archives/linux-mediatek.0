Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C508C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 11:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 185A62073A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 11:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gf7zrMNh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PuyfOOM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 185A62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8vhqvf6KAPhzPk0i9o9oS8ilBMJXIieJv8+r5n3khzw=; b=Gf7zrMNh48S2cCVFJtvZCQrjY
	OC9t5AC9fYr6GyvTTwdmG/kI3rcbLywPfHvdXGJmq+k33OMZkg2q5Yn74efmHS/MJwTMUJEdUdcxp
	s4O7dsdF1fuH/8RT3fK3eMgYeB5JUlMFFnOXITSUaL1M1y1qh1hEG/pL3zzyG15tHIOh6ZleR8VbH
	8KoKG2WSAsGth0d1G6VgPjmjVF5sQOKCBR0X4lNg5bBveKEE/7M0Eg6BoU1QdZN5Ad+Kpv9IOb03H
	R+eiGfipHeHveUXEb8IsdkVXXFav2zOI7GQMZuTWD3+JnyS3HUOlj8mZ4/QxZacEFGKQUcH0H/Ecm
	8Vd9bnmhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxqYu-0003el-1u; Tue, 21 Jul 2020 11:35:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxqYq-0003dL-NV; Tue, 21 Jul 2020 11:35:54 +0000
X-UUID: d446cec76b4b4e4b89549a0976c8ee71-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qpykmZSQGs2bMX7gw2YPF5m+GwO54FLnah9QDtNvrQ0=; 
 b=PuyfOOM2ETABcPZJCgRJyPYUuKks1oJtnJntkQk7B5HODC2uI6lOvl//HhqyDwMR75HUIo7szlgHUGWgmsYBDGZslXPmbcBcO0aMpfmcOfnbjfEGBfwzQpc4SFRipUry+5ckLNsEmHNq/X253MRYyeaG1mHvvaehVmSZ3zfzNDs=;
X-UUID: d446cec76b4b4e4b89549a0976c8ee71-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1581383717; Tue, 21 Jul 2020 03:35:38 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 04:25:43 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Jul 2020 19:25:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 19:25:39 +0800
Message-ID: <1595330677.16172.55.camel@mhfsdcap03>
Subject: Re: [PATCH v2] iommu/mediatek: check 4GB mode by reading infracfg
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 21 Jul 2020 19:24:37 +0800
In-Reply-To: <cbdd2820-fd3c-3e51-8140-58408dcf3cd3@gmail.com>
References: <20200721021619.25575-1-miles.chen@mediatek.com>
 <cbdd2820-fd3c-3e51-8140-58408dcf3cd3@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAB7B75237DE000BACAED1A8055572801DDE7023171D49975F3AB582270F9ECD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_073552_995181_33DAD05D 
X-CRM114-Status: GOOD (  30.31  )
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
 David Hildenbrand <david@redhat.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 11:40 +0200, Matthias Brugger wrote:
> 
> On 21/07/2020 04:16, Miles Chen wrote:
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
> > 
> > [1] https://lkml.org/lkml/2020/6/3/733
> > [2] https://lkml.org/lkml/2020/6/4/136
> > [3] https://lkml.org/lkml/2020/7/15/1147
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
> >   drivers/iommu/mtk_iommu.c             | 26 +++++++++++++++++++++-----
> >   include/linux/soc/mediatek/infracfg.h |  3 +++
> >   2 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2be96f1cdbd2..16765f532853 100644
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
> > @@ -15,13 +14,16 @@
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
> > +#include <linux/soc/mediatek/infracfg.h>
> >   #include <asm/barrier.h>
> >   #include <soc/mediatek/smi.h>
> >   
> > @@ -599,8 +601,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   	struct resource         *res;
> >   	resource_size_t		ioaddr;
> >   	struct component_match  *match = NULL;
> > +	struct regmap		*infracfg;
> >   	void                    *protect;
> >   	int                     i, larb_nr, ret;
> > +	u32			val;
> >   
> >   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >   	if (!data)
> > @@ -614,10 +618,22 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   		return -ENOMEM;
> >   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
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
> 
> I think we should check m4u_plat instead to decide which compatible we have to 
> look for.
> Another option would be to add a general compatible something like 
> "mtk-infracfg" and search for that. That would need an update of all DTS having 
> a infracfg compatible right now. After thinking twice, this would break newer 
> kernel with older device tree, so maybe it's better to go with m4u_plat switch 
> statement.

Add a "char *infracfg" in the plat_data, Use the mt2712, mt8173
corresponding string in it. If it is NULL, It means the "enable_4GB"
always is false. Then we also can remove the flag "has_4gb_mode".

is this OK?

> 
> Regards,
> Matthias
> 
> > +
> > +		}
> > +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
> > +		if (ret)
> > +			return ret;
> > +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> > +	}
> >   
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	data->base = devm_ioremap_resource(dev, res);
> > diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> > index fd25f0148566..233463d789c6 100644
> > --- a/include/linux/soc/mediatek/infracfg.h
> > +++ b/include/linux/soc/mediatek/infracfg.h
> > @@ -32,6 +32,9 @@
> >   #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
> >   						 BIT(7) | BIT(8))
> >   
> > +#define REG_INFRA_MISC				0xf00
> > +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> > +
> >   int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> >   		bool reg_update);
> >   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
