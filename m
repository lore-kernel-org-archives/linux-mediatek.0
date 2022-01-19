Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825D9C4321E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/m0ljBQwHILpP8X80xJd/QK9U2rN+UwYIJXrBMerfg=; b=ior5YswbPBlM/1
	SoAc3q59GQBlijfZjLUQAgSqJh489MuDi7VUd0B7HyBvnb15uQ3bMFBk14gwyr+m2pgjSBERJKknx
	Z1ZNEXjWug0LYRa2CCufJDzlhB/EOBECM7rsajeM+xlIXnOrxoFA93PMePoO3J+YSkgW+YCbwPIq3
	NKQHoi/g5bhprMLxlteTG6KDZPXgS3WKAMAV6Dm2juQp/rVOrp3Qfzh5sFey6OSYQvlDEPXnLs8Rs
	6qp0t1iHVSW7l5WWQF3l1xLfKa6aSo/Zpd3PWLoA2Sswoev+Ha83idNhA5ByCA/3FkmQetEZZBhjG
	HlW+ArVhE1Y6msjNoCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA07i-003SeU-73; Wed, 19 Jan 2022 01:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA07c-003Sbc-Iy
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 01:50:50 +0000
X-UUID: 82c3512f77c84ac18996613125d0f60e-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=loKFebHGz/BmDABcJ3dFKYDhiPGe3uIvEzEgBOYg9lg=; 
 b=PKNH7bdoC6Dc1SQIEhrBJ+ia2qlk05Oki/1OzGw8kpgBpx2w+VC+hvUKNx3RILzK31UxTt2j/GQVf0R0m9+gofQyjWpaK2FcFDu36Qfte5A2i1tGSonu4W82FElFdNCn5HUXaxYvCPaaBSRdoJFlZLA5TrfzCVQijtE5Q7el1kY=;
X-UUID: 82c3512f77c84ac18996613125d0f60e-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1172676235; Tue, 18 Jan 2022 18:50:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 17:40:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 19 Jan 2022 09:40:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:40:40 +0800
Message-ID: <31f71b19e52983bfc7d78c304fff20b2917effda.camel@mediatek.com>
Subject: Re: [PATCH v2 2/4] spi: spi-mtk-nor: improve device table for
 adding more capabilities
From: Guochun Mao <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Zhang
 <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, "Chuanhong
 Guo" <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>
Date: Wed, 19 Jan 2022 09:40:40 +0800
In-Reply-To: <87dceb69-99f7-e730-490a-f8e792c807ac@collabora.com>
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
 <20220118142820.2729-3-guochun.mao@mediatek.com>
 <87dceb69-99f7-e730-490a-f8e792c807ac@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_175048_659910_A80B42FF 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, 2022-01-18 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/01/22 15:28, guochun.mao@mediatek.com ha scritto:
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > Define a structure for adding more capabilities.
> > Add a item extra_dummy_bit for new SoCs, due to design changed.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> > ---
> >   drivers/spi/spi-mtk-nor.c | 48 +++++++++++++++++++++++++++++++---
> > -----
> >   1 file changed, 39 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> > index 5c93730615f8..f5ff01f61f42 100644
> > --- a/drivers/spi/spi-mtk-nor.c
> > +++ b/drivers/spi/spi-mtk-nor.c
> > @@ -95,6 +95,17 @@
> >   
> >   #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt,
> > sp->spi_freq / 1000000)
> >   
> > +struct mtk_nor_caps {
> > +	u8 dma_bits;
> > +
> > +	/* extra_dummy_bit is adding for the IP of new SoCs.
> > +	 * Some new SoCs modify the timing of fetching registers'
> > values
> > +	 * and IDs of nor flash, they need a extra_dummy_bit which can
> > add
> > +	 * more clock cycles for fetching data.
> > +	 */
> 
> Thank you for this explaination. That was much appreciated.
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>


HI Angelo,

Thanks for your review, appreciate your efforts.
I'm glad to explain it clearly.

BR,
Guochun






_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
