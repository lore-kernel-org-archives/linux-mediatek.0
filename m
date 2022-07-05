Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaCN5ex+QL3gZbo94ibbsuMW+vMmqZe5fp0nk/S8Gf4=; b=L1UycR7duYjxx1jAC9hp86+4yt
	U3L8noLegyGUQ2fDkHytmYxVzpSaiJ/cI3JS03U3ojwza+wvigBh4RitjcKktlS/B5lbcKWRneH3X
	KNwQvDCKvty4CKfkfpw9/j4113nvkI+BdhlFYGhYpQJ+YfuvumlTGW/4fPxAxhJ1oVTrb7khXbKb+
	MtHosEw6KBGGcJH/Gjzo/OwgQHfRXcZrzUpfapBQlYi8IN/G/uIhOmIRsknU4y7AI1WDvn7bOzvpU
	uu3jxiEQN9/69iGkohF5SqypDpQx2ssalM3GyR5LAUjdylv6ocryH25G1D86dIL3TBIF8q71uF7Qh
	4hUGurMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8aP7-00ETvG-Hd; Tue, 05 Jul 2022 04:43:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8aOv-00ETpY-ET; Tue, 05 Jul 2022 04:43:07 +0000
X-UUID: 7df66c3f34da426ca7f56887e87ddcc7-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:9bc9e19e-8cc1-4c52-94e6-06ee8f319a38,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:cac09ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7df66c3f34da426ca7f56887e87ddcc7-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1160972516; Mon, 04 Jul 2022 21:42:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 11:52:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:52:19 +0800
Message-ID: <7d1edf411e98c6998a18e7bb50c62074179a79e1.camel@mediatek.com>
Subject: Re: [PATCH v15 08/16] drm/mediatek: dpi: move dimension mask to SoC
 config
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
Date: Tue, 5 Jul 2022 11:52:19 +0800
In-Reply-To: <20220701035845.16458-9-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-9-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_214305_540926_8353184E 
X-CRM114-Status: GOOD (  16.19  )
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
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Add flexibility by moving the dimension mask to the SoC config

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index ba871c347d15..586527458064 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -122,6 +122,8 @@ struct mtk_dpi_yc_limit {
>   * @num_output_fmts: Quantity of supported output formats.
>   * @is_ck_de_pol: Support CK/DE polarity.
>   * @swap_input_support: Support input swap function.
> + * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> VSYNC_PORCH
> + *		    (no shift).
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -132,6 +134,7 @@ struct mtk_dpi_conf {
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
> +	u32 dimension_mask;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -160,30 +163,30 @@ static void mtk_dpi_disable(struct mtk_dpi
> *dpi)
>  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync)
>  {
> -	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> -		     sync->sync_width << HPW, HPW_MASK);
> -	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> -		     sync->back_porch << HBP, HBP_MASK);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
> +		     dpi->conf->dimension_mask << HPW);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
> +		     dpi->conf->dimension_mask << HBP);
>  	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> -		     HFP_MASK);
> +		     dpi->conf->dimension_mask << HFP);
>  }
>  
>  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync,
>  				 u32 width_addr, u32 porch_addr)
>  {
> -	mtk_dpi_mask(dpi, width_addr,
> -		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> -		     VSYNC_WIDTH_MASK);
>  	mtk_dpi_mask(dpi, width_addr,
>  		     sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
>  		     VSYNC_HALF_LINE_MASK);
> +	mtk_dpi_mask(dpi, width_addr,
> +		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> +		     dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> -		     VSYNC_BACK_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_BACK_PORCH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> -		     VSYNC_FRONT_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_FRONT_PORCH_SHIFT);
>  }
>  
>  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> @@ -808,6 +811,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt2701_conf = {
> @@ -819,6 +823,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8183_conf = {
> @@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8192_conf = {
> @@ -839,6 +845,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static int mtk_dpi_probe(struct platform_device *pdev)


