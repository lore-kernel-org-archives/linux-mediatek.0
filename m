Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4490C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/YlwN3WY4BBGBbb5EkMADMHJS3eQWyJugOB6HXupgU=; b=d/sdHLHd4C/YIU
	z8koIc3KIkMpStQlnplhkYI/qnEK8c1SXye6Tgb0HiDvtCXQvR4NDkpImNFAhYY1YmbpNOJ69Eqxt
	zGuA33wpPlhvWuiXE/y9ZgS4Oi5eazdlifTu6KcI7im+/Uj9sVirStwSN0jf2nnoihhPp/3nC84pf
	kJf4wUV98gpNJWZmKK9cfbiDrwlJTAOD253fCEw0awdzjFtPILVmJfKz6cqIj841P+o2D/GxvLeVb
	Siw6ghboFcHdG0TK8p4PcST3JQm7G4ESyJG43pTqikvHugxIN4EphlzcstUJGnn2uV3szjgzfsTSD
	HhroJOjkAU+ed/ctnEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkz6-007t1o-UY; Mon, 28 Mar 2022 08:44:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkyu-007syn-Ip; Mon, 28 Mar 2022 08:44:09 +0000
X-UUID: 06fd1fa2580c449f8616ec465239f03a-20220328
X-UUID: 06fd1fa2580c449f8616ec465239f03a-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 398978300; Mon, 28 Mar 2022 01:44:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 01:35:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 28 Mar 2022 16:35:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 16:35:06 +0800
Message-ID: <90baead6cd4cef119223e8bad13f6708bf6cc1a5.camel@mediatek.com>
Subject: Re: [PATCH v9 14/22] drm/mediatek: dpi: move the csc_enable bit to
 SoC config
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
Date: Mon, 28 Mar 2022 16:35:06 +0800
In-Reply-To: <20220327223927.20848-15-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-15-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_014408_634530_6668D84D 
X-CRM114-Status: GOOD (  14.75  )
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
> Add flexibility by moving the csc_enable bit to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 40254cd9d168..eb969c5c5c2e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -133,6 +133,7 @@ struct mtk_dpi_conf {
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
>  	u32 yuv422_en_bit;
> +	u32 csc_enable_bit;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct
> mtk_dpi *dpi, bool enable)
>  
>  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool
> enable)
>  {
> -	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0,
> CSC_ENABLE);
> +	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit :
> 0,
> +		     dpi->conf->csc_enable_bit);
>  }
>  
>  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool
> enable)
> @@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
