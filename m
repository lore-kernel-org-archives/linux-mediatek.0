Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUGmbRnSiQOO6BgryuGM4Sm81TWjJH27G7E4OUj7eP4=; b=2s+ryBD6Shfixg
	pgaIVH0i9th1bma9VfpOUUlTWMYWQjTNf9thnz1J2vy/abFTSnuX5FmA/FUmyCezna/omzkczAcRr
	Tj2WoKxFznUJ5oCtou1cIQNLalb4XF6y80/4NOwEtlnROz2KL1TZV1RJ8WSZu6N8/E0ISeI54ee9Y
	UMX22e7sVrTNMiMWsL6eDtP3Hd4B5XzhC9PO02Llx9ZfWRZMP+mBdsN9Ijx0bN67R8WgrvT8aknfE
	sUoxBij7Oe8wJP0RZvRMMMO+ZhRIh8WKcDG5Yn5Tc0Grgy4K3NzqVBCyCffMMug89iEDlI1W+JJ1l
	1s94cq+id2l4+gIn6M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjpE-003Ba8-Uh; Thu, 02 Jun 2022 12:21:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjoy-003BUK-OA; Thu, 02 Jun 2022 12:21:02 +0000
X-UUID: 572106883553470eb9c8ff6587268fdd-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2ae712af-c170-4d23-9bc6-0a550e475d0a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:273fe937-9855-4915-a138-f5705f1f3d02,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 572106883553470eb9c8ff6587268fdd-20220602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2073146982; Thu, 02 Jun 2022 05:20:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 05:19:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 20:19:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 20:19:05 +0800
Message-ID: <1b2c534c189944b388ff7ca9adc013e8878fe37e.camel@mediatek.com>
Subject: Re: [PATCH v10 11/21] drm/mediatek: dpi: move swap_shift to SoC
 config
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
Date: Thu, 2 Jun 2022 20:19:05 +0800
In-Reply-To: <76ddd49bb2bb46923900b085056ce22d7bfa0b0a.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-12-granquet@baylibre.com>
	 <76ddd49bb2bb46923900b085056ce22d7bfa0b0a.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_052100_821219_9507C72B 
X-CRM114-Status: GOOD (  22.92  )
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

On Mon, 2022-05-30 at 16:38 +0800, CK Hu wrote:
> Hi, Guillaume:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Add flexibility by moving the swap shift value to SoC specific
> > config
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6eeda222a973..6d4d8c6ec47d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
> >  	u32 dimension_mask;
> >  	/* HSIZE and VSIZE mask (no shift) */
> >  	u32 hvsize_mask;
> > +	u32 channel_swap_shift;
> >  	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> > @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct
> > mtk_dpi *dpi,
> >  		break;
> >  	}
> >  
> > -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> > CH_SWAP_MASK);
> > +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> > > channel_swap_shift,
> > 
> > +		     CH_SWAP_MASK);
> > From the definiton:
> 
>  #define CH_SWAP				0
> +#define DPINTF_CH_SWAP			BIT(1)
>  #define CH_SWAP_MASK			(0x7 << 0)
> +#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
> 
> This statement should be:
> 
> mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> > channel_swap_shift, CH_SWAP_MASK << dpi->conf->channel_swap_shift);
> 
> dpi->conf->channel_swap_shift is 1 for MT8195-DP_INTF and 0 for
> others.
> And drop the definition of DPINTF_CH_SWAP and DPINTF_CH_SWAP_MASK,
> 
> Regards,
> CK
> 

Hello CK,

I have checked this with Jitao,
it's all shift 1 bit including mask and value.

I will modify like this:
#define DPINTF_CH_SWAP 1

mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
val << dpi->conf-> channel_swap_shift,
CH_SWAP_MASK << dpi->conf->channel_swap_shift);


BR,
Bo-Chen
> 
> >  }
> >  
> >  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> > enable)
> > @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> > @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.swap_input_support = true,
> >  	.dimension_mask = HPW_MASK,
> >  	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> >  	.limit = &mtk_dpi_limit,
> >  };
> >  
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
