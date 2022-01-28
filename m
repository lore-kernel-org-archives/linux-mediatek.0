Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjWpaBFwjkpDzeuIorlRsKCcwSq3/P5w7W29lpqJbIE=; b=C1UlOwc5P1R2Rh
	UccAZDG7VhtVjO+Oya32JmP+jrPAHPBJ56se/8V9RAenhuorDdqRO44s/QsaO405O25siUQWXX3xf
	WTwmrGloanl3a8fGPe+2cE2AkvloU6f/Jet5AslfaRS1vxmsj3XTBs9HJxhQ+Y2O2Wt3fBI6IcGO4
	pMxXymY0FdrD4tXhtueKuhzNeosMBLYiLksR7ccY+nFMc/33ePLju5r85WJsdf4Kfg4bczG2J+Sd2
	Y47BNma2SLNV7IG0YxMj1CS8RqOb279eo4pU4LlJ5WjCblYTaKwd8y7BuIjoR8UtvnxBwPoTMLDu0
	e6JTUGSxtbN0Ws+5fMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNjs-001HwD-No; Fri, 28 Jan 2022 09:40:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNix-001HSK-1Z; Fri, 28 Jan 2022 09:39:20 +0000
X-UUID: 4ed5408d92724480894c14c2cfd0e8a5-20220128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YEhcHl5ugfs3qee3Ns4VwC5s7j4iQhC8FhYtbM9GwQE=; 
 b=VfS8HN6I17sNuW1maxLuXFJjROONfuGaB+Saf+sGnDtnUheRAoLqK05j976lsuW8aNxGqgyFDeq5YFFHkkvlRyqirjtIEnQ0vZquA+o85i8TpHXdfPKQRFUJeYJBd4lP+wMBHTOzAdC65TBfqK8F9zLjqACgdZhr1IpLUtX4Bdk=;
X-UUID: 4ed5408d92724480894c14c2cfd0e8a5-20220128
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 395779715; Fri, 28 Jan 2022 02:39:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 01:39:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 17:39:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 17:39:07 +0800
Message-ID: <01cc69cdf7773962140c01fe37b12ab2c9491c25.camel@mediatek.com>
Subject: Re: [PATCH 2/2] iommu/mediatek: Add mt8186 iommu support
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>,
 <yen-chang.chen@mediatek.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Date: Fri, 28 Jan 2022 17:39:06 +0800
In-Reply-To: <b52a1df8-58f4-baa2-cfb6-9c56244caa0f@collabora.com>
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-3-yong.wu@mediatek.com>
 <b52a1df8-58f4-baa2-cfb6-9c56244caa0f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_013919_155684_69E98D1F 
X-CRM114-Status: GOOD (  15.78  )
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

On Thu, 2022-01-27 at 12:28 +0100, AngeloGioacchino Del Regno wrote:
> Il 25/01/22 10:32, Yong Wu ha scritto:
> > Add mt8186 iommu supports.
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)

[snip]

> >   static const struct mtk_iommu_plat_data mt8192_data = {
> >   	.m4u_plat       = M4U_MT8192,
> >   	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS |
> > OUT_ORDER_WR_EN |
> > @@ -1470,6 +1486,7 @@ static const struct of_device_id
> > mtk_iommu_of_ids[] = {
> >   	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
> >   	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
> >   	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
> > +	{ .compatible = "mediatek,mt8186-iommu-mm", .data =
> > &mt8186_data_mm},
> 
> Hello!
> 
> Is there any particular reason why this compatible is not
> "mediatek,mt8186-m4u"?

There is no special reason. In the previous SoC, We only support MM
IOMMU, it was called by "m4u". In the lastest SoC, We have the other
types IOMMU, like for INFRA masters and APU, thus they are called "mm
iommu", "infra iommu" and "apu iommu". Of course, "m4u" means "mm
iommu".

> 
> Thanks,
> Angelo
> 
> >   	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
> >   	{ .compatible = "mediatek,mt8195-iommu-infra", .data =
> > &mt8195_data_infra},
> >   	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data =
> > &mt8195_data_vdo},
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
