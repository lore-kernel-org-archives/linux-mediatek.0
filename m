Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D02C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:06:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB1A9207D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB1A9207D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z57H5APvNzRop1Ff7mp6jGkIgUMIhjnqHUOttKW6sDA=; b=IFtrTuTqam25SdDIG/V4Xk7Le
	vxW0TzM2bkO16yyy2EgIFOafDUdUgMifaVmgioMG755pDY8hijliGkIw97apNcU9J9MFIwV7wFAgZ
	2SrRqPOkR03TX3mSMGtUhmrtEQ01Kurnu2cKUQRtr5qRrH4O2QrB7pagQfI9228+DIurt8pC7pXAq
	sBu8zbnZf36Cu9IKiQ6DQ9rBj3HjKQOeuSXuTGVENpqz2TetTfzVpzgjnjWroNrxAB8GS0cVu5I6A
	Brdht6biW/8+90ARKdSWRaRWav8tCvqPwSk6i5qXrUau0U+318aPfE5Y3aL0o1wKt1hHxQ/y6rXah
	4rJJO8w8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuCpr-0007Vm-F8; Tue, 29 Dec 2020 11:06:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuCpp-0007Us-Gi; Tue, 29 Dec 2020 11:06:38 +0000
X-UUID: 4c64931a0c6b4f4e96e0634fad4bbdbc-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zfneozaYhu5jrm9Q37fk5lPpqTHzSi4uBaXsfUw6RZ4=; 
 b=d/GtmkfrcVVoKg7bt9DUuhAV80/rBN+Xx3WwuVWVSepVFzLB/78no5f/yPDCWnaCCVcZ5wz0rauU9YuCXc5drwt2UhVvwtY3QW/2dPNfkXtSbExbUpXUWmS+t7x4N1HFfYg7CWiw6VFXzwokHH+CF3mQIaodvxz5dNkbL33llhE=;
X-UUID: 4c64931a0c6b4f4e96e0634fad4bbdbc-20201229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 325197474; Tue, 29 Dec 2020 03:06:30 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 03:06:29 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 19:06:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 19:06:18 +0800
Message-ID: <1609239977.26323.292.camel@mhfsdcap03>
Subject: Re: [PATCH v5 18/27] iommu/mediatek: Add power-domain operation
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 19:06:17 +0800
In-Reply-To: <X+MBcmzQn9iQWlVZ@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <X+MBcmzQn9iQWlVZ@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D6856EB35728775B524D669116D09ECF5C09C39014423CFC3B03E7EB5EA35C712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_060637_704622_5F28163A 
X-CRM114-Status: GOOD (  32.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:36 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:53PM +0800, Yong Wu wrote:
> > In the previous SoC, the M4U HW is in the EMI power domain which is
> > always on. the latest M4U is in the display power domain which may be
> > turned on/off, thus we have to add pm_runtime interface for it.
> > 
> > When the engine work, the engine always enable the power and clocks for
> > smi-larb/smi-common, then the M4U's power will always be powered on
> > automatically via the device link with smi-common.
> > 
> > Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> > If its power already is on, of course it is ok. if the power is off,
> > the main tlb will be reset while M4U power on, thus the tlb flush while
> > m4u power off is unnecessary, just skip it.
> > 
> > There will be one case that pm runctime status is not expected when tlb
> > flush. After boot, the display may call dma_alloc_attrs before it call
> > pm_runtime_get(disp-dev), then the m4u's pm status is not active inside
> > the dma_alloc_attrs. Since it only happens after boot, the tlb is clean
> > at that time, I also think this is ok.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 41 +++++++++++++++++++++++++++++++++------
> >  1 file changed, 35 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 6fe3ee2b2bf5..0e9c03cbab32 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -184,6 +184,8 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
> >  	struct mtk_iommu_data *data = cookie;
> >  
> >  	for_each_m4u(data) {
> > +		if (!pm_runtime_active(data->dev))
> > +			continue;
> 
> Is it guaranteed that the status is active in the check above, but then
> the process is preempted and it goes down here?
> 
> Shouldn't we do something like below?
> 
>         ret = pm_runtime_get_if_active();
>         if (!ret)
>                 continue;
>         if (ret < 0)
>                 // handle error
>         
>         // Flush
>         
>         pm_runtime_put();

Make sense. Thanks. There is a comment in arm_smmu.c "avoid touching
dev->power.lock in fastpaths". To avoid this here too(we have many SoC
don't have power-domain). then the code will be like:

	bool has_pm = !!data->dev->pm_domain;

	if (has_pm) {
		if (pm_runtime_get_if_in_use(data->dev) <= 0)
			continue;
	}

	xxxx

	if (has_pm)
		pm_runtime_put(data->dev);
> 
> Similar comment to the other places being changed by this patch.
> 
> >  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >  			       data->base + data->plat_data->inv_sel_reg);
> >  		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> > @@ -200,6 +202,10 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >  	u32 tmp;
> >  
> >  	for_each_m4u(data) {
> > +		/* skip tlb flush when pm is not active. */
> > +		if (!pm_runtime_active(data->dev))
> > +			continue;
> > +
> >  		spin_lock_irqsave(&data->tlb_lock, flags);
> >  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >  			       data->base + data->plat_data->inv_sel_reg);
[snip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
