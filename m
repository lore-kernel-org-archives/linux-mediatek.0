Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC04C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 03:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DFE61053
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 03:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35DFE61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVIJH4R+RuC3NSyiaObR+tmPWIflWMfFMDFAcnSSsi0=; b=uNhO8rLy7mz9GC
	sp8KIvTO6LQU83WnE/Q+PukH5kZnwg42VTnjktovPEyri25PPSVCqcVMEXmqN3s3CkRWuUPfeQ84b
	KiSw3vq5+lzAmWT/A6mkTZhoSjpXuqiPABVPf27awRHKGZ9o6/B/EppxzfptCaRQb5maHilaDJQ1l
	tDd6cFTSPlt8orAIL6cBtckDM2tRHfwcKomjO27W2Tf80JiaIixjVX+wkQRBMMCWg7WSKzpnp0jAC
	YiGtxs0bkD3hT6efIT9B8W/ipIs6IL16orgEzc4Q412wOcXKMD9eCVgNd30iZf2ssPZf1Aag1v2Hj
	7QtmEbQPa2ARXQvZGg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miTQp-007kht-6D; Thu, 04 Nov 2021 03:28:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miTQl-007kgy-Ex; Thu, 04 Nov 2021 03:28:50 +0000
X-UUID: c2e03e1b9ad247d78187b7485b2b00b0-20211103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=obhkLKakLCXFFdtMrvJQpCX8waFJ6arRjOpKnMlEJDY=; 
 b=U6zaoP1mGU96Nokuy8oq1aI2tau0zHNR3Yxt4Y7okHdW2UZR7EqlN9PsDuksG1w2D6vRJw3bVpp4P962Juelz95P5eTZgZnomeBRu5D3Jttd11X3Y0bnZotvFGpy+JauBYOg+BzddzK4f0h6+kMjnk7YTxN0EwBqfSN37+jfPFw=;
X-UUID: c2e03e1b9ad247d78187b7485b2b00b0-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1586787048; Wed, 03 Nov 2021 20:28:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 20:28:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 11:28:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 11:28:38 +0800
Message-ID: <e099c6e8af0b184f8e823fac325ea36329cb5709.camel@mediatek.com>
Subject: Re: [PATCH v3 13/33] iommu/mediatek: Remove the power status
 checking in tlb flush all
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <yen-chang.chen@mediatek.com>, Collabora Kernel ML <kernel@collabora.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Date: Thu, 4 Nov 2021 11:28:38 +0800
In-Reply-To: <f0e2ebf98481ee2ae8b88565a337e773532ddffd.camel@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-14-yong.wu@mediatek.com>
 <6cff0b97-b861-e02d-e76f-2510c962c452@collabora.com>
 <f0e2ebf98481ee2ae8b88565a337e773532ddffd.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_202847_534932_19A0FC22 
X-CRM114-Status: GOOD (  35.82  )
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

On Mon, 2021-10-25 at 12:03 +0800, Yong Wu wrote:
> On Fri, 2021-10-22 at 16:03 +0200, Dafna Hirschfeld wrote:
> > Hi
> > 
> > 
> > On 23.09.21 13:58, Yong Wu wrote:
> > > To simplify the code, Remove the power status checking in the
> > > tlb_flush_all, remove this:
> > >     if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > > 	    continue;
> > > 
> > > After this patch, the mtk_iommu_tlb_flush_all will be called from
> > > a) isr
> > > b) pm runtime resume callback
> > > c) tlb flush range fail case
> > > d) iommu_create_device_direct_mappings
> > >     -> iommu_flush_iotlb_all
> > > In first three cases, the power and clock always are enabled; d)
> > > is
> > > direct
> > 
> > Regarding case "c) tlb flush range fail case", I found out that
> > this
> > often happens when the iommu is used while it is runtime
> > suspended. 
> 
> Which SoC and branch are you testing on?
> 
> > For example the mtk-vcodec encoder driver calls
> > "pm_runtime_resume_and_get" only when it starts
> > streaming but
> > buffers allocation is done in 'v4l2_reqbufs' before
> > "pm_runtime_resume_and_get" is called
> 
> This is the case I tried to fix in [14/33].
> pm_runtime_get_if_in_use should return when the iommu device's pm is
> not active when vcodec allocate buffer before pm_runtime_resume_and
> get.
> 
> Do you have the devicelink patchset in your branch? if not, the
> vcodec
> should call mtk_smi_larb_get to enable the power/clock for larbs,
> then
> the iommu's device is active via devicelink between smi and iommu
> device.
> 
> > and then I see the warning "Partial TLB flush timed out, falling
> > back
> > to full flush"
> > I am not sure how to fix that issue, but it seems that case 'c)'

Have your issue been fixed? or more information about it.

Thanks.

> > might indicate that
> > power and clock are actually not enabled.
> > 
> > > mapping, the tlb flush is unnecessay since we already have
> > > tlb_flush_all
> > > in the pm_runtime_resume callback. When the iommu's power status
> > > is
> > > changed to active, the tlb always is clean.
> > > 
> > > In addition, there still are 2 reasons that don't add PM status
> > > checking
> > > in the tlb flush all:
> > > a) Write tlb flush all register also is ok even though the HW has
> > > no
> > > power and clocks. Write ignore.
> > > b) pm_runtime_get_if_in_use(m4udev) is 0 when the tlb_flush_all
> > > is called frm pm_runtime_resume cb. From this point, we can not
> > > add
> > > this code above in this tlb_flush_all.
> > > 
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >   drivers/iommu/mtk_iommu.c | 20 +++++++-------------
> > >   1 file changed, 7 insertions(+), 13 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
