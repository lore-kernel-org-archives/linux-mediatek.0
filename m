Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC22C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:19:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0385C20709
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NkgIBEwa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPWd+Sgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0385C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYr0NcpucHT/jsT2YD47LTSzo+wDuPTSgdqBmnYoxCE=; b=NkgIBEwa1HDSPGHBLUN4kuYjz
	8DIF6C7SXxL/GR2LSLP5UxHMsV7y/El80tiVcW2rPfy9VVKbCtUJr1p/tDE/ocWnIn97C/rP9H0V8
	7c7FNV2IsBi3TsIJQiVRG1HkkeU9I3B8W2jxyTx9ju0xeVoCgW1rwCGAZV3dpSzmI4iH4ucxaTcl+
	kjb0RJu3Ti908TJu59BzTl2st0sFvmKzXUJ1+PHUkBh238YpT/zTpXAenJrztrPrSFYcAco4v0+SN
	VtPSkExKY3HJSZhdXHVManSlD8KnsfqqnetKm7y5eVntDsTHIL+5G64HlluNykyvCtegMGjy38s9E
	QcZctPheg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGWw-0004v4-7e; Wed, 22 Jul 2020 15:19:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGWu-0004ue-56; Wed, 22 Jul 2020 15:19:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id 9so2267424wmj.5;
 Wed, 22 Jul 2020 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+UCvHRw9cSV1ire+wDJVVQA4haGd1GB0XoiKtbgnmTo=;
 b=mPWd+SgyIoM4lyYru9jltmu9xCLYTsfHwP43ZhqSTI3HRTjtBVPedMh8cO5+wfljZV
 Lxf8H6NT28UcH94uOz8FUO607ECu/zMFF/MPHa8vrnE8y+FANxATLTHXGsAo+2bA5GJI
 cNMGYH4iiHh3SM6/WdmeRgWdXbviPJlZXdBWNDTq7kD1YGxqEZnCuL5rIt4hSHLdaJhk
 4qChsu+0TuRImEAJ38wFhHF9zH9+OXOqNL7agZKc8njCEfIi1Q2qEJVdMQt/bpiNZNyJ
 +WJ5UGOG+bSeyuor+0i9DY+OTy+2kXU5EdPO8R5SQuOMOTN+D4hMhFlYXzMS/vMK+mib
 6Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+UCvHRw9cSV1ire+wDJVVQA4haGd1GB0XoiKtbgnmTo=;
 b=hjZMqytJZybrX9CJFpylWAUOrwzedc8PAhUaY3gD+ojrAxzeK0QTUFyTViLP3LuEVi
 sBt2eqgsp7D8RjZfZ+lysiD8uza1QpM3EhzPvEMAiI1lU34spEfRo3cGFYh0PbHXSerD
 /DpywRYHlZ1h8zO61sjkuLyH9dl0fzy8qryI5fwco32dAfuoW/qErGzthUHMx4LyrOPo
 VK0ioBrhFbeWEysN5UKow8KYat4l0ot27WUHc7eTMWXm8JxTRWqs9dH9i1cDjhVw7i3c
 +oz7iNnkJ2olrBVZugBc8ZigSYut8rOhn2g2iSq/xqnedhWPFc41s2XtLcuCWMNkeZhJ
 HmMw==
X-Gm-Message-State: AOAM532DF3LzIxwiFEjEIJNYN871m9baH/vR0AERYjAnKxlu2ihAzmdI
 qaSCbubV/M9/iCtrEf1qF/Q=
X-Google-Smtp-Source: ABdhPJx4/91ssZDs9aLL0SlkfQcoKpepKepjDLz8KCMepuSrTFan2YjNbDmCoVfqBl8wRK0twYrstg==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr140355wmg.93.1595431174874;
 Wed, 22 Jul 2020 08:19:34 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id u20sm13204wmc.42.2020.07.22.08.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:19:34 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/mediatek: check 4GB mode by reading infracfg
To: Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>
References: <20200722141925.14861-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb36fb32-9a90-2b63-bdc2-506c02a5cb07@gmail.com>
Date: Wed, 22 Jul 2020 17:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722141925.14861-1-miles.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_111936_271163_BD712600 
X-CRM114-Status: GOOD (  28.79  )
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
Cc: wsd_upstream@mediatek.com, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 16:19, Miles Chen wrote:
> In previous discussion [1] and [2], we found that it is risky to
> use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> 
> Check 4GB mode by reading infracfg register, remove the usage
> of the un-exported symbol max_pfn.
> 
> This is a step towards building mtk_iommu as a kernel module.
> 
> ---

