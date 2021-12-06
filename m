Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E576AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jani7mglPWZe52sBXLVZ5E2LFNxIDNOolSEqtyFs2T0=; b=UVIiy9OqglWaEe
	G6WEQE6WkAa2wmdAT3kiq5gJL/Ck8m7LgPRaMWCALl7girWCBD/1EBQee/PUwKReZBDkZAYEX6iah
	iEOZOSlSCGSOYiGV6cRcoJd7AgNaiFFH7uJIHTD+DsHTFW+Ub+mWoK7qC43EhpTimZoRvipptBTmE
	BUFDvF8uornyk4mYkc42WzzcwoymnGaLtuL64GNy7yOxo4uN24C2SM2NjzcAkZPqG8cevZWT6aeeP
	MhmKRUfbjh7M98lVoFc0Sgq34/eS0efEpDqyMeir8V+Ktj2/Yz/1fjQnV4RyqphACCvbtH1aCP28C
	r3f7U+KLd/44HMIjxYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu9MJ-002udf-En; Mon, 06 Dec 2021 08:28:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu9M4-002uXP-Ra; Mon, 06 Dec 2021 08:28:14 +0000
X-UUID: 96e8dc2f7d0c4af7bcdda4b86b48b44b-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x6YtsVKT5SbA+fAmPG41G/VMiY4QVQjlGJqlNFJ+A68=; 
 b=GNUUDpkb4nqaw/D5eLC44xtXblzMMrj+glo2DaXZ6Z3JnNut3AKqnZA3VwvxuKsa/UsGvp5Fbrs00PXQB7UPFpP7Di7ZcddIe1JcRvKLW/W9Jv3FzvVGmY/WbsYO/4NhRwn2rW7wO9hHVjWQSs24JSvpNTVWveso0ioyjagJrKo=;
X-UUID: 96e8dc2f7d0c4af7bcdda4b86b48b44b-20211206
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 592560395; Mon, 06 Dec 2021 01:28:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 00:28:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 6 Dec 2021 16:28:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Dec 2021 16:28:01 +0800
Message-ID: <9fd624a9f0752b92f309c0bb8524547f250830cb.camel@mediatek.com>
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
Date: Mon, 6 Dec 2021 16:28:00 +0800
In-Reply-To: <58b13d3a-e89b-d2e3-278d-af8859d901b9@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-13-yong.wu@mediatek.com>
 <c4be1a14-c257-81b7-4a2b-f7e68c32de88@collabora.com>
 <5c4dd67ae7c81721d8cfd2c3b23b7c6df493cb5a.camel@mediatek.com>
 <4dd4cf8d-0f52-afae-f7d9-8e3cfdf3b729@collabora.com>
 <c69e03b4781dd9014393e0ff47767c58c846a722.camel@mediatek.com>
 <c5ded58b-a53a-3089-f8a5-c264f8ab9463@collabora.com>
 <128eb1874127b2b9b42a7419e26090d1d192666f.camel@mediatek.com>
 <58b13d3a-e89b-d2e3-278d-af8859d901b9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_002812_928392_35F71F80 
X-CRM114-Status: GOOD (  47.21  )
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

