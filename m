Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 02:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBRBuZBJPMA5KCmc0DODh1S2bfZtXd6gXFWwCmpPVMI=; b=RqjMV82tJixJ5c
	3724JjIEUc8ogNzBj+svtCpM3ZMKxNziKBrG57cH6AmDMrsjLN7aR0RxXNJU0MGaQndI9tgbSuRul
	to8wJ6NQb5zbD0Agpm7rxU9y+Wt/TyJD3KHNKKUxDljVRXvHeO6n7jRA09KMM0I1aDEcl7aaZB1Ds
	UxURpDU0Zlhv6Cepa1/fpw+EcvkdDTIpj0tR3I/Q5CNyXT6PD5oZPv06DZPnuRmKRbLuPD+mMuqZB
	IRMC34nMt6C80Tra2FWwX24M/b8FLcT63FbbHrv5UXdzHn+ZbjP64Zm6ZtA5CiVvTmN6Ycmh+jOAN
	5mnQ9loAe3jBNVBtc7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6OEa-007FVI-B0; Sun, 09 Jan 2022 02:47:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6OEV-007FUV-MU; Sun, 09 Jan 2022 02:47:02 +0000
X-UUID: 094fe97cd62c41a390f5aa8df37e28bd-20220108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rYXkcqfeb/xfbK0Kr3P0NjZUtg9pbQmG+UaFeHVSErI=; 
 b=jZ1gxHxmy0mN7wLiZ5YgvsUwI7QJ1mkmSRnpscLNl4ZvvTAhUvJkouugtKbJEoUJgpwxONnOmqarnKqdrjpg8F2o0ks4m2PLAig7hTSo7qvdP5YBH3uXcMPpb1kBpIm7ZJRcrWtBEkQM7SJMJdrkSZfbru6B3O8Y/WQH16i5YJQ=;
X-UUID: 094fe97cd62c41a390f5aa8df37e28bd-20220108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 761616647; Sat, 08 Jan 2022 19:46:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 18:46:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 9 Jan 2022 10:46:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 9 Jan 2022 10:46:49 +0800
Message-ID: <214831c674c23d6733d372b5970d8c6754d55b1d.camel@mediatek.com>
Subject: Re: [PATCH v3 26/33] iommu/mediatek: Add mtk_iommu_bank_data structure
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <yen-chang.chen@mediatek.com>
Date: Sun, 9 Jan 2022 10:46:49 +0800
In-Reply-To: <5ac9dd6b-43cd-0f76-eb34-906ab84196c1@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-27-yong.wu@mediatek.com>
 <5ac9dd6b-43cd-0f76-eb34-906ab84196c1@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_184701_150439_05B8DE52 
X-CRM114-Status: GOOD (  29.08  )
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

Hi AngeloGioacchino,

Thanks very much for reviewing whole the patchset.

On Tue, 2022-01-04 at 16:53 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/09/21 13:58, Yong Wu ha scritto:
> > Prepare for supporting multi-banks for the IOMMU HW, No functional
> > change.
> > 
> > Add a new structure(mtk_iommu_bank_data) for each a bank. Each a
> > bank have
> > the independent HW base/IRQ/tlb-range ops, and each a bank has its
> > special
> > iommu-domain(independent pgtable), thus, also move the domain
> > information
> > into it.
> > 
> > In previous SoC, we have only one bank which could be treated as
> > bank0(
> > bankid always is 0 for the previous SoC).
> > 
> > After adding this structure, the tlb operations and irq could use
> > bank_data as parameter.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---

[...]
  
> > -struct mtk_iommu_data {
> > +struct mtk_iommu_bank_data {
> >   	void __iomem			*base;
> >   	int				irq;
> > +	unsigned int			id;
> > +	struct device			*pdev;
> 
> `pdev` may be a bit misleading, as it's conventionally read as
> "platform device"
> and not as the intended "parent device"... perhaps calling it
> parent_dev would be
> more appropriate.

will rename it. Thanks.

> 
> > +	struct mtk_iommu_data		*pdata;   /* parent data */
> 
> Same here, pdata -> parent_data

Will fix.

> 
> > +	spinlock_t			tlb_lock; /* lock for tlb range
> > flush */
> > +	struct mtk_iommu_domain		*m4u_dom; /* Each bank has
> > a domain */
> > +};
> > +
> > +struct mtk_iommu_data {
> > +	union {
> > +		struct { /* only for gen1 */
> > +			void __iomem		*base;
> > +			int			irq;
> > +			struct mtk_iommu_domain	*m4u_dom;
> > +		};
> > +
> > +		/* only for gen2 that support multi-banks */
> > +		struct mtk_iommu_bank_data	bank[MTK_IOMMU_BANK_MAX];
> > +	};
> 
> Sorry, but I really don't like this union... please, update
> mtk_iommu_v1 to always
> use bank[0] or, more appropriately, dynamically allocate the bank
> array with a
> devm_kzalloc call (as to not waste memory on platforms with less
> available banks).
> 
> In that case, you would have...
> 
> >   	struct device			*dev;
> >   	struct clk			*bclk;
> >   	phys_addr_t			protect_base; /* protect memory
> > base */
> >   	struct mtk_iommu_suspend_reg	reg;
> > -	struct mtk_iommu_domain		*m4u_dom;
> >   	struct iommu_group		*m4u_group[MTK_IOMMU_GROUP_MAX];
> >   	bool                            enable_4GB;
> > -	spinlock_t			tlb_lock; /* lock for tlb range
> > flush */
> 
> 	struct mtk_iommu_bank_data	*banks;
> 	u8				num_banks;
> 
> ... where `num_banks` gets copied from the same in
> mtk_iommu_plat_data, defined
> for each SoC, and where `banks` is dynamically allocated in
> mtk_iommu.c and
> mtk_iommu_v1.c's probe() callback.

Thanks for this idea. I will try this to see if the code will be too
complicate after changing this. If it is, I will use bank[0] always in
mtk_iommu_v1, this looks simpler.

> 
> >   
> >   	struct iommu_device		iommu;
> >   	const struct mtk_iommu_plat_data *plat_data;
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
