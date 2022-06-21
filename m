Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16530C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 06:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFRfH4Y5EFBC/+4o8CHbHhvPYcY3haLmHh1pYx25onw=; b=SLz12AFn3odg9c29jEqX/gzY1M
	K9ZIKYTf/phOc5H8xamHv6NAOf6oUh6ZZ4n2IgTWkHBO5RfERiqnqSnqY5lWFx2siaMAP5qLcAIxE
	Uv/0y7xoS6gM6Qm0/UNlmfRPW8WzZSEJjbELB1I0QrOmhW9A+lgwsp2I11R1ox0YoqIa1V3/i+XdK
	x5jsJ7CWc+CcXXLN1ThKx+6rtxubuFXSEa5E7SKgzE6TFZ88httpzm4vRbypoqPhaGzZSEcf3t1ES
	b6UjxBegaH1KiHPl0ytZXQDALMP2QMPuDqQf10B5SQpSls48W2bdv9zo8I9ivPrqffN4BY81eyCgS
	irudg5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3X3Z-003pTG-Lz; Tue, 21 Jun 2022 06:08:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3X3W-003pSP-5i; Tue, 21 Jun 2022 06:08:07 +0000
X-UUID: b3939232526a468c9ac2d6720fd62870-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a6f41225-7e48-45db-b6ee-ef23d6be878d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:654b0938-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b3939232526a468c9ac2d6720fd62870-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 264874815; Mon, 20 Jun 2022 23:08:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 23:02:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 14:02:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 14:02:30 +0800
Message-ID: <0d35d7b6e0677b6eb1118c5a180229bfbdc77e7b.camel@mediatek.com>
Subject: Re: [PATCH v12 13/14] drm/mediatek: dpi: Only enable dpi after the
 bridge is enabled
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 14:02:30 +0800
In-Reply-To: <f8915cb4af91375dc9d7fc9c51f04863dd3e97dd.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-14-rex-bc.chen@mediatek.com>
	 <f8915cb4af91375dc9d7fc9c51f04863dd3e97dd.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_230806_264755_7B3D737E 
X-CRM114-Status: GOOD (  21.87  )
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

On Tue, 2022-06-21 at 11:18 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Enabling the dpi too early causes glitches on screen.
> > 
> > Move the call to mtk_dpi_enable() at the end of the bridge_enable
> > callback to ensure everything is setup properly before enabling
> > dpi.
> > 
> > Fixes: f89c696e7f63 ("drm/mediatek: mtk_dpi: Convert to bridge
> > driver")
> 
> I think this problem happen in the first patch [1].
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=mediatek-drm-next&id=9e629c17aa8d7a75b8c1d99ed42892cd8ba7cdc4
> 
> Regards,
> CK
> 

ok, I will fix this.

BRs,
Bo-Chen

> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index fc76ccad0a82..220e9b18e2cd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -486,7 +486,6 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >  	if (dpi->pinctrl && dpi->pins_dpi)
> >  		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> >  
> > -	mtk_dpi_enable(dpi);
> >  	return 0;
> >  
> >  err_pixel:
> > @@ -731,6 +730,7 @@ static void mtk_dpi_bridge_enable(struct
> > drm_bridge *bridge)
> >  
> >  	mtk_dpi_power_on(dpi);
> >  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
> > +	mtk_dpi_enable(dpi);
> >  }
> >  
> >  static enum drm_mode_status
> 
> 


