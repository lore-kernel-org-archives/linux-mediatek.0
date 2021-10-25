Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E28C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 04:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B3660F70
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 04:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2B3660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIawi9QMPafKOl2c0c5vBoakvmvqy35dC2rIQNuUoSs=; b=roiMAYv3ER/1QT
	5Ipnev6+O+flwA4fqQa83RbCkjrV8A79UZsJ1H8JEPAaeRjHTOlIv4DQASX61f8+T1/hah2fbMw/+
	crc7T7RQsTDB6kGA+rqf3PYwrdCM0mFP7hHxrwhyJEXTf+nrn/ssG+jbZB1NsyiCrKvlz9YA+m1p1
	P4LiNS5W+cxlDz0ujoEYuq59fJhULtZeP+EIBmg7paHv4AaEfu3A2oePsax46FQU6BqRM/5mhKap6
	FiPhMTlc7hT1Jo9OdlrimAk5DNptWbn55aflQMi6r6IxY51jXydkkpiTMUdcAatbOpp/av4H1eC2X
	+Q2Vx2b2PgWDqsF2xI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1merDS-00FEMZ-8C; Mon, 25 Oct 2021 04:04:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1merDO-00FEKw-8V; Mon, 25 Oct 2021 04:04:04 +0000
X-UUID: e250e49a114446e190ca6cc450100054-20211024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ccPzK7FNitJAyHQG9gzX9D65Nz6meMuwCPEHC4/A0GA=; 
 b=r5seQ1fGfzsuTK8P0fgBSzHG20y0QJCY6I3lVZpilypgZhQW7W/sJ56QAib/aRno9IthBvuzl8Aym7bKLG7kXC4YrnHSiei8y3P+8Fdqt6iolRRP/ECQKKcmVAAxIZhAPUK5fDgfPuti4Q8DPOdq71dS/GOKfAu93IXb7q1jvss=;
X-UUID: e250e49a114446e190ca6cc450100054-20211024
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1505719341; Sun, 24 Oct 2021 21:03:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Oct 2021 21:03:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 12:03:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 12:03:53 +0800
Message-ID: <f0e2ebf98481ee2ae8b88565a337e773532ddffd.camel@mediatek.com>
Subject: Re: [PATCH v3 13/33] iommu/mediatek: Remove the power status
 checking in tlb flush all
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Joerg Roedel
 <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <yen-chang.chen@mediatek.com>, Collabora Kernel ML <kernel@collabora.com>
Date: Mon, 25 Oct 2021 12:03:53 +0800
In-Reply-To: <6cff0b97-b861-e02d-e76f-2510c962c452@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-14-yong.wu@mediatek.com>
 <6cff0b97-b861-e02d-e76f-2510c962c452@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_210403_410337_5447A69D 
X-CRM114-Status: GOOD (  38.40  )
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

On Fri, 2021-10-22 at 16:03 +0200, Dafna Hirschfeld wrote:
> Hi
> 
> 
> On 23.09.21 13:58, Yong Wu wrote:
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
> 
> Regarding case "c) tlb flush range fail case", I found out that this
> often happens when the iommu is used while it is runtime suspended. 

Which SoC and branch are you testing on?

> For example the mtk-vcodec encoder driver calls
> "pm_runtime_resume_and_get" only when it starts
> streaming but
> buffers allocation is done in 'v4l2_reqbufs' before
> "pm_runtime_resume_and_get" is called

This is the case I tried to fix in [14/33].
pm_runtime_get_if_in_use should return when the iommu device's pm is
not active when vcodec allocate buffer before pm_runtime_resume_and
get.

Do you have the devicelink patchset in your branch? if not, the vcodec
should call mtk_smi_larb_get to enable the power/clock for larbs, then
the iommu's device is active via devicelink between smi and iommu
device.

> and then I see the warning "Partial TLB flush timed out, falling back
> to full flush"
> I am not sure how to fix that issue, but it seems that case 'c)'
> might indicate that
> power and clock are actually not enabled.
> 
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
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
