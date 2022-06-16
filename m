Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540E9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe98tMRyBE1Tw7N++IK7D5zMd5TnwFJTETCbZA6OPZM=; b=R6vdzYvR8pofFnY2dZgDu1QH0N
	h0oT2jvPP5ENFXylfiEpHDwTHweZZmxQLlhVZLJBLL0doO2d32Z8VG5kZJAyxCZE+mS8NOh/YoLJp
	EBby9CLRyVaS6EO7EkZQKz0GcNQkTGMfBHPuQ+M91GEFAZgO/qRnFWURgoixSFNgOHP0taV9MQHmU
	anAInpFjM7f4aiDgTPAv4pclw4LdsX6+fqtLfFi0gOu6X0VeU4GgS1fgUQa1CHgeWKf9b+9UGZm6j
	YQcHxF+IqiZHf32LU7+F0DZV/9Q/bEdRsSVJV64hqHwTGNPWOAlsHUExOF3CaRXJjhIyt6RPzgkhA
	4sMEM3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kZg-001Jeb-EO; Thu, 16 Jun 2022 08:09:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kXM-001IWa-49; Thu, 16 Jun 2022 08:07:33 +0000
X-UUID: bb4ef7e9f8614932963e3427554915ce-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:1edc3bb4-17b7-4668-ae36-59e82f6c5f64,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:b33ab948-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bb4ef7e9f8614932963e3427554915ce-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1451769769; Thu, 16 Jun 2022 01:07:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:59:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:59:38 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 16 Jun 2022 15:59:36 +0800
From: <yf.wang@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <ning.li@mediatek.com>,
	<will@kernel.org>, <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>,
	<yong.wu@mediatek.com>
Subject: Re: [PATCH v9 3/3] iommu/mediatek: Allow page table PA up to 35bit
Date: Thu, 16 Jun 2022 15:52:46 +0800
Message-ID: <20220616075246.11076-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <81b55048-a6f1-660f-95b0-6798aa4efc38@arm.com>
References: <81b55048-a6f1-660f-95b0-6798aa4efc38@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_010732_247157_D7022B5B 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, 2022-06-15 at 18:25 +0100, Robin Murphy wrote:
> On 2022-06-15 17:12, yf.wang--- via iommu wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA. So
> > add
> > the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT to let level 1 and
> > level 2
> > pgtable support at most 35bit PA.
> 
> I'm not sure how this works in practice, given that you don't seem to
> be 
> setting the IOMMU's own DMA masks to more than 32 bits, so the DMA 
> mapping in io-pgtable is going to fail if you ever do actually
> allocate 
> a pagetable page above 4GB :/
> 

Hi Robin,
About DMA masks, the master device has set dma mask, when iommu do dma map,
it will check the dam_mask of the master dev to determine which range the
address of the iova alloc is in.

Add the quirk ARM_MTK_TTBR_EXT to let pgtable support larger phys memory.
Do actually test work fine, example:
pgtable phys address:0x12054006a, encoded to 32 bits ttbr:0x20540001


> > Signed-off-by: Ning Li <ning.li@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 3d62399e8865..4dbc33758711 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -138,6 +138,7 @@
> >   /* PM and clock always on. e.g. infra iommu */
> >   #define PM_CLK_AO			BIT(15)
> >   #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
> > +#define PGTABLE_PA_35_EN		BIT(17)
> >   
> >   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
> >   				((((pdata)->flags) & (mask)) == (_x))
> > @@ -240,6 +241,7 @@ struct mtk_iommu_data {
> >   struct mtk_iommu_domain {
> >   	struct io_pgtable_cfg		cfg;
> >   	struct io_pgtable_ops		*iop;
> > +	u32				ttbr;
> >   
> >   	struct mtk_iommu_bank_data	*bank;
> >   	struct iommu_domain		domain;
> > @@ -596,6 +598,9 @@ static int mtk_iommu_domain_finalise(struct
> > mtk_iommu_domain *dom,
> >   		.iommu_dev = data->dev,
> >   	};
> >   
> > +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
> > +		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
> > +
> >   	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
> >   		dom->cfg.oas = data->enable_4GB ? 33 : 32;
> >   	else
> > @@ -684,8 +689,8 @@ static int mtk_iommu_attach_device(struct
> > iommu_domain *domain,
> >   			goto err_unlock;
> >   		}
> >   		bank->m4u_dom = dom;
> > -		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> > -		       bank->base + REG_MMU_PT_BASE_ADDR);
> > +		bank->m4u_dom->ttbr = MTK_IOMMU_ADDR(dom-
> > >cfg.arm_v7s_cfg.ttbr);
> > +		writel(bank->m4u_dom->ttbr, data->base +
> > REG_MMU_PT_BASE_ADDR);
> 
> To add to my comment on patch #1, having to make this change here 
> further indicates that you're using it the wrong way.
> 
> Thanks,
> Robin.
> 

Hi Robin,
According to your Path#1's suggestion, next version will keep ttbr to encoded 32 bits,
then will don't need to modify it.

Thanks,
Yunfei.

