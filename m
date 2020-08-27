Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCC0C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 19:28:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1116122CBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 19:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKzCRJUL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1116122CBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K1bBFlyMkX+deymxDBRixezdzoo8AwlDnub0XPL6zG8=; b=RKzCRJULSOyMcw3A3eBubDeuH
	TpRndLNUahqzhHqvECeNO7UHw7u+EYBCCItMGChsGO5I9qXUcuB2LY6JUH7L1dREY1CU76G91cffw
	Fc3tzjccj64Acu1tp5zEqRzGi/bqEql9EnxkzojFmkTvaiyLfvxIFtAh8V9vSbBUXsUMQoipgpIib
	I6gmNS8Xa3E1g68kIJe9yVKejAxWr9DFai3MR6IgRwASNTtwLc+EnBy5fAhaGG9s1c1Gj/52E10yU
	HXr4FlQ2PaAqV7t02BY9QVXuW9xaGDlyRbUrSdu8VWjaF9+dfz3AcLoyUzqhwobvKz8ppWre+Gblo
	Cnf+Yf+wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNZK-0006La-Td; Thu, 27 Aug 2020 19:28:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNYv-00068l-AK; Thu, 27 Aug 2020 19:27:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE3231B;
 Thu, 27 Aug 2020 12:27:50 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A331E3F68F;
 Thu, 27 Aug 2020 12:27:48 -0700 (PDT)
Subject: Re: [RESEND PATCH v4] iommu/mediatek: check 4GB mode by reading
 infracfg
To: Yong Wu <yong.wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
References: <20200826085618.2889-1-miles.chen@mediatek.com>
 <1598506280.19851.5.camel@mhfsdcap03>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e34db4dc-49a6-d414-e438-b528703ffb80@arm.com>
Date: Thu, 27 Aug 2020 20:27:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598506280.19851.5.camel@mhfsdcap03>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152753_699468_716C3FA0 
X-CRM114-Status: GOOD (  27.89  )
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
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-27 06:31, Yong Wu wrote:
> On Wed, 2020-08-26 at 16:56 +0800, Miles Chen wrote:
>> In previous discussion [1] and [2], we found that it is risky to
>> use max_pfn or totalram_pages to tell if 4GB mode is enabled.
>>
>> Check 4GB mode by reading infracfg register, remove the usage
>> of the un-exported symbol max_pfn.
>>
>> This is a step towards building mtk_iommu as a kernel module.
>>
>> [1] https://lore.kernel.org/lkml/20200603161132.2441-1-miles.chen@mediatek.com/
>> [2] https://lore.kernel.org/lkml/20200604080120.2628-1-miles.chen@mediatek.com/
>> [3] https://lore.kernel.org/lkml/20200715205120.GA778876@bogus/
>>
>> Cc: Mike Rapoport <rppt@linux.ibm.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Yong Wu <yong.wu@mediatek.com>
>> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>>
>> ---
>>
>> Change since v3
>> - use lore.kernel.org links
>> - move "change since..." after "---"
>>
>> Change since v2:
>> - determine compatible string by m4u_plat
>> - rebase to next-20200720
>> - add "---"
>>
>> Change since v1:
>> - remove the phandle usage, search for infracfg instead [3]
>> - use infracfg instead of infracfg_regmap
>> - move infracfg definitaions to linux/soc/mediatek/infracfg.h
>> - update enable_4GB only when has_4gb_mode
>> ---
>>   drivers/iommu/mtk_iommu.c             | 34 +++++++++++++++++++++++----
>>   include/linux/soc/mediatek/infracfg.h |  3 +++
>>   2 files changed, 32 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index 785b228d39a6..adc350150492 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -3,7 +3,6 @@
>>    * Copyright (c) 2015-2016 MediaTek Inc.
>>    * Author: Yong Wu <yong.wu@mediatek.com>
>>    */
>> -#include <linux/memblock.h>
>>   #include <linux/bug.h>
>>   #include <linux/clk.h>
>>   #include <linux/component.h>
>> @@ -15,13 +14,16 @@
>>   #include <linux/iommu.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/list.h>
>> +#include <linux/mfd/syscon.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_iommu.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/soc/mediatek/infracfg.h>
>>   #include <asm/barrier.h>
>>   #include <soc/mediatek/smi.h>
>>   
>> @@ -640,8 +642,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>   	struct resource         *res;
>>   	resource_size_t		ioaddr;
>>   	struct component_match  *match = NULL;
>> +	struct regmap		*infracfg;
>>   	void                    *protect;
>>   	int                     i, larb_nr, ret;
>> +	u32			val;
>> +	char                    *p;
>>   
>>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>> @@ -655,10 +660,29 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>>   
>> -	/* Whether the current dram is over 4GB */
>> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
>> -	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
>> -		data->enable_4GB = false;
>> +	data->enable_4GB = false;

Nit: this isn't really necessary, since the structure is kzalloc()ed.

>> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
>> +		switch (data->plat_data->m4u_plat) {
>> +		case M4U_MT2712:
>> +			p = "mediatek,mt2712-infracfg";
>> +			break;
>> +		case M4U_MT8173:
>> +			p = "mediatek,mt8173-infracfg";
>> +			break;
>> +		default:
>> +			p = NULL;
>> +		}
>> +
> 
> This can be simplified:
> 
>          if (data->plat_data->m4u_plat == M4U_MT2712)
> 		p = "mediatek,mt2712-infracfg";
> 	else if(data->plat_data->m4u_plat == M4U_MT8173)
> 		p = "mediatek,mt8173-infracfg";
> 	else
> 		return -EINVAL;

Right, at this point the HAS_4GB_MODE flag is entirely redundant and 
should be removed. FWIW I still think your suggestion of putting the 
infracfg names into plat_data would be even better and cleaner - there's 
plenty of precedent for that sort of thing (see "git grep '\.clk_name'" 
for example).

Robin.

> 
> Then,
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> 	
> 
>> +		infracfg = syscon_regmap_lookup_by_compatible(p);
>> +
>> +		if (IS_ERR(infracfg))
>> +			return PTR_ERR(infracfg);
>> +
>> +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
>> +		if (ret)
>> +			return ret;
>> +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
>> +	}
>>   
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	data->base = devm_ioremap_resource(dev, res);
>> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
>> index fd25f0148566..233463d789c6 100644
>> --- a/include/linux/soc/mediatek/infracfg.h
>> +++ b/include/linux/soc/mediatek/infracfg.h
>> @@ -32,6 +32,9 @@
>>   #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
>>   						 BIT(7) | BIT(8))
>>   
>> +#define REG_INFRA_MISC				0xf00
>> +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
>> +
>>   int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>>   		bool reg_update);
>>   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
