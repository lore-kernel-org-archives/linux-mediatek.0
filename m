Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F55C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 05:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yEWoFW2JPgSQtCvCx9cMrhjbfavSP9aaLe0qALouRY=; b=G/giu9xmNHf9g92nac/3Vj/GBM
	5bBTOnZRX8rmZs4F/H2BoSrrtHPFvB7jgNZck0PpbBn5S0ILYh4rVekkgasIDJZPLSqFRgbFiuSnv
	9Q4sYM9BvgXE6L3ftpJlTiMQzvnvl2rpJReds3j5XgWV1D/g/grPLUtub7EOoQD7JIZC5mlNAEdGE
	t+hqsLrbWHhUF1ql3YSsyDOA8rvUNd5y0h/41/HlO1nGbbDaDt/g0nCo/mijWkCdAKlx+jkykYHqa
	lqYsOOM/ZVPnHDBXRiCTE03AJvfB9PS+5n50eGuMj3AiPt71fUWBcjZmrGYSopncU9uRVoUk0IhUO
	0A2dh3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8b3R-00Eesh-IB; Tue, 05 Jul 2022 05:24:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8b3H-00Eeq5-AY; Tue, 05 Jul 2022 05:24:48 +0000
X-UUID: 7789f0b00642464c9727178ab12cb9f1-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f44b2a7f-f830-47e0-9c99-21a7ea4bea25,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:de969fd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7789f0b00642464c9727178ab12cb9f1-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1368271228; Mon, 04 Jul 2022 22:24:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 13:24:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jul 2022 13:24:07 +0800
Message-ID: <ae8e981a660ff6375ef09dd7b6714bad27f55347.camel@mediatek.com>
Subject: Re: [PATCH v15 14/16] drm/mediatek: dpi: add config to support
 direct connection to dpi panels
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 13:24:07 +0800
In-Reply-To: <20220701035845.16458-15-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-15-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_222447_413809_48E41F3B 
X-CRM114-Status: GOOD (  14.85  )
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

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> MediaTek dpi supports direct connection to dpi panels while dp_intf
> does not
> support. Therefore, add a config "support_direct_pin" to control
> this.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 0a604bf68b1b..a65b85c4c8d5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -124,6 +124,7 @@ struct mtk_dpi_yc_limit {
>   * @is_ck_de_pol: Support CK/DE polarity.
>   * @swap_input_support: Support input swap function.
>   * @color_fmt_trans_support: Enable color format transfer.
> + * @support_direct_pin: IP supports direct connection to dpi panels.
>   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> VSYNC_PORCH
>   *		    (no shift).
>   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
> @@ -141,6 +142,7 @@ struct mtk_dpi_conf {
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
>  	bool color_fmt_trans_support;
> +	bool support_direct_pin;
>  	u32 dimension_mask;
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
> @@ -608,11 +610,13 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	mtk_dpi_config_channel_limit(dpi);
>  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> -	mtk_dpi_config_2n_h_fre(dpi);
> -	mtk_dpi_dual_edge(dpi);
> -	mtk_dpi_config_disable_edge(dpi);
> +	if (dpi->conf->support_direct_pin) {
> +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> +		mtk_dpi_config_2n_h_fre(dpi);
> +		mtk_dpi_dual_edge(dpi);
> +		mtk_dpi_config_disable_edge(dpi);
> +	}
>  	mtk_dpi_sw_reset(dpi, false);
>  
>  	return 0;
> @@ -870,6 +874,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.support_direct_pin = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> @@ -886,6 +891,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.support_direct_pin = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> @@ -901,6 +907,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.support_direct_pin = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> @@ -916,6 +923,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.support_direct_pin = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,


