Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B16C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73sgfU7TaTFpKDSUnukwWtHsgh/odDdx1ZaYRXLHimA=; b=toqoGETC2uaPutIVv34Ykrgyfx
	hmFGr+DcMIq23K4QlHpQpFRwraU0bOkx091YqLzHwHvv3gN1x5t7OUR0jk1WT23v7WAqQLRBx89tK
	MzPQy4jUM5T17bwkD+AMF1YOlCMgi2HfwFFO2+WT0VwBy3U1jrtgiQ1Xf1WdDYFKe6DHB0Mt4OuKn
	i4etpM8bi+xqahbqFYTeRkpgaoyMQBF6ytxwWgFlJYtAuxxNUpM/hyx5bFhDbELNKg2IPFWPx75Xn
	6thaEzHPtGB8W3WHotvROx2b/Dd6sgF9YPakjtGjtsvX5BvMM+8BnB1gwT7sC78zosT4Ti4jf3xsC
	ePur5wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XBD-00Bxtm-53; Wed, 29 Jun 2022 12:52:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XAT-00BxX7-0t; Wed, 29 Jun 2022 12:51:42 +0000
X-UUID: 3563f9118ade4c32ae359fb7565d2235-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:77c33f00-9ddf-4c58-b270-9a579941a96c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:548ff762-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3563f9118ade4c32ae359fb7565d2235-20220629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1769975105; Wed, 29 Jun 2022 05:51:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 20:50:59 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 29 Jun 2022 20:50:58 +0800
From: <yf.wang@mediatek.com>
To: <yong.wu@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<isaacm@codeaurora.org>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <ning.li@mediatek.com>,
	<quic_c_gdjako@quicinc.com>, <robin.murphy@arm.com>, <sven@svenpeter.dev>,
	<will@kernel.org>, <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: Re: [PATCH v10 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
Date: Wed, 29 Jun 2022 20:44:03 +0800
Message-ID: <20220629124403.18122-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1ce1947984043bc4284abe94b53888c11a072345.camel@mediatek.com>
References: <1ce1947984043bc4284abe94b53888c11a072345.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055141_135401_949E81EF 
X-CRM114-Status: GOOD (  20.35  )
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

On Wed, 2022-06-22 at 09:28 +0800, Yong Wu wrote:
> On Thu, 2022-06-16 at 20:07 +0800, yf.wang@mediatek.com wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA and
> > cause pgtable PA size larger than 32bit.
> > 
> > Since Mediatek IOMMU hardware support at most 35bit PA in pgtable,
> > so add a quirk to allow the PA of pgtables support up to bit35.
> > 
> > Signed-off-by: Ning Li <ning.li@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 67 +++++++++++++++++++++++---
> > --
> > --
> >  include/linux/io-pgtable.h         | 15 ++++---
> >  2 files changed, 63 insertions(+), 19 deletions(-)
> 
> [...]
> 
> >  	/* TTBR */
> > -	cfg->arm_v7s_cfg.ttbr = virt_to_phys(data->pgd) |
> > ARM_V7S_TTBR_S |
> > +	paddr = virt_to_phys(data->pgd);
> > +	cfg->arm_v7s_cfg.ttbr = paddr | ARM_V7S_TTBR_S |
> >  				(cfg->coherent_walk ? (ARM_V7S_TTBR_NOS
> > > 
> > 
> >  				 ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBW
> > A) |
> >  				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBW
> > A)) :
> >  				(ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC)
> > > 
> > 
> >  				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)
> > ));
> > +
> > +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> > +		cfg->arm_v7s_cfg.ttbr = (paddr & GENMASK(31, 7)) |
> > +					upper_32_bits(paddr);
> 
> If we keep ttbr u32, we have to put the special logic here. This line
> is ok for all the MediaTek cases, not only for this quirk. It means:
> 
>     if (arm_v7s_is_mtk_enabled(cfg))
>            cfg->arm_v7s_cfg.ttbr = (virt_to_phys(data->pgd) &
> GENMASK(31, 7)) | upper_32_bits(paddr);
>     else
>            xxx
>  
>      Then we don't need add "& MMU_PT_ADDR_MASK" in mtk_iommu.c since
> you have done it here.
> 

Hi Yong,
Thanks for your suggestion, PATCH v11 version will modify it.

Thanks,
Yunfei.

> > +
> >  	return &data->iop;
> >  