On Tue, 2021-11-30 at 13:33 +0200, Dafna Hirschfeld wrote:
> 
> On 30.11.21 09:39, Yong Wu wrote:
> > On Sat, 2021-11-27 at 12:11 +0200, Dafna Hirschfeld wrote:
> > > 
> > > On 10.11.21 09:50, Yong Wu wrote:
> > > > On Wed, 2021-11-10 at 07:29 +0200, Dafna Hirschfeld wrote:
> > > > > 
> > > > > On 10.11.21 04:20, Yong Wu wrote:
> > > > > > On Tue, 2021-11-09 at 14:21 +0200, Dafna Hirschfeld wrote:
> > > > > > > Hi
> > > > > > > This patch is needed in order to update the tlb when a
> > > > > > > device
> > > > > > > is
> > > > > > > powered on.
> > > > > > > Could you send this patch alone without the whole series
> > > > > > > so
> > > > > > > it
> > > > > > > get
> > > > > > > accepted easier?
> > > > > > 
> > > > > > Which SoC are you testing on? In previous SoC, the IOMMU HW
> > > > > > don't
> > > > > > have
> > > > > > power-domain, and we have a "has_pm"[1] in the tlb function
> > > > > > for
> > > > > > that
> > > > > > case. The "has_pm" should be always 0 for the previous SoC
> > > > > > like
> > > > > > mt8173,
> > > > > > it should always tlb synchronize.
> > > > > > 
> > > > > > thus, Could you help share more about your issue? In which
> > > > > > case
> > > > > > it
> > > > > > lack
> > > > > > the necessary tlb operation. At least, We need confirm if
> > > > > > it
> > > > > > needs
> > > > > > a
> > > > > > "Fixes" tags if sending this patch alone.
> > > > > 
> > > > > Hi,
> > > > > I work with the mtk-vcodec driver on mt8173. As you wrote,
> > > > > the
> > > > > iommu
> > > > > doesn't
> > > > > have a power-domain and so when allocating buffers before the
> > > > > device
> > > > > is powered
> > > > > on, there is the warning
> > > > > "Partial TLB flush timed out, falling back to full flush"
> > > > > flooding the log buf.
> > > > 
> > > > oh. Thanks very much for your information. Get it now.
> > > > 
> > > > This issue should be introduced by the:
> > > > 
> > > > b34ea31fe013 ("iommu/mediatek: Always enable the clk on
> > > > resume")
> > > 
> > > Hi, reverting this commit didn't solve those warnings,
> > > I think this is because in the function mtk_iommu_attach_device
> > > the first call to pm_runtime_resume_and_get does not turn the
> > > clks on
> > > since m4u_dom is not yet initialize. And then
> > > mtk_iommu_attach_device
> > > calls pm_runtime_put right after mtk_iommu_hw_init is called
> > > (where the clks are turned on)
> > 
> > oh. Right. this is also related with the patch of "Add power-domain
> > operation".
> > 
> > The current problem is that there is a redundant log of "Partial
> > TLB
> > flush timed out" in mt8173. We need fix this issue firstly. Are you
> > going to prepare the patches again? If not, I could help this. You
> > could help confirm them if you are free.
> 
> Hi,
> I already sent a patch last week: 
> https://lore.kernel.org/linux-iommu/afb46ad6ca9477a2bf71233858406caa6ccb1588.camel@mediatek.com/T/
> could you please review it?

I have replied them before you send this reply. Have you got them?


https://lore.kernel.org/linux-iommu/afb46ad6ca9477a2bf71233858406caa6ccb1588.camel@mediatek.com/

https://lore.kernel.org/linux-iommu/6abef78f6447c626b737fd35688f421c29871f43.camel@mediatek.com/

Thanks.

> 
> Thanks,
> Dafna
> 
> 
> 
> > 
> > Thanks.
> > 
> > > 
> > > thanks,
> > > Dafna
> > > 
> > > 
> > > > 
> > > > tlb failed due to the bclk is not enabled. Could you help try
> > > > that
> > > > after reverting this?
> > > > 
> > > > > 
> > > > > Sebastian Reichel suggested to remove the 'if(has_pm)' check
> > > > > to
> > > > > avoid
> > > > > this warning,
> > > > > and avoid flushing the tlb if the device is off:
> > > > > 
> > > > > [1] http://ix.io/3Eyr
> > > > > 
> > > > > This fixes the warning, but then the tlb is not flushed in
> > > > > sync,
> > > > > Therefore the tlb should be flushed when the device is
> > > > > resumed.
> > > > > 
> > > > > So the two patches (the one suggested in the link [1] and
> > > > > this
> > > > > patch)
> > > > > should be sent together as a 2-patch series.
> > > > 
> > > > then this is reasonable. You could help this into a new
> > > > patchset if
> > > > you
> > > > are free(add Fixes tag).
> > > > 
> > > > Thanks.
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Dafna
> > > > > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
