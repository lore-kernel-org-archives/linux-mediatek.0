Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E98EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 05:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XmTdBIlkQWHYPNVHxfaE0gkLPh/AEXpOsG03bvzZPU=; b=AWG2xdZvhA1VNxfm1y7fE3/4mA
	vAUvhDL2wCftdd6HBgM7Bzxer3BG39f17lmwAJ3MJplBmY718LrtUWTPsmyBSkMjp/rIKpv0qrBf1
	aH0SAHIwM2jlvjqtBL38XYO7C8WEC7qCoCzXdBr8j8HyZKEnSe1cLFO0U//DELpRQZC7Qv266K1LM
	VVswdyU2lxqEEQscPIvKn8eVFGIaJ1d4j6FhsgXNJn3wGIP2noIldwRjeyJSa3q7NCMbI7WuNFieP
	JTZ6E/4oEbEUxQNNqGS/mNMPbrephmWVuwxVgila7rKhemGYs0dGMYW1SgUqlcGUAiQ7R0fbs0eaG
	JH0fnipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3WqO-003nFu-E2; Tue, 21 Jun 2022 05:54:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3WqL-003nCh-Fh; Tue, 21 Jun 2022 05:54:31 +0000
X-UUID: 0a73cfa9124747588d777cee0203c5ab-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:937265fe-884e-453e-a6fe-cc41af6bbb46,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:81d613ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0a73cfa9124747588d777cee0203c5ab-20220620
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 103875147; Mon, 20 Jun 2022 22:54:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 22:54:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 13:54:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 13:54:22 +0800
Message-ID: <cb1ea849cd2fc5a0364944610e4719cb3c8c82f8.camel@mediatek.com>
Subject: Re: [PATCH v12 11/14] drm/mediatek: dpi: Add tvd_clk enable/disable
 flow
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 13:54:22 +0800
In-Reply-To: <9b7e78729878115768f61929feac8fc9ed6b4f29.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-12-rex-bc.chen@mediatek.com>
	 <218de671054a2c02d47a0bb4a31a0b07d24d7eee.camel@mediatek.com>
	 <7bffe5226a80474f150ef67e36d2b75ea8e8a9d8.camel@mediatek.com>
	 <6af179e2995ce2f4f2e7c72f10516afb0c1604a3.camel@mediatek.com>
	 <4a873de158868368818c00fbfee1a03f620ad8c9.camel@mediatek.com>
	 <e8ec7c5f8a750a1748b482b040c6efafc1149401.camel@mediatek.com>
	 <9b7e78729878115768f61929feac8fc9ed6b4f29.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_225429_581191_23B901B8 
