Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D47C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A27611BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98A27611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rtJ/Dlam8ojNsM/0talbt0xSlqBjSlhnMRVXcvdKw0=; b=1qovqV/MdLhrWf
	SHLARv8t9rXoCeyG9EfLF00th2k+1xBUFNaVnbHHp3AlTbGQfuKPVjx/D2/tFeG8mc3P1pf0ctCfC
	RhLS9qq3lGUglZi73tCVZOlCtqWzeJakM+yjKSJ0dGi6KOnu9IaPCVSLM08/j0uI//pwZ8hHcqobM
	OKnkeCJL/2Nh2dsv32YWmAz1U0HbgW2qVnGL0BkqZzaBBvg2/pC7FZV4QOWgeqvBCRZt7iQlQLjH4
	sLotrS2VPPBcp24GJVL0MiVh2uPoFX1HQ7dBN5gXk7u7YYAVv1SJe6U+EEURWridlF8BncFMliUbl
	o6R9/EYEfn0smQJ4z0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkiPY-004i5R-KK; Wed, 10 Nov 2021 07:52:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkiPL-004i4K-3X; Wed, 10 Nov 2021 07:52:37 +0000
X-UUID: eb82e5a0f4b5425984f0d47a158617eb-20211110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/1TqjzBPrVnDfHluNmOR1PKD5KL7XLPSyUrvjjeeBGU=; 
 b=raoSaaXfYpHdufSaRygm0z2rFU90ys0L4RxA9R1VrYpg2fPg2eNVAJXQqSyuYFdz+KSBp0QDJZMMKFDvHetc6j/tAFwvjlkcFX/L3jAPp8uTUuhY2O9B3/i2+Bihe8qguNiVnVe5QE56EHF4asUK/IWZAktYmuiJ9k3i1rp7j6U=;
X-UUID: eb82e5a0f4b5425984f0d47a158617eb-20211110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 141922222; Wed, 10 Nov 2021 00:52:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 23:50:27 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 10 Nov 2021 15:50:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Nov 2021 15:50:25 +0800
Message-ID: <c69e03b4781dd9014393e0ff47767c58c846a722.camel@mediatek.com>
Subject: Re: [PATCH v3 12/33] iommu/mediatek: Always tlb_flush_all when each
 PM resume
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <yen-chang.chen@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, <sebastian.reichel@collabora.com>, "Collabora Kernel
 ML" <kernel@collabora.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>
Date: Wed, 10 Nov 2021 15:50:25 +0800
In-Reply-To: <4dd4cf8d-0f52-afae-f7d9-8e3cfdf3b729@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-13-yong.wu@mediatek.com>
 <c4be1a14-c257-81b7-4a2b-f7e68c32de88@collabora.com>
 <5c4dd67ae7c81721d8cfd2c3b23b7c6df493cb5a.camel@mediatek.com>
 <4dd4cf8d-0f52-afae-f7d9-8e3cfdf3b729@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_235235_195938_43792CED 
X-CRM114-Status: GOOD (  57.46  )
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

On Wed, 2021-11-10 at 07:29 +0200, Dafna Hirschfeld wrote:
> 
> On 10.11.21 04:20, Yong Wu wrote:
> > On Tue, 2021-11-09 at 14:21 +0200, Dafna Hirschfeld wrote:
> > > Hi
> > > This patch is needed in order to update the tlb when a device is
> > > powered on.
> > > Could you send this patch alone without the whole series so it
> > > get
> > > accepted easier?
> > 
> > Which SoC are you testing on? In previous SoC, the IOMMU HW don't
> > have
> > power-domain, and we have a "has_pm"[1] in the tlb function for
> > that
> > case. The "has_pm" should be always 0 for the previous SoC like
> > mt8173,
> > it should always tlb synchronize.
> > 
> > thus, Could you help share more about your issue? In which case it
> > lack
> > the necessary tlb operation. At least, We need confirm if it needs
> > a
> > "Fixes" tags if sending this patch alone.
> 
> Hi,
> I work with the mtk-vcodec driver on mt8173. As you wrote, the iommu
> doesn't
> have a power-domain and so when allocating buffers before the device
> is powered
> on, there is the warning
> "Partial TLB flush timed out, falling back to full flush"
> flooding the log buf.

