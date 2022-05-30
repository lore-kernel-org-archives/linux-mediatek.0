Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6541C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWzh5YbStQu3nGlbwQwEdYEizhbM0FY+tgiBY2pkCwU=; b=aQ28FQVnXx5nsn
	kI2pge58kMLUSHzjfbu8XPC3OOxR5jEZqVX4b07N3YqZc4J2Ihr303oJwEBHpab+bOMXb1P6PPEPX
	8lRu0oS4eOasp6OII8MrqnTw4rcHJfwLPw3dxtqy6hXlOIVlN0qWGAu9e0UYkbJlX1/lY4WX7Tv4N
	tNw2wnkm98zjUwUvGL4HvmKQ8wYWITeSOk2PtP6Yk3xLdLGcaFbWAE7cr+5eT2AaZRxYLCJHKpHtu
	9wfZ8g6mgnAXErIdWp0QYLre3Kx8gQGG8ifTqrT65N0gH4ien4bUJxDfZkkffs0d0zSP/qf3t1q6q
	de7DGV7lMb3B5I481BaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaeh-005tmy-2j; Mon, 30 May 2022 08:21:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaeE-005tYo-Ry; Mon, 30 May 2022 08:21:12 +0000
X-UUID: 7fa7d12029c44c45848039faf7cc1a36-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:428f8100-ad08-4d42-84af-8335ef6a72be,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:7fb8fd47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 7fa7d12029c44c45848039faf7cc1a36-20220530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 563380311; Mon, 30 May 2022 01:21:05 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 01:21:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 16:21:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 16:21:02 +0800
Message-ID: <5253064d45064cc89d7c3c75d217b8fcb059766e.camel@mediatek.com>
Subject: Re: [PATCH v10 10/21] drm/mediatek: dpi: move hvsize_mask to SoC
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
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date: Mon, 30 May 2022 16:21:02 +0800
In-Reply-To: <20220523104758.29531-11-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-11-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_012110_958666_2C4814EC 
X-CRM114-Status: GOOD (  15.81  )
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
> Add flexibility by moving the hvsize mask to SoC specific config

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index bf098f36a466..6eeda222a973 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -129,6 +129,8 @@ struct mtk_dpi_conf {
>  	bool swap_input_support;
>  	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> (no shift) */
>  	u32 dimension_mask;
> +	/* HSIZE and VSIZE mask (no shift) */
> +	u32 hvsize_mask;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct
> mtk_dpi *dpi, bool inter)
>  
>  static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width,
> u32 height)
>  {
> -	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
> -	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> +	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
> +		     dpi->conf->hvsize_mask << HSIZE);
> +	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
> +		     dpi->conf->hvsize_mask << VSIZE);
>  }
>  
>  static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
> @@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
