Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv59mDpm1GXsYVaoJk/X7bi4LI2leKvIYTIT0Tl9Nn8=; b=bBj92IuthmOKa0
	eHNtTTt2mqYmBtb8HtXbeSvrX+NRh4IuNn/+bHwclHk/aOOUfSILaEX0AcqJ3+g9/EPGImW7u/FUm
	9lg6QHmTqrYUYC8wIQbz5eHsTGTQYfpdbGy3SvqS5hc/7IvyX21++xyGfRYW1gEZOVn/lIajzjYGd
	61h74P4KdcvR6G1mhSHlPK4zWJIIe+Xrobax3JRVMQWMoV0VM6a9jXutfxVy7nLkpE3ZuXomkOEmh
	731BvkWEVmvYcVr6OAQ8qcB/PPTTwJuK++QubUM4xezvcargubRBdeDoFR5MRiPyJdzsXBhMeQYTH
	fvGu9DGh/ah+iXVuGX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZnj-005Kc6-H5; Thu, 19 May 2022 06:38:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZnX-005KZ7-Lz; Thu, 19 May 2022 06:38:13 +0000
X-UUID: f738befccdc04c2882577d4f73e238dc-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:63d45fe8-b26a-456b-9aed-393e2aa8fc45, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:53a9d279-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: f738befccdc04c2882577d4f73e238dc-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1499942932; Wed, 18 May 2022 23:38:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:27:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:27:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 14:27:56 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yf.wang@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <Yong.Wu@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <isaacm@codeaurora.org>,
 <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <ning.li@mediatek.com>,
 <quic_c_gdjako@quicinc.com>, <robin.murphy@arm.com>, <sven@svenpeter.dev>,
 <will@kernel.org>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v5 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
Date: Thu, 19 May 2022 14:27:56 +0800
Message-ID: <20220519062756.14447-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220516141608.11709-2-yf.wang@mediatek.com>
References: <20220516141608.11709-2-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_233811_749515_EA1A0407 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yunfei,

> The calling to kmem_cache_alloc for level 2 pgtable allocation may run
> in atomic context, and it fails sometimes when DMA32 zone runs out of
> memory.
> 
> Since Mediatek IOMMU hardware support at most 35bit PA in pgtable,
> so add a quirk to allow the PA of pgtables support up to bit35.
> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 56 ++++++++++++++++++++++--------
>  include/linux/io-pgtable.h         | 15 +++++---
>  2 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c

...snip...

> +	gfp_t gfp_l1 = __GFP_ZERO | ARM_V7S_TABLE_GFP_DMA;
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	struct device *dev = cfg->iommu_dev;
>  	phys_addr_t phys;
> @@ -241,9 +251,11 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
>  	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
>  	void *table = NULL;
>  
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> +		gfp_l1 = __GFP_ZERO;

__GFP_ZERO is an action modifier, if we do not want
ARM_V7S_TABLE_GFP_DMA (GFP_DMA/GFP_DMA32), use gfp_l1 = (GFP_KERNEL | __GFP_ZERO)

thanks,
Miles
> +
>  	if (lvl == 1)
> -		table = (void *)__get_free_pages(
> -			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA, get_order(size));
> +		table = (void *)__get_free_pages(gfp_l1, get_order(size));
>  	else if (lvl == 2)
>  		table = kmem_cache_zalloc(data->l2_tables, gfp);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