oh. Thanks very much for your information. Get it now.

This issue should be introduced by the:

b34ea31fe013 ("iommu/mediatek: Always enable the clk on resume")

tlb failed due to the bclk is not enabled. Could you help try that
after reverting this?

> 
> Sebastian Reichel suggested to remove the 'if(has_pm)' check to avoid
> this warning,
> and avoid flushing the tlb if the device is off:
> 
> [1] http://ix.io/3Eyr
> 
> This fixes the warning, but then the tlb is not flushed in sync,
> Therefore the tlb should be flushed when the device is resumed.
> 
> So the two patches (the one suggested in the link [1] and this patch)
> should be sent together as a 2-patch series.

then this is reasonable. You could help this into a new patchset if you
are free(add Fixes tag).

Thanks.

> 
> Thanks,
> Dafna
> 
> > 
> > Thanks.
> > 
> > [1]
> > 
https://elixir.bootlin.com/linux/v5.15/source/drivers/iommu/mtk_iommu.c#L236
> > 
> > > I can resend the patch on your behalf if you want.
> > > 
> > > Thanks,
> > > Dafna
> > > 
> > > On 23.09.21 14:58, Yong Wu wrote:
> > > > Prepare for 2 HWs that sharing pgtable in different power-
> > > > domains.
> > > > 
> > > > When there are 2 M4U HWs, it may has problem in the flush_range
> > > > in
> > > > which
> > > > we get the pm_status via the m4u dev, BUT that function don't
> > > > reflect the
> > > > real power-domain status of the HW since there may be other HW
> > > > also
> > > > use
> > > > that power-domain.
> > > > 
> > > > The function dma_alloc_attrs help allocate the iommu buffer
> > > > which
> > > > need the corresponding power domain since tlb flush is needed
> > > > when
> > > > preparing iova. BUT this function only is for allocating
> > > > buffer,
> > > > we have no good reason to request the user always call
> > > > pm_runtime_get
> > > > before calling dma_alloc_xxx. Therefore, we add a tlb_flush_all
> > > > in the pm_runtime_resume to make sure the tlb always is clean.
> > > > 
> > > > Another solution is always call pm_runtime_get in the
> > > > tlb_flush_range.
> > > > This will trigger pm runtime resume/backup so often when the
> > > > iommu
> > > > power is not active at some time(means user don't call
> > > > pm_runtime_get
> > > > before calling dma_alloc_xxx), This may cause the performance
> > > > drop.
> > > > thus we don't use this.
> > > > 
> > > > In other case, the iommu's power should always be active via
> > > > device
> > > > link with smi.
> > > > 
> > > > The previous SoC don't have PM except mt8192. the mt8192 IOMMU
> > > > is
> > > > display's
> > > > power-domain which nearly always is enabled. thus no need fix
> > > > tags
> > > > here.
> > > > Prepare for mt8195.
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >    drivers/iommu/mtk_iommu.c | 11 +++++++++++
> > > >    1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/drivers/iommu/mtk_iommu.c
> > > > b/drivers/iommu/mtk_iommu.c
> > > > index 44cf5547d084..e9e94944ed91 100644
> > > > --- a/drivers/iommu/mtk_iommu.c
> > > > +++ b/drivers/iommu/mtk_iommu.c
> > > > @@ -984,6 +984,17 @@ static int __maybe_unused
> > > > mtk_iommu_runtime_resume(struct device *dev)
> > > >    		return ret;
> > > >    	}
> > > >    
> > > > +	/*
> > > > +	 * Users may allocate dma buffer before they call
> > > > pm_runtime_get, then
> > > > +	 * it will lack the necessary tlb flush.
> > > > +	 *
> > > > +	 * We have no good reason to request the users always
> > > > call
> > > > dma_alloc_xx
> > > > +	 * after pm_runtime_get_sync.
> > > > +	 *
> > > > +	 * Thus, Make sure the tlb always is clean after each
> > > > PM
> > > > resume.
> > > > +	 */
> > > > +	mtk_iommu_tlb_do_flush_all(data);
> > > > +
> > > >    	/*
> > > >    	 * Uppon first resume, only enable the clk and return,
> > > > since
> > > > the values of the
> > > >    	 * registers are not yet set.
> > > > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
