Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D8AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 03:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRp4V+sno86DKEk6znxNEGKc9Lp65VZNjWRIt4zNvo0=; b=MRfXPdCCpFyLHL
	D5xhccBj8EWnX9mg7OH2PoF00cwZuOWvDJf8eD3VgFQltpXOrOYDF+/eXm8wseWdwx3CQr2T/iZtX
	nJiaO/TDXsrjv+wcubJAPDXZhJ8iWxDwi0fgISEnEEUfPO+BUVyUvTpEWhk+U1kNe9NrKHPQ5FbDn
	7lELf5rHADDunHR76USAnLJS3iImA1fYyvldcDwp2LSRS2jXA+gA0vR4aDEk5sjT9dxiI45yxpf6U
	L0PRqrEtu/ZHfYAQ4D3kITShUZ6tsq2oiMz0IsIitt47RijVfPlHnEd1urrim4JajyQurw1sL6exR
	ugjwOY0d2lQwuAQdCmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0adK-0010Pz-RC; Mon, 13 Jun 2022 03:20:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ad8-0010MA-Ux; Mon, 13 Jun 2022 03:20:45 +0000
X-UUID: 40e758a1f9da4d3eba12ebefba251532-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:bd144ae9-3214-41f7-8adc-8db22c522cfa,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:d54452c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 40e758a1f9da4d3eba12ebefba251532-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1194842458; Sun, 12 Jun 2022 20:20:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 20:12:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 11:12:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 11:12:33 +0800
Message-ID: <fc301b26d4e0fea003a9b6c2237eaca16a4929f6.camel@mediatek.com>
Subject: Re: [PATCH v10 08/21] drm/mediatek: dpi: implement a swap_input
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
Date: Mon, 13 Jun 2022 11:12:33 +0800
In-Reply-To: <2c88fd4c308e86536d5996b3f32f68d05d452e23.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-9-granquet@baylibre.com>
	 <2c88fd4c308e86536d5996b3f32f68d05d452e23.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_202043_037280_ED236F91 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon, 2022-05-30 at 15:50 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Adds a bit of flexibility to support SoCs without swap_input
> > support
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 545a1337cc89..454f8563efae 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> >  	bool is_ck_de_pol;
> > +	bool swap_input_support;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -378,18 +379,21 @@ static void
> > mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > -		mtk_dpi_config_swap_input(dpi, false);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> >  	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> >  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, true);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > -		mtk_dpi_config_swap_input(dpi, true);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, true);
> 
> As [1], please keep in touch with Mediatek engineer.
> 
> Regards,
> CK
> 
> [1] 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220218145437.18563-8-granquet@baylibre.com/
> 

Hello CK,

the reason is the hardware design of dp_intf does not support input
swap.
I will add this in commit message.

BRs,
Bo-Chen

> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >  	} else {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, false);
> > -		mtk_dpi_config_swap_input(dpi, false);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >  	}
> >  }
> > @@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