X-CRM114-Status: GOOD (  46.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rex:

On Tue, 2022-06-21 at 13:47 +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-21 at 12:08 +0800, CK Hu wrote:
> > Hi, Rex:
> > 
> > On Tue, 2022-06-21 at 11:50 +0800, Rex-BC Chen wrote:
> > > On Tue, 2022-06-21 at 11:45 +0800, CK Hu wrote:
> > > > On Tue, 2022-06-21 at 11:11 +0800, Rex-BC Chen wrote:
> > > > > On Tue, 2022-06-21 at 10:55 +0800, CK Hu wrote:
> > > > > > Hi, Bo-Chen:
> > > > > > 
> > > > > > On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > > > > > > We should enable/disable tvd_clk when power_on/power_off,
> > > > > > > so
> > > > > > > add
> > > > > > > this
> > > > > > > patch to do this.
> > > > > > 
> > > > > > Without this patch, what would happen?
> > > > > > It seems this patch is redundant for these SoCs:
> > > > > > 
> > > > > > static const struct of_device_id mtk_dpi_of_ids[] = {
> > > > > > 	{ .compatible = "mediatek,mt2701-dpi",
> > > > > > 	  .data = &mt2701_conf,
> > > > > > 	},
> > > > > > 	{ .compatible = "mediatek,mt8173-dpi",
> > > > > > 	  .data = &mt8173_conf,
> > > > > > 	},
> > > > > > 	{ .compatible = "mediatek,mt8183-dpi",
> > > > > > 	  .data = &mt8183_conf,
> > > > > > 	},
> > > > > > 	{ .compatible = "mediatek,mt8192-dpi",
> > > > > > 	  .data = &mt8192_conf,
> > > > > > 	},
> > > > > > 	{ },
> > > > > > };
> > > > > > 
> > > > > > Regards,
> > > > > > CK
> > > > > > 
> > > > > 
> > > > > Hello CK,
> > > > > 
> > > > > IMO, this is a bug fix patch. From the usage of clock, if we
> > > > > want
> > > > > to
> > > > > use it, we should enable it . Therefore, I think we should
> > > > > add
> > > > > this
> > > > > and
> > > > > I will add a fix tag for this patch.
> > > > 
> > > > I think mt8173 chromebook use this driver for HDMI output. So
> > > > mt8173
> > > > chromebook HDMI could not work normally?
> > > > 
> > > > Regards,
> > > > CK
> > > > 
> > > 
> > > Hmm..
> > > I am not sure about this. But without this patch, dpi is also
> > > working
> > > in mt8183/mt8192. It may be related to the ccf driver. But
> > > anyway,
> > > I
> > > think we should do this whether ccf driver helps us to enable
> > > this
> > > clock.
> > 
> > OK. So, could you help to fix the bug in ccf? If HDMI is disabled
> > but
> > ccf still turn on this clock, the power would be wasted.
> > 
> > Regards,
> > CK
> > 
> 
> I am also testing if we don't have this patch and it also "works"
> (dpintf is working fine).
> do you think we need this patch or just drop this?
> 
> For the ccf driver, I am not familiar to ccf and also not a expert of
> ccf.
> It just a guest for this. I am not sure whether it's a "bug" or just
> a.
> And I think it's not the purpose of this series. If there is any
> issue,
> I think we will fix it in the future.

Because we have no idea how this works, I think it's better to drop
this patch.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> > > 
> > > BRs,
> > > Bo-Chen
> > > 
> > > > > 
> > > > > BRs,
> > > > > Bo-Chen
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
> > > > > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > > index 2717b1741b7a..f83ecb154457 100644
> > > > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > > @@ -455,6 +455,7 @@ static void mtk_dpi_power_off(struct
> > > > > > > mtk_dpi
> > > > > > > *dpi)
> > > > > > >  	mtk_dpi_disable(dpi);
> > > > > > >  	clk_disable_unprepare(dpi->pixel_clk);
> > > > > > >  	clk_disable_unprepare(dpi->engine_clk);
> > > > > > > +	clk_disable_unprepare(dpi->tvd_clk);
> > > > > > >  }
> > > > > > >  
> > > > > > >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > > > > @@ -464,10 +465,16 @@ static int mtk_dpi_power_on(struct
> > > > > > > mtk_dpi
> > > > > > > *dpi)
> > > > > > >  	if (++dpi->refcount != 1)
> > > > > > >  		return 0;
> > > > > > >  
> > > > > > > +	ret = clk_prepare_enable(dpi->tvd_clk);
> > > > > > > +	if (ret) {
> > > > > > > +		dev_err(dpi->dev, "Failed to enable tvd pll:
> > > > > > > %d\n",
> > > > > > > ret);
> > > > > > > +		goto err_refcount;
> > > > > > > +	}
> > > > > > > +
> > > > > > >  	ret = clk_prepare_enable(dpi->engine_clk);
> > > > > > >  	if (ret) {
> > > > > > >  		dev_err(dpi->dev, "Failed to enable engine
> > > > > > > clock:
> > > > > > > %d\n", ret);
> > > > > > > -		goto err_refcount;
> > > > > > > +		goto err_engine;
> > > > > > >  	}
> > > > > > >  
> > > > > > >  	ret = clk_prepare_enable(dpi->pixel_clk);
> > > > > > > @@ -484,6 +491,8 @@ static int mtk_dpi_power_on(struct
> > > > > > > mtk_dpi
> > > > > > > *dpi)
> > > > > > >  
> > > > > > >  err_pixel:
> > > > > > >  	clk_disable_unprepare(dpi->engine_clk);
> > > > > > > +err_engine:
> > > > > > > +	clk_disable_unprepare(dpi->tvd_clk);
> > > > > > >  err_refcount:
> > > > > > >  	dpi->refcount--;
> > > > > > >  	return ret;
> > > > > > 
> > > > > > 
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 


