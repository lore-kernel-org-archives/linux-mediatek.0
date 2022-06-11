Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ADC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWw7k5X6b4UJiA66qAPTrUg2Hp1o3mSb7GuiSbO7C24=; b=n1DlHXDIpl2rrW
	3EfQO1jJ3d/huFmZDvM5fMJnO+RXwZlviLo59aoNmWjq9jeELz9q4CUf6MaW5Xtaw6IRf7Wc2sq37
	5L5X1KuO50K3kO/WOxlQY11ctS6fnJY/d06kSbzZ0MVkgKik33oOc/RrfjcqjJj7Z0xkSiUCNqDgi
	BlRe0OmKR6UrSHQfCUZzpO8rwPTqs+v+Ft2UoAyQjzCbc8YYZlfHmPwGMNxwMVX+sBboBiVgy8tf4
	3Dxyu5k85isqYCyB14Pt70Xws6TT/EPFAtHQVkjdftWj9JiNsNu3a0C2fjYVHdR4RwzG0lynmnEqI
	Qz6hRwrn/1yHu7Ioxw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyLT-00CTPp-Ad; Sat, 11 Jun 2022 10:27:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyLF-00CTKc-JV; Sat, 11 Jun 2022 10:27:44 +0000
X-UUID: 122046a50295437392b9c5133f4a0e37-20220611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:90522f7c-c954-4416-a598-ef6ec50f5d76,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:751385e7-1f03-4449-90ad-e6cb8f3d1399,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 122046a50295437392b9c5133f4a0e37-20220611
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2074876676; Sat, 11 Jun 2022 03:27:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jun 2022 03:27:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Jun 2022 18:27:25 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jun 2022 18:27:24 +0800
From: <yf.wang@mediatek.com>
To: <yong.wu@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <ning.li@mediatek.com>, <robin.murphy@arm.com>,
	<will@kernel.org>, <miles.chen@mediatek.com>, <wsd_upstream@mediatek.com>,
	<yf.wang@mediatek.com>
Subject: Re: [PATCH v5 2/2] iommu/mediatek: Allow page table PA up to 35bit
Date: Sat, 11 Jun 2022 18:20:38 +0800
Message-ID: <20220611102038.10890-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1625ec1f4cded0f825d93743d3d03fcf83cad5aa.camel@mediatek.com>
References: <1625ec1f4cded0f825d93743d3d03fcf83cad5aa.camel@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_032741_688683_E15407FD 
X-CRM114-Status: GOOD (  19.80  )
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

On Thu, 2022-05-19 at 14:58 +0800, Yong Wu wrote:
> On Mon, 2022-05-16 at 22:16 +0800, yf.wang@mediatek.com wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > Add the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT support, so that
> > allows
> > page table PA up to 35bit, not only in ZONE_DMA32.
> 
> Comment why this is needed.
> 
> e.g. For single normal zone.
> 


Hi Yong,

There is no DMA32 zone in some mediatek smartphone chip for single
normal zone.

The level 1 and level 2 pgtable are both allocated in ZONE_DMA32,
and may have two possible problem:
1.The level 2 pgtable is allocated in ZONE_DMA32 with atomic flag,
 and it may fail if ZONE_DMA32 memory is used out.
2.Single memory feature will make ZONE_DMA32 empty, and cause level
 1 and level 2 pgtable PA more than 32bit.

Solution:
Add the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT support, so that
level 1 and level 2 pgtable can support at most 35bit PA.

I had updated the commit message in V7 version.


> >  		data->m4u_dom = dom;
> > -		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> > -		       data->base + REG_MMU_PT_BASE_ADDR);
> > +
> > +		/* Bits[6:3] are invalid for mediatek platform */
> > +		if (MTK_IOMMU_HAS_FLAG(data->plat_data,
> > PGTABLE_PA_35_EN))
> > +			regval = (dom->cfg.arm_v7s_cfg.ttbr &
> > MMU_PT_ADDR_MASK) |
> > +				 (dom->cfg.arm_v7s_cfg.ttbr &
> > MMU_PT_ADDR_2_0_MASK);
> 
> The bits[2:0] has already handled in ARM_V7S_TTBR_35BIT_PA of
> patch[1/2], we need calculate it again here?
> 
> 1) Extend arm_v7s_cfg.ttbr to u64, then we could put the special ttbr
> logical into our file.
> 
> 2) if 1) is not allowed, We have to put this in v7s.
> if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT) {
>        cfg->arm_v7s_cfg.ttbr = (paddr & GENMASK(31, 7)) |
> upper_32_bits(paddr);
>        return &data->iop;
> }
> 
> This need Robin/Will confirm.
> 


Hi Yong,

V7 version had extended arm_v7s_cfg.ttbr to u64, then put the special
ttbr logical into MediaTek file.


> > +		else
> > +			regval = dom->cfg.arm_v7s_cfg.ttbr &
> > MMU_PT_ADDR_MASK;
> 
> Save this value to our data. then we don't need calculate it again in
> the resume cb.   
> 

Hi Yong,

V8 version will Save the special ttbr to mtk_iommu_domain avoid
calculate it again.

Thanks,
Yunfei.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