That's wrong. The commit message would be cut after this '---' so we would loose 
the Cc and Signed-of-by tags.

> 
> Change since v2:
> - determine compatible string by m4u_plat
> - rebase to next-20200720
> - add "---"
> 
> Change since v1:
> - remove the phandle usage, search for infracfg instead [3]
> - use infracfg instead of infracfg_regmap
> - move infracfg definitaions to linux/soc/mediatek/infracfg.h
> - update enable_4GB only when has_4gb_mode
> 
> [1] https://lkml.org/lkml/2020/6/3/733
> [2] https://lkml.org/lkml/2020/6/4/136

I think using links to lore.kernel.org would make sure that the URL does not 
change over time. As the commit log will stay there for ever, but who konws what 
happens with lkml.org

> [3] https://lkml.org/lkml/2020/7/15/1147
> 
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

The formating should look like this:
In previous discussion [1] and [2], we found that it is risky to
use max_pfn or totalram_pages to tell if 4GB mode is enabled.

Check 4GB mode by reading infracfg register, remove the usage
of the un-exported symbol max_pfn.

This is a step towards building mtk_iommu as a kernel module.

[1] https://lkml.org/lkml/2020/6/3/733
[2] https://lkml.org/lkml/2020/6/4/136

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---

Change since v2:
- determine compatible string by m4u_plat
- rebase to next-20200720
- add "---"

Change since v1:
- remove the phandle usage, search for infracfg instead 
https://lkml.org/lkml/2020/7/15/1147
- use infracfg instead of infracfg_regmap
- move infracfg definitaions to linux/soc/mediatek/infracfg.h
- update enable_4GB only when has_4gb_mode



> ---
>   drivers/iommu/mtk_iommu.c             | 34 +++++++++++++++++++++++----
>   include/linux/soc/mediatek/infracfg.h |  3 +++
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 59e5a62a34db..9ec666168822 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -3,7 +3,6 @@
>    * Copyright (c) 2015-2016 MediaTek Inc.
>    * Author: Yong Wu <yong.wu@mediatek.com>
>    */
> -#include <linux/memblock.h>
>   #include <linux/bug.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
> @@ -15,13 +14,16 @@
>   #include <linux/iommu.h>
>   #include <linux/iopoll.h>
>   #include <linux/list.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/of_address.h>
>   #include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> +#include <linux/soc/mediatek/infracfg.h>
>   #include <asm/barrier.h>
>   #include <soc/mediatek/smi.h>
>   
> @@ -640,8 +642,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	struct resource         *res;
>   	resource_size_t		ioaddr;
>   	struct component_match  *match = NULL;
> +	struct regmap		*infracfg;
>   	void                    *protect;
>   	int                     i, larb_nr, ret;
> +	u32			val;
> +	char                    *p;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -655,10 +660,29 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>   
> -	/* Whether the current dram is over 4GB */
> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> -	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
> -		data->enable_4GB = false;
> +	data->enable_4GB = false;
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
> +		switch (data->plat_data->m4u_plat) {
> +		case M4U_MT2712:
> +			p = "mediatek,mt2712-infracfg";
> +			break;
> +		case M4U_MT8173:
> +			p = "mediatek,mt8173-infracfg";
> +			break;
> +		default:
> +			p = NULL;
> +		}
> +
> +		infracfg = syscon_regmap_lookup_by_compatible(p);

	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
		switch (data->plat_data->m4u_plat) {
		case M4U_MT2712:
			infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt2712-infracfg");
			break;
		case M4U_MT8173:
			infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8173-infracfg");
			break;
		default:
			infracfg = -ENODEV;
		}
> +
> +		if (IS_ERR(infracfg))
> +			return PTR_ERR(infracfg);
> +
> +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
> +		if (ret)
> +			return ret;
> +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> +	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	data->base = devm_ioremap_resource(dev, res);
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index fd25f0148566..233463d789c6 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -32,6 +32,9 @@
>   #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
>   						 BIT(7) | BIT(8))
>   
> +#define REG_INFRA_MISC				0xf00
> +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> +
>   int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   		bool reg_update);
>   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
