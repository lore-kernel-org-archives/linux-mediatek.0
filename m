Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 01:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygXCtjr4J+VqraubOEpyArpYhWshzpELmZkc5KeD4Do=; b=pMSscHOnXualRhP4GeOFd95y3P
	Hf3c1Sqakgxp65ldFcObxQvDYEdIAvxs1dvrVyK6aDvMr1MCm8OvpVFcuzhcAowG1aOwhEyDzfUoe
	3GknYDEYSf154F3/HUCsfFptIuxdQLJmaWcws+NQLtijsmztXc8qYySzAwxXXf+FVE4qfwi4hZd2t
	4JJzBeEb9LlyGJo4JXFCE9/UA0CNoRL4t0vTwknMlRGAMWpkpT+WIbbsPFGT1m1RuTBFXHFMO3ltB
	xJM2osKW5rObsXIH3D0TB3yc21PCh5vICWlHtwARXidf/FUF1PPJM/IE8WfCFCGwF5EDKErgB9mDt
	vSwJyjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Svj-0037m8-RL; Tue, 21 Jun 2022 01:43:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Sve-0037ka-87; Tue, 21 Jun 2022 01:43:45 +0000
X-UUID: 7d5898fb5cce49318d9d55032bd400f0-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:90f0a7bb-27c2-4610-8ff4-c51a57f1263f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:f86c952d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7d5898fb5cce49318d9d55032bd400f0-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 856355489; Mon, 20 Jun 2022 18:42:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 18:40:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 09:40:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 09:40:24 +0800
Message-ID: <15cb231934de2f69db1c64cb2aa8bc8704b7201b.camel@mediatek.com>
Subject: Re: [PATCH v12 02/14] drm/mediatek: dpi: Add support for
 quantization range
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 09:40:24 +0800
In-Reply-To: <20220620121028.29234-3-rex-bc.chen@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_184342_324969_8370A7E0 
X-CRM114-Status: GOOD (  18.25  )
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

Hi, Bo-Chen:

On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> For RGB colorimetry, CTA-861 support both limited and full range data
> when receiving video with RGB color space.
> We use drm_default_rgb_quant_range() to determine the correct
> setting.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 34 ++++++++++++++++++--------
> ----
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index e61cd67b978f..21ad5623b568 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -235,16 +235,30 @@ static void mtk_dpi_config_fb_size(struct
> mtk_dpi *dpi, u32 width, u32 height)
>  	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
>  }
>  
> -static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
> -					 struct mtk_dpi_yc_limit
> *limit)
> +static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
>  {
> -	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
> +	struct mtk_dpi_yc_limit limit;
> +
> +	if (drm_default_rgb_quant_range(&dpi->mode) ==
> +	    HDMI_QUANTIZATION_RANGE_LIMITED) {
> +		limit.y_bottom = 0x10;
> +		limit.y_top = 0xfe0;
> +		limit.c_bottom = 0x10;
> +		limit.c_top = 0xfe0;
> +	} else {
> +		limit.y_bottom = 0;
> +		limit.y_top = 0xfff;
> +		limit.c_bottom = 0;
> +		limit.c_top = 0xfff;
> +	}
> +
> +	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit.y_bottom << Y_LIMINT_BOT,
>  		     Y_LIMINT_BOT_MASK);
> -	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
> +	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit.y_top << Y_LIMINT_TOP,
>  		     Y_LIMINT_TOP_MASK);
> -	mtk_dpi_mask(dpi, DPI_C_LIMIT, limit->c_bottom << C_LIMIT_BOT,
> +	mtk_dpi_mask(dpi, DPI_C_LIMIT, limit.c_bottom << C_LIMIT_BOT,
>  		     C_LIMIT_BOT_MASK);
> -	mtk_dpi_mask(dpi, DPI_C_LIMIT, limit->c_top << C_LIMIT_TOP,
> +	mtk_dpi_mask(dpi, DPI_C_LIMIT, limit.c_top << C_LIMIT_TOP,
>  		     C_LIMIT_TOP_MASK);
>  }
>  
> @@ -449,7 +463,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  				    struct drm_display_mode *mode)
>  {
> -	struct mtk_dpi_yc_limit limit;
>  	struct mtk_dpi_polarities dpi_pol;
>  	struct mtk_dpi_sync_param hsync;
>  	struct mtk_dpi_sync_param vsync_lodd = { 0 };
> @@ -484,11 +497,6 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
>  		pll_rate, vm.pixelclock);
>  
> -	limit.c_bottom = 0x0010;
> -	limit.c_top = 0x0FE0;
> -	limit.y_bottom = 0x0010;
> -	limit.y_top = 0x0FE0;
> -
>  	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
>  	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
>  	dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
> @@ -536,7 +544,7 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	else
>  		mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
>  
> -	mtk_dpi_config_channel_limit(dpi, &limit);
> +	mtk_dpi_config_channel_limit(dpi);
>  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
>  	mtk_dpi_config_yc_map(dpi, dpi->yc_map);


