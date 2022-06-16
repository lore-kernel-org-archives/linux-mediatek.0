Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75814C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYnBj5Sryv7WruEVgL+vu4MrpBJcxwCB7eutKg/9GKo=; b=1GmYRFN9vUzoxpy3mImixJCqLt
	AUpoaDxaickxOkeC/RjVg6nxRecORyrzuSmip9WzukUzfROHLagMP+wAeqa8RNqBVEFUCpS1z/XfC
	TKwCToUxwhuZBR3M836gqwx7XMVWkrUNPZ7ylow5s7T+n9facY5mqiNTEALqpiEazjNwjVFtllPct
	+jepeaoPW32zLjtBDCSMXp8UdxVr2MI9+miQ5Juh3erhkqLxXx4ARkz7RHnagrKuABaymUaw7AMeZ
	hOHdDpGPrGjVpkmoiHle5LttvXpk1Q8WVb8ltdv3n+5HFrKU5rRABQInvXqqfeT3uHPoL1hJU5xdv
	vYxzeFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1n6E-001wxj-5q; Thu, 16 Jun 2022 10:51:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1n6A-001ww8-J5; Thu, 16 Jun 2022 10:51:40 +0000
X-UUID: 915409cb1a3640a89a131d5adf95f4fe-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:f33b9e3c-849b-4a1c-acf3-67d8a9a0b192,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:33b1bf48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 915409cb1a3640a89a131d5adf95f4fe-20220616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 863167843; Thu, 16 Jun 2022 03:51:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 03:51:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 18:51:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 18:51:31 +0800
Message-ID: <bd0183b088c4c2849837f49b4b35b26d9079ac5f.camel@mediatek.com>
Subject: Re: [PATCH v11 12/12] drm/mediatek: dpi: Add matrix_sel helper
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
Date: Thu, 16 Jun 2022 18:51:31 +0800
In-Reply-To: <de65caa980c270e4dedcf134d45185d41cd4c0ae.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-13-rex-bc.chen@mediatek.com>
	 <de65caa980c270e4dedcf134d45185d41cd4c0ae.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_035138_696108_B386A26C 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, 2022-06-14 at 14:20 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Add a mtk_dpi_matrix_sel() helper to update the DPI_MATRIX_SET
> > register depending on the color format.
> 
> Why set DPI_MATRIX_SET? New feature or bug fix? What does this matrix
> work for?
> 
> Regards,
> CK
> 

Matrix selection is a new feature for both dpi and dpintf of MT8195.
I will add this in next version.

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 9668bd5dd14a..dc355a512963 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -387,6 +387,25 @@ static void mtk_dpi_config_disable_edge(struct
> > mtk_dpi *dpi)
> >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > EDGE_SEL_EN);
> >  }
> >  
> > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum
> > mtk_dpi_out_color_format format)
> > +{
> > +	u32 matrix_sel = 0;
> > +
> > +	switch (format) {
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > +		if (dpi->mode.hdisplay <= 720)
> > +			matrix_sel = 0x2;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > INT_MATRIX_SEL_MASK);
> > +}
> > +
> >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >  					enum mtk_dpi_out_color_format
> > format)
> >  {
> > @@ -394,6 +413,7 @@ static void mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > +		mtk_dpi_matrix_sel(dpi, format);
> >  		if (dpi->conf->swap_input_support)
> >  			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > @@ -401,6 +421,7 @@ static void mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, true);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > +		mtk_dpi_matrix_sel(dpi, format);
> >  		if (dpi->conf->swap_input_support)
> >  			mtk_dpi_config_swap_input(dpi, true);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > index f7f0272dbd6a..96c117202d0d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -230,4 +230,7 @@
> >  #define EDGE_SEL_EN			BIT(5)
> >  #define H_FRE_2N			BIT(25)
> >  
> > +#define DPI_MATRIX_SET		0xB4
> > +#define INT_MATRIX_SEL_MASK	(0x1F << 0)
> > +
> >  #endif /* __MTK_DPI_REGS_H */
> 
> 


