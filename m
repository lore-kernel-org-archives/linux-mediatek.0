Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD15C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSTMCGeB1MjD/P+2cFhao1FDW1cTL5A+azILIFL2YwA=; b=BJH3RVryt1juxK
	JawYv9ELWgO5QNmNnBxJ5jS51g33PiqHpfup4m1xsTSQlcinnE0ypDBYhKd5XrWqzmLTMuDBu3vT5
	0v24SzvrbmuL2qsn8zoCzmeIxt7ANLG4lSW2ZNv3+gVV2YgJyzVikK5HzLWuOlM7ejEjOlog0/Jp4
	k4qN0ViU4J0tzJk+9aM44w3A/XKH7Tk4I5KRoMGUTOZQN4bUeU+8micizxkKD04mN1hFhaTJY61jV
	5DwjtvOA+KEnep+QYfQkR+fxruAehoIq59MHLYZrt35kR0X7LDN+2Vsxt3ArE6T0Nj0MF5LOKvNRz
	N52h55tyQoLc4qrnsXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6OF3-007FdD-U7; Sun, 09 Jan 2022 02:47:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6OF1-007Fcb-NQ; Sun, 09 Jan 2022 02:47:33 +0000
X-UUID: 08a9b969ecbf47a3a33eb821f0c20b97-20220108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=J9ZI/3WENLpZwcgeYrX9to8Lu7F177ZXFy7u6/+ekks=; 
 b=uaRnndrkJvY4Dzorc7INTidtZTp9nyVsEJfL4zqFkpBIyCHBCW57yIi7SWEJ8aRSVgGBC91YgQGiA4CJDORNauOEIlyyKyvIRR3xqjjUltJnvi72/0aHTYynTBfphDzTM+uKl0wX7NM0gqmCsiaKIfp6HP1XTZ2DO11Wwexmdm4=;
X-UUID: 08a9b969ecbf47a3a33eb821f0c20b97-20220108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 279442150; Sat, 08 Jan 2022 19:47:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 18:47:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 9 Jan 2022 10:47:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 9 Jan 2022 10:47:24 +0800
Message-ID: <c5062c4636e67924af8fbf9a66565e2f89dddce5.camel@mediatek.com>
Subject: Re: [PATCH v3 13/33] iommu/mediatek: Remove the power status
 checking in tlb flush all
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
Date: Sun, 9 Jan 2022 10:47:24 +0800
In-Reply-To: <1cb7458d-a012-2e84-82bd-7e4f30ed9162@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-14-yong.wu@mediatek.com>
 <1cb7458d-a012-2e84-82bd-7e4f30ed9162@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_184731_789758_7FCE28DA 
X-CRM114-Status: GOOD (  31.72  )
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

On Tue, 2022-01-04 at 16:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/09/21 13:58, Yong Wu ha scritto:
> > To simplify the code, Remove the power status checking in the
> > tlb_flush_all, remove this:
> >     if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > 	    continue;
> > 
> > After this patch, the mtk_iommu_tlb_flush_all will be called from
> > a) isr
> > b) pm runtime resume callback
> > c) tlb flush range fail case
> > d) iommu_create_device_direct_mappings
> >     -> iommu_flush_iotlb_all
> > In first three cases, the power and clock always are enabled; d) is
> > direct
> > mapping, the tlb flush is unnecessay since we already have
> > tlb_flush_all
> > in the pm_runtime_resume callback. When the iommu's power status is
> > changed to active, the tlb always is clean.
> > 
> > In addition, there still are 2 reasons that don't add PM status
> > checking
> > in the tlb flush all:
> > a) Write tlb flush all register also is ok even though the HW has
> > no
> > power and clocks. Write ignore.
> 
> Do you mean that the register write seemingly succeeds but the
> hardware discards it?
> Please, reword the `a` sentence to be clearer.

Yes. This is the "Write ignore" I tried to explain.

By the way, the tlb operation patches were moved to this patchset[1]
from Dafna. Would you help take a look at that one? I will send the
next mt8195 version based on that patchset.

[1] 
https://lore.kernel.org/linux-mediatek/20211208120744.2415-1-dafna.hirschfeld@collabora.com/

Thanks.

> 
> > b) pm_runtime_get_if_in_use(m4udev) is 0 when the tlb_flush_all
> > is called frm pm_runtime_resume cb. From this point, we can not add
> > this code above in this tlb_flush_all.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 20 +++++++-------------
> >   1 file changed, 7 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index e9e94944ed91..4a33b6c6b1db 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -204,10 +204,14 @@ static struct mtk_iommu_domain
> > *to_mtk_domain(struct iommu_domain *dom)
> >   	return container_of(dom, struct mtk_iommu_domain, domain);
> >   }
> >   
> > -static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data
> > *data)
> > +static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
> >   {
> >   	unsigned long flags;
> >   
> > +	/*
> > +	 * No need get power status since the HW PM status nearly is
> > active
> > +	 * when entering here.
> 
> Please reword this comment to explain the entire situation.
> 
> > +	 */
> >   	spin_lock_irqsave(&data->tlb_lock, flags);
> >   	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >   		       data->base + data->plat_data->inv_sel_reg);
> > @@ -216,16 +220,6 @@ static void mtk_iommu_tlb_do_flush_all(struct
> > mtk_iommu_data *data)
> >   	spin_unlock_irqrestore(&data->tlb_lock, flags);
> >   }
> >   
> > -static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
> > -{
> > -	if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > -		return;
> > -
> > -	mtk_iommu_tlb_do_flush_all(data);
> > -
> > -	pm_runtime_put(data->dev);
> > -}
> > -
> >   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova,
> > size_t size,
> >   					   struct mtk_iommu_data *data)
> >   {
> > @@ -263,7 +257,7 @@ static void
> > mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   		if (ret) {
> >   			dev_warn(data->dev,
> >   				 "Partial TLB flush timed out, falling
> > back to full flush\n");
> > -			mtk_iommu_tlb_do_flush_all(data);
> > +			mtk_iommu_tlb_flush_all(data);
> >   		}
> >   
> >   		if (has_pm)
> > @@ -993,7 +987,7 @@ static int __maybe_unused
> > mtk_iommu_runtime_resume(struct device *dev)
> >   	 *
> >   	 * Thus, Make sure the tlb always is clean after each PM
> > resume.
> >   	 */
> > -	mtk_iommu_tlb_do_flush_all(data);
> > +	mtk_iommu_tlb_flush_all(data);
> >   
> >   	/*
> >   	 * Uppon first resume, only enable the clk and return, since
> > the values of the
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
