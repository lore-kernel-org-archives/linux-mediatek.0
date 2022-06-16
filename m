Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0vGbJP7nctZXlRIbnzl3aBOdEVWkvMbNXMRhIuQLTM=; b=xS/1igtdAWx3+NdXsC55czTehZ
	zuvnA480oQ+hQkuBAUahgmpx3VK1CfeKKpHGwdwmFYrjbSPgslJyJzQVLYM7fNJ9GId5wVNrsn60M
	eMu3R5ptomQRxVVtsrvw2LQq88DEcdvJItNDjIv+KWzf+ZTImmX/Q5GU/IdJvblXXZ9WG6g3/vqIq
	I9AT6aUxTlkrkGvLnQ/pJPOCr/p+zyxxLoCR5/U/9phxUi+5c3/3SOdcYYVOCASWZuQixGe94dxv3
	CSWTFBnseygDG26ihxNLs9sVB2TbEBWzbKdsO7/hKwdigqSnQQsyulDPZ4DtyHw2ExOzmYn2DtqRm
	E3x/rfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jRm-000tbX-LY; Thu, 16 Jun 2022 06:57:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jNn-000rFe-DJ; Thu, 16 Jun 2022 06:53:36 +0000
X-UUID: a3c1b29a5aaa4cbb97b68863b698bb3a-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:915c596a-3066-4d83-b2a9-85e36eb593c4,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:4acdb548-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a3c1b29a5aaa4cbb97b68863b698bb3a-20220615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 776843833; Wed, 15 Jun 2022 23:53:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 23:47:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 14:47:13 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 16 Jun 2022 14:47:13 +0800
From: <yf.wang@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <ning.li@mediatek.com>,
	<will@kernel.org>, <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>,
	<yong.wu@mediatek.com>
Subject: Re: [PATCH v9 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR
Date: Thu, 16 Jun 2022 14:40:24 +0800
Message-ID: <20220616064024.10683-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <949c22c4-5f64-47cf-673c-14fcadcc1d27@arm.com>
References: <949c22c4-5f64-47cf-673c-14fcadcc1d27@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_235335_483930_A8B165C6 
X-CRM114-Status: GOOD (  20.97  )
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

On Wed, 2022-06-15 at 18:14 +0100, Robin Murphy wrote:
> On 2022-06-15 17:12, yf.wang--- via iommu wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update
> > MTK_IOMMU_ADDR
> > definition for better generality.
> > 
> > Signed-off-by: Ning Li <ning.li@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index bb9dd92c9898..3d62399e8865 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
> >   
> >   static int mtk_iommu_hw_init(const struct mtk_iommu_data *data,
> > unsigned int bankid);
> >   
> > -#define MTK_IOMMU_TLB_ADDR(iova) ({				
> > 	\
> > -	dma_addr_t _addr = iova;					\
> > +#define MTK_IOMMU_ADDR(addr) ({					
> > 	\
> > +	unsigned long long _addr = addr;				\
> 
> If phys_addr_t is 64-bit, then dma_addr_t is also 64-bit, so there is
> no 
> loss of generality from using an appropriate type - IOVAs have to
> fit 
> into dma_addr_t for iommu-dma, after all. However, since IOVAs also
> have 
> to fit into unsigned long in the general IOMMU API, as "addr" is
> here, 
> then this is still just as broken for 32-bit LPAE as the existing
> code is.
> 
> Thanks,
> Robin.
> 

Hi Robin,
According to Path#1's suggestion, next version will keep ttbr to encoded 32 bits,
then will don't need to modify it.

Thanks,
Yunfei.


> >   	((lower_32_bits(_addr) & GENMASK(31, 12)) |
> > upper_32_bits(_addr));\
> >   })
> >   
> > @@ -381,8 +381,8 @@ static void
> > mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >   			       base + data->plat_data->inv_sel_reg);
> >   
> > -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base +
> > REG_MMU_INVLD_START_A);
> > -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
> > +		writel_relaxed(MTK_IOMMU_ADDR(iova), base +
> > REG_MMU_INVLD_START_A);
> > +		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
> >   			       base + REG_MMU_INVLD_END_A);
> >   		writel_relaxed(F_MMU_INV_RANGE, base +
> > REG_MMU_INVALIDATE);
> >

