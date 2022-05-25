Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D966FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 03:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSE492X53/0Ccj9urLCHfJ6HqmPrFoJJEyuZ8KCfIQ0=; b=meffY3c1NL4Krx
	OAQcH5v0xmvANCoKjIaoTdW6s8nrSzOB+W+DRxjQ0/HcDR3zmlGkui16VS2CdMG7oY5IBNtnQNkup
	GLBOUDpq339q0cGPb8hALtuI8wq7e/+W5SgwgmeSqbVRxuof+q/9eEn9ZpFonuqwskydAEn8YZEYi
	BeMPeh4vSx80Z/NxS3C7lHRSVYrh41if5eVwi/UqNRC3q3NNMvf0YFzn7FRJhUHHQd9hqy/15hUYL
	GPbleacOVLsM1A5ehTG/p7zAblaXDwawgf56VbpVPVSHzjv1rTuIo1dzCPXCOoqoCfpcaDKQ97Z18
	s5K7enJdjQmiWI6fTIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nthhG-009poX-S4; Wed, 25 May 2022 03:28:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nthh6-009pmJ-94; Wed, 25 May 2022 03:28:21 +0000
X-UUID: 39063e44bad44952b17a500f5987c55c-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c40a8e14-a949-4383-baa0-98c90e420098, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:11215c47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 39063e44bad44952b17a500f5987c55c-20220524
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1582078798; Tue, 24 May 2022 20:28:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 20:28:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 25 May 2022 11:28:12 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 25 May 2022 11:28:10 +0800
From: <yf.wang@mediatek.com>
To: <miles.chen@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <Yong.Wu@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <isaacm@codeaurora.org>,
 <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <ning.li@mediatek.com>,
 <quic_c_gdjako@quicinc.com>, <robin.murphy@arm.com>, <sven@svenpeter.dev>,
 <will@kernel.org>, <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: Re: [PATCH v5 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
Date: Wed, 25 May 2022 11:21:33 +0800
Message-ID: <20220525032133.29053-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220519062756.14447-1-miles.chen@mediatek.com>
References: <20220519062756.14447-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_202820_364257_629E61DB 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu, 2022-05-19 at 14:27 +0800, Miles Chen wrote:
> Hi Yunfei,
> 
> > The calling to kmem_cache_alloc for level 2 pgtable allocation may
> > run
> > in atomic context, and it fails sometimes when DMA32 zone runs out
> > of
> > memory.
> > 
> > Since Mediatek IOMMU hardware support at most 35bit PA in pgtable,
> > so add a quirk to allow the PA of pgtables support up to bit35.
> > 
> > Signed-off-by: Ning Li <ning.li@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 56 ++++++++++++++++++++++--
> > ------
> >  include/linux/io-pgtable.h         | 15 +++++---
> >  2 files changed, 52 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-
> > pgtable-arm-v7s.c
> 
> ...snip...
> 
> > +     gfp_t gfp_l1 = __GFP_ZERO | ARM_V7S_TABLE_GFP_DMA;
> >       struct io_pgtable_cfg *cfg = &data->iop.cfg;
> >       struct device *dev = cfg->iommu_dev;
> >       phys_addr_t phys;
> > @@ -241,9 +251,11 @@ static void *__arm_v7s_alloc_table(int lvl,
> > gfp_t gfp,
> >       size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
> >       void *table = NULL;
> > 
> > +     if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> > +             gfp_l1 = __GFP_ZERO;
> 
> __GFP_ZERO is an action modifier, if we do not want
> ARM_V7S_TABLE_GFP_DMA (GFP_DMA/GFP_DMA32), use gfp_l1 = (GFP_KERNEL |
> __GFP_ZERO)
> 

Hi Miles,
Thanks for the suggestion, we will update it in the next version.

Thanks,
Yunfei.

> > +
> >       if (lvl == 1)
> > -             table = (void *)__get_free_pages(
> > -                     __GFP_ZERO | ARM_V7S_TABLE_GFP_DMA,
> > get_order(size));
> > +             table = (void *)__get_free_pages(gfp_l1,
> > get_order(size));
> >       else if (lvl == 2)
> >               table = kmem_cache_zalloc(data->l2_tables, gfp);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
