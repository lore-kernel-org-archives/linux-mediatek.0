Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E4EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 03:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVLPbkt09xdJKbfy3v67xQ2SXFArgbFyA+D5rBCEPNg=; b=2y+qZENUOGNckY
	pTzoh2hvyLhQGGshti1xLm+5Cln7FO5ddykZYgdMVZlvsAPuT6FSISiUAB1+8x9Fq7WX0856xfHRY
	fXLBoI1221Z5bCMBN7dUmOxlH64mbDbavGyRx77mJ7YtaNyA3hmHuX2YS9lQkvEsEUW7RtIbo98vq
	41QrY4hGekNtjT4MyxC/h0zxg3pgQAyHXg2WObznK9H2MhGeFoh9EhJeDuJSQyUGNclZRCSqC4Pva
	XSP4EJ7jwDF+A9DmHnsRX8gzk67LsEH6Zro9F7p9LCqMz9TZlC3pvxg/+nBzt2MNpCujtwNl7kWTy
	x/AqXcS+A38FL+4qo6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKu53-00Cnpd-FV; Fri, 18 Feb 2022 03:37:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKu4y-00Cnop-Ov; Fri, 18 Feb 2022 03:37:12 +0000
X-UUID: d09d733af71a43acb7d9a813744de750-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x8l3NNGlUTvwfjKbv3zpFUV8vLbyHy1CAvC89wV2ME4=; 
 b=cKaWirrS95oRS1pfbx5Ivu4bQ9/zgizFvoSvTMJH3ppqq7Gh5OpsnOlpm2WAv9D1/SQYy9Nl3biLfgWMF2XLnGesadHTNMCLIXQjS8dkYQUoSKbxaISJ6eUX4lfHx/SnGUyEvf2W0HldxDdrplARUUaBlsRTlPgwjB9Sf9keZMM=;
X-UUID: d09d733af71a43acb7d9a813744de750-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1227519048; Thu, 17 Feb 2022 20:37:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 19:32:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Feb 2022 11:32:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Feb 2022 11:32:43 +0800
Message-ID: <8b63983222a4a304586a7b880379fcf4a7036c4a.camel@mediatek.com>
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
Date: Fri, 18 Feb 2022 11:32:43 +0800
In-Reply-To: <0e430d1e-ee25-1b3d-4a2c-8641db255adb@collabora.com>
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-3-yong.wu@mediatek.com>
 <b52a1df8-58f4-baa2-cfb6-9c56244caa0f@collabora.com>
 <01cc69cdf7773962140c01fe37b12ab2c9491c25.camel@mediatek.com>
 <0e430d1e-ee25-1b3d-4a2c-8641db255adb@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_193710_643241_6005C810 
X-CRM114-Status: GOOD (  23.98  )
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

On Mon, 2022-01-31 at 10:25 +0100, AngeloGioacchino Del Regno wrote:
> Il 28/01/22 10:39, Yong Wu ha scritto:
> > On Thu, 2022-01-27 at 12:28 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 25/01/22 10:32, Yong Wu ha scritto:
> > > > Add mt8186 iommu supports.
> > > > 
> > > > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >    drivers/iommu/mtk_iommu.c | 17 +++++++++++++++++
> > > >    1 file changed, 17 insertions(+)
> > 
> > [snip]
> > 
> > > >    static const struct mtk_iommu_plat_data mt8192_data = {
> > > >    	.m4u_plat       = M4U_MT8192,
> > > >    	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS |
> > > > OUT_ORDER_WR_EN |
> > > > @@ -1470,6 +1486,7 @@ static const struct of_device_id
> > > > mtk_iommu_of_ids[] = {
> > > >    	{ .compatible = "mediatek,mt8167-m4u", .data =
> > > > &mt8167_data},
> > > >    	{ .compatible = "mediatek,mt8173-m4u", .data =
> > > > &mt8173_data},
> > > >    	{ .compatible = "mediatek,mt8183-m4u", .data =
> > > > &mt8183_data},
> > > > +	{ .compatible = "mediatek,mt8186-iommu-mm", .data =
> > > > &mt8186_data_mm},
> > > 
> > > Hello!
> > > 
> > > Is there any particular reason why this compatible is not
> > > "mediatek,mt8186-m4u"?
> > 
> > There is no special reason. In the previous SoC, We only support MM
> > IOMMU, it was called by "m4u". In the lastest SoC, We have the
> > other
> > types IOMMU, like for INFRA masters and APU, thus they are called
> > "mm
> > iommu", "infra iommu" and "apu iommu". Of course, "m4u" means "mm
> > iommu".
> > 
> 
> I suggest, at this point, to change it to "mediatek,mt8186-m4u" for
> naming
> consistency with the other bindings and to avoid any kind of
> confusion.

Understand. But we don't call it "m4u" anymore. I'd not like to use a
outdated name. For readable, I could add a comment like this:

{ .compatible = "mediatek,mt8186-iommu-mm", xx}, /* iommu-mm: m4u */

Is this ok for you?
Thanks.

> Thank you!
> 
> > > 
> > > Thanks,
> > > Angelo
> > > 
> > > >    	{ .compatible = "mediatek,mt8192-m4u", .data =
> > > > &mt8192_data},
> > > >    	{ .compatible = "mediatek,mt8195-iommu-infra", .data =
> > > > &mt8195_data_infra},
> > > >    	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data =
> > > > &mt8195_data_vdo},
> > > 
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
