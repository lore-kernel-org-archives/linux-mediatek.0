Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71B3C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 06:43:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EF82075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 06:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLBoqTvM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hnEyEfo9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76EF82075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1X7cBwjN+Y6ShgXLPlXSZ0Bzv2R0+NmdN1QvwiWcTKo=; b=MLBoqTvMobD76ZW8wix12tOGC
	zVwwbyWZn7m48x7cF2ecr99YaQ/58p+ncAHG7kHVfNzKY9tH0Zzk5DWwLxrkpDhnNDsufyz9rMDnQ
	/EKUAmDfcqP2KHI2rLD/T3oos7TIGgWUx4yqzipL3W7rMwoCXaoZCjHAW9wb07UHj2GtQhD/u97V9
	JWzCYeuudGsjOAf8VUtEMG9i4IDkig4H/EPWmuIu5ZFEykAscPtZQDezZJ51N7XqwVBd6u1wpWO5b
	Fo8rOEVGucv2+EIrHk+xbc2+O3HxjcSpcfb7bmZDR9hhIyoP6K2KvP2B00PqVF8goTOoXitSVgj93
	PAjoNu2pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzwqf-0002ep-J6; Mon, 27 Jul 2020 06:42:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzwqa-0002dG-Cr; Mon, 27 Jul 2020 06:42:53 +0000
X-UUID: 80d071e28933465b82b48bb065f455c5-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sPmuXHpH9XNlFgouHZYOVCVUIZrXlxeu/KMhxKhqoFc=; 
 b=hnEyEfo9GihEwjbwGOBSKTE28zHQl4tfcGVCk+JWgPxpnmhv10A0iQa8rOG7X+DRJ44fkCcsaWH+Ta/LtfLtZtIddtu8iLlhaBZps84mZecR0A7BUltgYWKsbXW+9G+JZxJXtf/KAMeojBwLiaWylaeNm0Ri1DK2te9tPiiR+gk=;
X-UUID: 80d071e28933465b82b48bb065f455c5-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 436038598; Sun, 26 Jul 2020 22:42:48 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jul 2020 23:42:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 27 Jul 2020 14:42:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 14:42:35 +0800
Message-ID: <1595832080.16172.88.camel@mhfsdcap03>
Subject: Re: [PATCH 18/21] iommu/mediatek: Add support for multi domain
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jul 2020 14:41:20 +0800
In-Reply-To: <20200723204729.GA823856@bogus>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-19-yong.wu@mediatek.com>
 <20200723204729.GA823856@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AAEEA5DEDA078252AF7983EB2F3959E34D7A075A7A10B725C05A35A5BB0517B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_024252_653204_681F9519 
X-CRM114-Status: GOOD (  20.35  )
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
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan
 Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-23 at 14:47 -0600, Rob Herring wrote:
> On Sat, Jul 11, 2020 at 02:48:43PM +0800, Yong Wu wrote:
> > Some HW IP(ex: CCU) require the special iova range. That means the
> > iova got from dma_alloc_attrs for that devices must locate in his
> > special range. In this patch, we allocate a special iova_range for
> > each a special requirement and create each a iommu domain for each
> > a iova_range.
> > 
> > meanwhile we still use one pagetable which support 16GB iova.
> > 
> > After this patch, If the iova range of a master is over 4G, the master
> > should:
> > a) Declare its special dma_ranges in its dtsi node. For example, If we
> > preassign the iova 4G-8G for vcodec, then the vcodec dtsi node should:
> > 	dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;  /* 4G ~ 8G */
> 
> BTW, dma-ranges should be in the parent node of the vcodec.

But the vcodec doesn't have its special parent node. Currently the
vcodec/display dtsi like this:

soc {

    ovl:{  /* display */
    /*No dma-ranges property. defaultly it is 0-4G iova range. */
    }

    vcodec_dec: { /* decode */
    dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>; /* 4G ~ 8G*/
    };

    vcodec_enc: {  /* encode */
    dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>; /* 4G ~ 8G*/
    };

    camera: {
    dma-ranges = <0x2 0x0 0x2 0x0 0x1 0x0>; /* 8G ~ 12G */
    };

}

If we add the parent node for vcodec, the vcodec driver flow will be
changed, and it may be incompatible with the previous dtb.

Here we don't have the actual bus concept. currently we support 16GB
dma_addr(iova) ranges. we only preassign 4-8G for vcodec, 8G-12G for
camera.

If the usage of dma-ranges here is different from the common one. then
how should I do here?

Thanks.
> 
> > b) Update the dma_mask:
> >  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
> 
> This should happen for you automatically. The DMA PFN offset 
> should also be 4GB here.

I may not follow here.

If the iova start at 0x1_0000_0000, phys address start at 0x4000_0000.
Do you means the dma-ranges should be <0x1 0 0x0 0x40000000 0x1 0x0>?
then dma_pfn_offset = PFN_DOWN(paddr - dma_addr) = 0xffffffff40000. this
is also ok for us. we don't call the macro regarding this
"dev->dma_pfn_offset"

The purpose that I call it here is for updating the
dev->coherent_dma_mask[1], then we could get the iova over 4GB.

[1]
https://elixir.bootlin.com/linux/v5.8-rc1/source/drivers/iommu/dma-iommu.c#L619

> 
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 49 ++++++++++++++++++++++++++++++++-------
> >  drivers/iommu/mtk_iommu.h |  3 ++-
> >  2 files changed, 42 insertions(+), 10 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
