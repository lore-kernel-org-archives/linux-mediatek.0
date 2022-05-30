Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pttxy3d77QQD1TSJzQFHgqtYSf8j1Qptf52SExIUTfI=; b=tmzVbX4MGRpWjP
	Y6ZIUu4ZCdmU4krufx/7mrCGVqwtIm4aeQHustYTfqv0YoDEs95f2mGtyuheRcwZFOPIdgzH+O1Qg
	RYzO9Jgd4Kcc5gSzRmzrSReqfBaBHxIEAiDdS/iESwZYoyrRqfOm1benOSTNtka4cegZZroHTPXM6
	PUmvqmjfbGbngjDl/VBVW8eV33T8uXPSa5KEF6Xdr1Bpt85OxAdD8QYeBH88ZTTuDtnkNogWOs4aM
	OtbYWl/SEo2mednuhwfoseMvt9/9KpPC6BVNXieRO1DnnjkEBQQhyYGi1niaGleKEq53UqqfU9Vad
	SAzIiNte/dHLgLzGDfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaz3-005yHk-2k; Mon, 30 May 2022 08:42:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvayq-005yE2-GG; Mon, 30 May 2022 08:42:29 +0000
X-UUID: 6f1785a1dfc94b0089073c09c29c49a3-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:609c8a44-0e2f-4b21-bfb7-2096a10638ad,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:62cafe47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 6f1785a1dfc94b0089073c09c29c49a3-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1280099886; Mon, 30 May 2022 01:42:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 01:39:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 30 May 2022 16:39:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 16:39:03 +0800
Message-ID: <76ddd49bb2bb46923900b085056ce22d7bfa0b0a.camel@mediatek.com>
Subject: Re: [PATCH v10 11/21] drm/mediatek: dpi: move swap_shift to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date: Mon, 30 May 2022 16:38:59 +0800
In-Reply-To: <20220523104758.29531-12-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-12-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_014228_574364_A0F737D8 
X-CRM114-Status: GOOD (  16.25  )
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

Hi, Guillaume:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> Add flexibility by moving the swap shift value to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6eeda222a973..6d4d8c6ec47d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>  	u32 dimension_mask;
>  	/* HSIZE and VSIZE mask (no shift) */
>  	u32 hvsize_mask;
> +	u32 channel_swap_shift;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct
> mtk_dpi *dpi,
>  		break;
>  	}
>  
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> CH_SWAP_MASK);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> >channel_swap_shift,
> +		     CH_SWAP_MASK);

From the definiton:

 #define CH_SWAP				0
+#define DPINTF_CH_SWAP			BIT(1)
 #define CH_SWAP_MASK			(0x7 << 0)
+#define DPINTF_CH_SWAP_MASK		(0x7 << 1)

This statement should be:

mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
>channel_swap_shift, CH_SWAP_MASK << dpi->conf->channel_swap_shift);

dpi->conf->channel_swap_shift is 1 for MT8195-DP_INTF and 0 for others.
And drop the definition of DPINTF_CH_SWAP and DPINTF_CH_SWAP_MASK,

Regards,
CK


>  }
>  
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> enable)
> @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
