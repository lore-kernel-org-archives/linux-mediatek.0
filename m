Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 02:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lpwgcAgY9oIfuqy2h1TxDrqzDVa6+kVVqnwzyN8og4=; b=j35BfoHTto4E6V
	cS4gYCoF+S9TZaIBQPcqWyMDg7YuFxT0izf9Z97HP4o0qVDE9GiWxUNFZkar2FPFT3XF0hit0hhUR
	UcRN7M17K1YxyK0iuHypwTPxY7NKtbddptYvdGZnjvCFIJrHCDftW8V15qPpSkU/dSJohVzW9gV0J
	6aPwVtee6rQJJk/f0n7G7LapbTn3AfsxrbnH2OSJf12lMOagpy5f4WjKIKcaLtTtXvU+gwRl74PD5
	RHTaLyLbD1eRUAFEoB/aEVpM8afaBSAgqpNHklVTXgmxb5Kb8jo25MmOfpzpdEzZpUH6ZJdAF7Tle
	jBZgk0n/PzZ2N8lWtF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPN6-004CzR-OK; Tue, 07 Jun 2022 02:55:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPMu-004Cw3-I1; Tue, 07 Jun 2022 02:54:57 +0000
X-UUID: 2dbee89ab0334032920d8977e330f820-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6190c789-d1f8-42e5-85fd-1e0d2a176740,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:6a48677e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 2dbee89ab0334032920d8977e330f820-20220606
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 951487961; Mon, 06 Jun 2022 19:54:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 19:54:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:54:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 10:54:27 +0800
Message-ID: <6dcb95f2f91d91fc8fd87a86ba988eee0168df19.camel@mediatek.com>
Subject: Re: [PATCH v10 07/21] drm/mediatek: dpi: implement a CK/DE pol
 toggle in SoC config
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 10:54:27 +0800
In-Reply-To: <356624f3283f9203007ab21bedf15744d86e16f8.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-8-granquet@baylibre.com>
	 <356624f3283f9203007ab21bedf15744d86e16f8.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_195456_633773_53B6960D 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, 2022-05-30 at 15:44 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Adds a bit of flexibility to support SoCs without CK/DE pol support
> 
> It seems that DP_INTF has no CK/DE pol function. If so, could you
> explain why DP_INTF has this difference with DPI?
> 
> Regards,
> CK
> 

Hello CK,

Dp_intf does not support CK/DE polarity because the polarity
information is not used for eDP and DP while dp_intf is only for eDP
and DP.

I will add this in commit message in next version.

BRs,
Bo-Chen

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4746eb342567..545a1337cc89 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
> >  	bool edge_sel_en;
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> > +	bool is_ck_de_pol;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi
> > *dpi,
> >  			       struct mtk_dpi_polarities *dpi_pol)
> >  {
> >  	unsigned int pol;
> > +	unsigned int mask;
> >  
> > -	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL)
> > > 
> > 
> > -	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL)
> > > 
> > 
> > -	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > HSYNC_POL) |
> > +	mask = HSYNC_POL | VSYNC_POL;
> > +	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > HSYNC_POL) |
> >  	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> > VSYNC_POL);
> > -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
> > -		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
> > +	if (dpi->conf->is_ck_de_pol) {
> > +		mask |= CK_POL | DE_POL;
> > +		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
> > +			0 : CK_POL) |
> > +		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
> > +			0 : DE_POL);
> > +	}
> > +
> > +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
> >  }
> >  
> >  static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
> > @@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.max_clock_khz = 300000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.max_clock_khz = 100000,
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.is_ck_de_pol = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
