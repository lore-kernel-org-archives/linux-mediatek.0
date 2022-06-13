Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0J1ChI35L687FYiTEWx6OWsplA25u03hoUf0P4GAuQ=; b=PC2rAv7KQ/h+v+
	rWoGU7tdfmmqTu1y97T4au/BgkDAhPVPvMPYnc3sNyoFTOhMylP241BD11Wwm/Imi74BjDZaHHnlg
	SmR9/3lxAwW/dgsju9sMKyq2fkkVP+CEm1iOcqCLAJgLix4BOKdH0/LmOfjkDQ4f+00oxazeZewGl
	PUX0cGoR9HqqZ7bLtmpH5qJ0Ufl+Do3fhnMYp1rq5Z1xSFYjfvdhIHjqESPG+GyydOb1vyuLWlMGi
	ug83gTZmIjghHhlWdYYs/jf+jwheown4HjIcWk2dMRlNi0PrOsnzCRDuk/hyGNv7IxU/EL/V5Jyqp
	pwNakDLARAt65cFwCbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ixe-003SGx-OB; Mon, 13 Jun 2022 12:14:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ixa-003SFS-4Q; Mon, 13 Jun 2022 12:14:25 +0000
X-UUID: 1527f734c7954a9e8bf50aa7a6239f98-20220613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KkfVromvX+mMfNc+ewnWVRm1PM/Za0B8AWwtof/nngs=;
	b=LXqmkye1UoyA0r/xbkvXDoMmtxwsZ+3KDUOCcQZqQleU/0k2kSkNUbmv7X0555A4bMM9X9IbvItsv1+JftID7ZCiyI8PmMKKWUKuMTqtjySdwH3YbIDs8kAd6UbG1LvNPgFT5I5yQGCDAlS0+wy5aRohk7421m6rJFYWzJ0XkNY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:3f47204c-ae9a-4574-9e48-c73786bcd9c3,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:15
X-CID-META: VersionHash:b14ad71,CLOUDID:6ff466c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1527f734c7954a9e8bf50aa7a6239f98-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1078127982; Mon, 13 Jun 2022 05:14:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 05:03:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 20:03:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 20:03:55 +0800
Message-ID: <e15deedee3a412e8496be1867725f7e62e396551.camel@mediatek.com>
Subject: Re: [PATCH v8 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to
 MTK_IOMMU_ADDR
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "open list:MEDIATEK IOMMU DRIVER"
	<iommu@lists.linux-foundation.org>, "moderated list:MEDIATEK IOMMU DRIVER"
	<linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>, Libo Kang
	<Libo.Kang@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ning Li
	<ning.li@mediatek.com>
Date: Mon, 13 Jun 2022 20:03:55 +0800
In-Reply-To: <20220611102656.10954-3-yf.wang@mediatek.com>
References: <20220611102656.10954-1-yf.wang@mediatek.com>
	 <20220611102656.10954-3-yf.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_051422_228975_43CD41E0 
X-CRM114-Status: GOOD (  15.84  )
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

On Sat, 2022-06-11 at 18:26 +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update
> MTK_IOMMU_ADDR
> definition for better generality.

Comment more about why you need this.

Prepare for supporting TTBR up to 35bit which also need this macro.
Currently it is dma_addr_t while ttbr is phys_addr_t, thus change the
type to "unsigned long long" for generality.

Anyway,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index bb9dd92c9898..3d62399e8865 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
>  
>  static int mtk_iommu_hw_init(const struct mtk_iommu_data *data,
> unsigned int bankid);
>  
> -#define MTK_IOMMU_TLB_ADDR(iova) ({					
> \
> -	dma_addr_t _addr = iova;					\
> +#define MTK_IOMMU_ADDR(addr) ({					
> 	\
> +	unsigned long long _addr = addr;				\
>  	((lower_32_bits(_addr) & GENMASK(31, 12)) |
> upper_32_bits(_addr));\
>  })
>  
> @@ -381,8 +381,8 @@ static void
> mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>  			       base + data->plat_data->inv_sel_reg);
>  
> -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base +
> REG_MMU_INVLD_START_A);
> -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
> +		writel_relaxed(MTK_IOMMU_ADDR(iova), base +
> REG_MMU_INVLD_START_A);
> +		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
>  			       base + REG_MMU_INVLD_END_A);
>  		writel_relaxed(F_MMU_INV_RANGE, base +
> REG_MMU_INVALIDATE);
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
