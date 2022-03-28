Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B36C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNwiv7FXyDTbv+1ahsZ8rt+3IiHk2ifjJwxLj4BQ2XQ=; b=qFbmCk0eld6duY
	HSv+W5fxl8DLr8TH5wsbXD99yuxRYJYSNYU2XrI2wHPYUFgYYfDn3+3KeU2suZZrwjmPmD7h7ajD0
	ZyVuZ9i6HDQs9etj2WZ51KrGW03TGiBC5sP3np+0l6KnkBM8mT+P7VFNOp/V0t2r1A4opXhQLEX3y
	uS7AiHurvbbhfelP2GRIksuKTzI/h0YIuMggeenJzWG6L+JswkALEmF3lvmFaFCad8Uy+aHpHhbOK
	b3b6rgKNM/Y5uo3SLbNMazjOW3/mnVzJQEZdS4qFCM4GU3Wx5xEdQNa43p/cmV9GpQmisajzoBG4G
	zcIMfIdQWwnb4KOz7gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkzI-007t7w-Kz; Mon, 28 Mar 2022 08:44:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkyv-007szM-DR; Mon, 28 Mar 2022 08:44:11 +0000
X-UUID: 65266a1a07b046648f95175f217d9202-20220328
X-UUID: 65266a1a07b046648f95175f217d9202-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1493805364; Mon, 28 Mar 2022 01:44:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 01:34:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Mar 2022 16:34:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 16:34:00 +0800
Message-ID: <84743284794785130cb1be6860c334053e9fecf9.camel@mediatek.com>
Subject: Re: [PATCH v9 11/22] drm/mediatek: dpi: move hvsize_mask to SoC config
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <airlied@linux.ie>,
 <angelogioacchino.delregno@collabora.com>, <chunfeng.yun@mediatek.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>, <daniel@ffwll.ch>,
 <deller@gmx.de>, <jitao.shi@mediatek.com>, <kishon@ti.com>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <matthias.bgg@gmail.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <tzimmermann@suse.de>, <vkoul@kernel.org>
CC: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-phy@lists.infradead.org>, <markyacoub@google.com>
Date: Mon, 28 Mar 2022 16:34:00 +0800
In-Reply-To: <20220327223927.20848-12-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-12-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_014409_466512_2D64D60A 
X-CRM114-Status: GOOD (  14.20  )
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

On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
> Add flexibility by moving the hvsize mask to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
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

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
